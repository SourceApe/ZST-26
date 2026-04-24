#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include <QSerialPort>

class SerialPort : public QObject
{
    Q_OBJECT
public:
    static SerialPort& instance();

    // 单独初始化某个串口（和 Modbus 风格一样）
    bool initPort(int index, const QString& portName,
                  qint32 baudRate = QSerialPort::Baud9600,
                  QSerialPort::DataBits dataBits = QSerialPort::Data8,
                  QSerialPort::Parity parity = QSerialPort::NoParity,
                  QSerialPort::StopBits stopBits = QSerialPort::OneStop);

    void closePort(int index);
    void closeAll();

    void sendData(int index, const char* data, int len);

private:
    explicit SerialPort(QObject *parent = nullptr);

    QSerialPort* m_port[6];  // 6个串口
};

#endif
