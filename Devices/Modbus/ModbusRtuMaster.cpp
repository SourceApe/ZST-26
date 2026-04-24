#include "ModbusRtuMaster.h"
#include <QDebug>
#include <QWriteLocker>
#include <QReadLocker>
#include <QThread>

#include "../ModbusDevices/DeviceDataHub.h"

ModbusRtuMaster::ModbusRtuMaster(QObject *parent)
    : QObject(parent)
{
    // 初始化创建 6 个端口
    for (int port = 0; port < 6; ++port) {
        m_client[port] = new QModbusRtuSerialMaster(this);
    }

    connect(&DeviceDataHub::instance(), &DeviceDataHub::writeHoldingRegRequested,
            this, &ModbusRtuMaster::onWriteHoldingRegRequested);
}

ModbusRtuMaster& ModbusRtuMaster::instance()
{
    static ModbusRtuMaster s_instance;
    return s_instance;
}

void ModbusRtuMaster::onWriteHoldingRegRequested(int port, int slave, int regAddr)
{
    quint16 value = getHoldingReg(port, slave, regAddr);
    writeHoldingReg(port, slave, regAddr, value);
}

bool ModbusRtuMaster::initPort(int portIndex, const QString& portName,
                               qint32 baudRate, QSerialPort::DataBits dataBits,
                               QSerialPort::Parity parity, QSerialPort::StopBits stopBits)
{
    if (portIndex < 0 || portIndex >= 6) return false;

    // 如果为空，自动重建
    if (!m_client[portIndex]) {
        m_client[portIndex] = new QModbusRtuSerialMaster(this);
    }

    auto* c = m_client[portIndex];

    c->setConnectionParameter(QModbusDevice::SerialPortNameParameter, portName);
    c->setConnectionParameter(QModbusDevice::SerialBaudRateParameter, baudRate);
    c->setConnectionParameter(QModbusDevice::SerialDataBitsParameter, dataBits);
    c->setConnectionParameter(QModbusDevice::SerialParityParameter, parity);
    c->setConnectionParameter(QModbusDevice::SerialStopBitsParameter, stopBits);

    bool ok = c->connectDevice();
    if (ok)
        qDebug() << "[MODBUS] 串口打开成功：" << portName;
    else
        emit modbusError(portIndex, c->errorString());
    return ok;
}

void ModbusRtuMaster::closeAllPorts()
{
    for (int i = 0; i < 6; ++i) {
        if (m_client[i]) {
            m_client[i]->disconnectDevice();
        }
    }
}

// ==============================
// 写单个线圈
// ==============================
bool ModbusRtuMaster::writeCoil(int portIndex, int serverAddr, int coilAddr, bool value)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::Coils, coilAddr, 1);
    u.setValue(0, value ? 0xFF00 : 0);
    auto* reply = c->sendWriteRequest(u, serverAddr);

    if (!reply) return false;
    connect(reply, &QModbusReply::finished, this, [=]() {
        if (reply->error() != QModbusDevice::NoError) {
            emit modbusError(portIndex, reply->errorString());
        }
        reply->deleteLater();
    });
    return true;
}

// ==============================
// ✅ 写保持寄存器（失败自动重建）
// ==============================
bool ModbusRtuMaster::writeHoldingReg(int portIndex, int serverAddr, int regAddr, quint16 value)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];

    if (!c || c->state() != QModbusDevice::ConnectedState) {
        qDebug() << "[MODBUS ERROR] 串口未连接：port" << portIndex;
        return false;
    }

    QModbusDataUnit u(QModbusDataUnit::HoldingRegisters, regAddr, 1);
    u.setValue(0, value);
    auto* reply = c->sendWriteRequest(u, serverAddr);

    if (!reply) {
        qDebug() << "[MODBUS ERROR] 发送失败，准备重建端口：" << portIndex;
        return false;
    }

    connect(reply, &QModbusReply::finished, this, [=]() {

        if (reply->error() != QModbusDevice::NoError) {
            qDebug() << "[MODBUS ERROR] 超时 → 重建端口：" << portIndex;
        } else {
            qDebug() << "[MODBUS OK] 写入成功：" << portIndex << value;
        }
        reply->deleteLater();

    });

    return true;
}

// ==============================
// 写多个保持寄存器
// ==============================
bool ModbusRtuMaster::writeMultiHoldingReg(int portIndex, int serverAddr, int startAddr, const QVector<quint16>& values)
{
    if (portIndex <0 || portIndex >=6 || values.isEmpty()) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::HoldingRegisters, startAddr, values.size());
    for (int i = 0; i < values.size(); ++i)
        u.setValue(i, values[i]);

    auto* reply = c->sendWriteRequest(u, serverAddr);
    if (!reply) return false;

    connect(reply, &QModbusReply::finished, this, [=]() {
        if (reply->error() != QModbusDevice::NoError)
            emit modbusError(portIndex, reply->errorString());
        reply->deleteLater();
    });
    return true;
}

// ==============================
// 读保持寄存器
// ==============================
bool ModbusRtuMaster::readHoldingReg(int portIndex, int serverAddr, int regAddr, int len)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::HoldingRegisters, regAddr, len);
    auto* reply = c->sendReadRequest(u, serverAddr);
    if (!reply) return false;

    connect(reply, &QModbusReply::finished, this, [=]() {
        if (reply->error() == QModbusDevice::NoError) {
            auto data = reply->result().values();
            QWriteLocker locker(&m_lock);
            for (int i = 0; i < data.size(); ++i) {
                int addr = regAddr + i;
                if (addr >= 0 && addr < 65536)
                    m_holdingReg[portIndex][serverAddr][addr] = data[i];
            }
            emit regDataReceived(portIndex, serverAddr, data);
        } else {
            emit modbusError(portIndex, reply->errorString());
        }
        reply->deleteLater();
    });
    return true;
}

// ==============================
// 读输入寄存器
// ==============================
bool ModbusRtuMaster::readInputReg(int portIndex, int serverAddr, int regAddr, int len)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::InputRegisters, regAddr, len);
    auto* reply = c->sendReadRequest(u, serverAddr);
    if (!reply) return false;

    connect(reply, &QModbusReply::finished, this, [=]() {
        if (reply->error() == QModbusDevice::NoError) {
            auto data = reply->result().values();
            QWriteLocker locker(&m_lock);
            for (int i = 0; i < data.size(); ++i) {
                int addr = regAddr + i;
                if (addr >= 0 && addr < 65536)
                    m_inputReg[portIndex][serverAddr][addr] = data[i];
            }
            emit regDataReceived(portIndex, serverAddr, data);
        } else {
            emit modbusError(portIndex, reply->errorString());
        }
        reply->deleteLater();
    });
    return true;
}

// ==============================
// 缓存读取（不变）
// ==============================
quint16 ModbusRtuMaster::getHoldingReg(int port, int slave, int addr)
{
    if (port <0 || port >=6 || slave <0 || slave >=256 || addr <0 || addr >=65536)
        return 0;
    QReadLocker locker(&m_lock);
    if (m_holdingReg[port][slave].size() <= addr)
        return 0;
    return m_holdingReg[port][slave][addr];
}

void ModbusRtuMaster::setHoldingReg(int port, int slave, int addr, quint16 value)
{
    if (port < 0 || port >= 6 || slave < 0 || slave >= 256 || addr < 0 || addr >= 65536)
        return;

    QWriteLocker locker(&m_lock);
    if (m_holdingReg[port][slave].size() <= addr) {
        m_holdingReg[port][slave].resize(addr + 1);
    }
    m_holdingReg[port][slave][addr] = value;
}

quint16 ModbusRtuMaster::getInputReg(int port, int slave, int addr)
{
    if (port <0 || port >=6 || slave <0 || slave >=256 || addr <0 || addr >=65536)
        return 0;
    QReadLocker locker(&m_lock);
    if (m_inputReg[port][slave].size() <= addr)
        return 0;
    return m_inputReg[port][slave][addr];
}
