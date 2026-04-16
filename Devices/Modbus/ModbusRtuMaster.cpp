#include "ModbusRtuMaster.h"
#include <QDebug>

ModbusRtuMaster::ModbusRtuMaster(QObject *parent)
    : QObject(parent)
{
    for (int i = 0; i < 6; ++i) {
        m_client[i] = new QModbusRtuSerialMaster(this);
    }
}

ModbusRtuMaster* ModbusRtuMaster::instance()
{
    static ModbusRtuMaster s_instance;
    return &s_instance;
}

bool ModbusRtuMaster::initPort(int portIndex, const QString& portName,
                               qint32 baudRate, QSerialPort::DataBits dataBits,
                               QSerialPort::Parity parity, QSerialPort::StopBits stopBits)
{
    if (portIndex < 0 || portIndex >= 6) return false;

    auto* c = m_client[portIndex];
    c->setConnectionParameter(QModbusDevice::SerialPortNameParameter, portName);
    c->setConnectionParameter(QModbusDevice::SerialBaudRateParameter, baudRate);
    c->setConnectionParameter(QModbusDevice::SerialDataBitsParameter, dataBits);
    c->setConnectionParameter(QModbusDevice::SerialParityParameter, parity);
    c->setConnectionParameter(QModbusDevice::SerialStopBitsParameter, stopBits);

    if(c->connectDevice()){
        qDebug() << "Modbus"<<portIndex<<"初始化成功："<<portName;
    }else{
        qDebug() << "Modbus"<<portIndex<<"初始化失败："<<c->errorString();
    }
    return c->connectDevice();
}

void ModbusRtuMaster::closeAllPorts()
{
    for (int i = 0; i < 6; ++i) {
        if (m_client[i]) m_client[i]->disconnectDevice();
    }
}

bool ModbusRtuMaster::writeCoil(int portIndex, int serverAddr, int coilAddr, bool value)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::Coils, coilAddr, 1);
    u.setValue(0, value ? 0xFF00 : 0);
    auto* reply = c->sendWriteRequest(u, serverAddr);
    if(reply) reply->deleteLater();
    return true;
}

bool ModbusRtuMaster::writeHoldingReg(int portIndex, int serverAddr, int regAddr, quint16 value)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::HoldingRegisters, regAddr, 1);
    u.setValue(0, value);
    auto* reply = c->sendWriteRequest(u, serverAddr);
    if(reply) reply->deleteLater();
    return true;
}

bool ModbusRtuMaster::readInputReg(int portIndex, int serverAddr, int regAddr, int len)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::InputRegisters, regAddr, len);
    auto* reply = c->sendReadRequest(u, serverAddr);
    if (!reply) return false;

    connect(reply, &QModbusReply::finished, this, [=](){
        if(reply->error() == QModbusDevice::NoError)
            emit regDataReceived(portIndex, reply->result().values());
        reply->deleteLater();
    });
    return true;
}

bool ModbusRtuMaster::readHoldingReg(int portIndex, int serverAddr, int regAddr, int len)
{
    if (portIndex <0 || portIndex >=6) return false;
    auto* c = m_client[portIndex];
    if (!c || c->state() != QModbusDevice::ConnectedState) return false;

    QModbusDataUnit u(QModbusDataUnit::HoldingRegisters, regAddr, len);
    auto* reply = c->sendReadRequest(u, serverAddr);
    if (!reply) return false;

    connect(reply, &QModbusReply::finished, this, [=](){
        if(reply->error() == QModbusDevice::NoError)
            emit regDataReceived(portIndex, reply->result().values());
        reply->deleteLater();
    });
    return true;
}
