#ifndef MODBUSRTUMASTER_H
#define MODBUSRTUMASTER_H

#include <QObject>
#include <QSerialPort>
#include <QModbusRtuSerialMaster>
#include <QModbusDataUnit>
#include <QModbusReply>
#include <QVector>
#include <QReadWriteLock>
#include <QMutex>

class ModbusRtuMaster : public QObject
{
    Q_OBJECT
public:
    static ModbusRtuMaster& instance();

    bool initPort(int portIndex, const QString& portName,
                  qint32 baudRate = QSerialPort::Baud9600,
                  QSerialPort::DataBits dataBits = QSerialPort::Data8,
                  QSerialPort::Parity parity = QSerialPort::NoParity,
                  QSerialPort::StopBits stopBits = QSerialPort::OneStop);

    void closeAllPorts();

    bool writeCoil(int portIndex, int serverAddr, int coilAddr, bool value);
    bool writeHoldingReg(int portIndex, int serverAddr, int regAddr, quint16 value);
    bool writeMultiHoldingReg(int portIndex, int serverAddr, int startAddr, const QVector<quint16>& values);
    bool readInputReg(int portIndex, int serverAddr, int regAddr, int len);
    bool readHoldingReg(int portIndex, int serverAddr, int regAddr, int len);

    // ==============================
    // 工业级缓存读取接口
    // ==============================
    quint16 getHoldingReg(int port, int slave, int addr);
    void setHoldingReg(int port, int slave, int addr, quint16 value);
    quint16 getInputReg(int port, int slave, int addr);

signals:
    void regDataReceived(int portIndex, int slaveAddr, const QVector<quint16>& data);
    void modbusError(int portIndex, const QString& errorMsg);

private slots:
    void onWriteHoldingRegRequested(int port, int slave, int regAddr);

private:
    explicit ModbusRtuMaster(QObject *parent = nullptr);

    QModbusRtuSerialMaster* m_client[6];

    // ==============================
    // 【工业标准三维缓存】
    // [串口][从机地址][寄存器地址] = 值
    // ==============================
    QVector<quint16> m_holdingReg[6][256];
    QVector<quint16> m_inputReg[6][256];

    QReadWriteLock m_lock;  // 线程安全
};

#endif
