#ifndef MODBUSRTUMASTER_H
#define MODBUSRTUMASTER_H

#include <QObject>
#include <QSerialPort>
#include <QModbusRtuSerialMaster>   // ✅ Qt5.12.9 唯一正确
#include <QModbusDataUnit>
#include <QModbusReply>

class ModbusRtuMaster : public QObject
{
    Q_OBJECT
public:
    static ModbusRtuMaster* instance();

    bool initPort(int portIndex, const QString& portName,
                  qint32 baudRate = QSerialPort::Baud9600,
                  QSerialPort::DataBits dataBits = QSerialPort::Data8,
                  QSerialPort::Parity parity = QSerialPort::NoParity,
                  QSerialPort::StopBits stopBits = QSerialPort::OneStop);

    void closeAllPorts();

    bool writeCoil(int portIndex, int serverAddr, int coilAddr, bool value);
    bool writeHoldingReg(int portIndex, int serverAddr, int regAddr, quint16 value);
    bool readInputReg(int portIndex, int serverAddr, int regAddr, int len);
    bool readHoldingReg(int portIndex, int serverAddr, int regAddr, int len);

signals:
    void regDataReceived(int portIndex, const QVector<quint16>& data);
    void modbusError(int portIndex, const QString& errorMsg);

private:
    explicit ModbusRtuMaster(QObject *parent = nullptr);

    // ✅ 正确类型
    QModbusRtuSerialMaster* m_client[6];
};

#endif
