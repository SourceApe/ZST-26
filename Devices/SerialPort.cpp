#include "SerialPort.h"
#include <QDebug>

SerialPort::SerialPort(QObject *parent)
    : QObject(parent)
{
    for(int i=0; i<6; i++){
        m_port[i] = new QSerialPort(this);
    }
}

SerialPort* SerialPort::instance()
{
    static SerialPort s_instance;
    return &s_instance;
}

bool SerialPort::initPort(int index, const QString &portName,
                          qint32 baudRate,
                          QSerialPort::DataBits dataBits,
                          QSerialPort::Parity parity,
                          QSerialPort::StopBits stopBits)
{
    if(index <0 || index >=6) return false;

    QSerialPort *port = m_port[index];
    if(port->isOpen()) port->close();

    port->setPortName(portName);
    port->setBaudRate(baudRate);
    port->setDataBits(dataBits);
    port->setParity(parity);
    port->setStopBits(stopBits);

    bool ok = port->open(QIODevice::ReadWrite);
    if(ok){
        qDebug() << "串口"<<index<<"初始化成功："<<portName;
    }else{
        qDebug() << "串口"<<index<<"初始化失败："<<port->errorString();
    }
    return ok;
}

void SerialPort::closePort(int index)
{
    if(index <0 || index >=6) return;
    if(m_port[index]->isOpen()){
        m_port[index]->close();
    }
}

void SerialPort::closeAll()
{
    for(int i=0; i<6; i++){
        closePort(i);
    }
}

void SerialPort::sendData(int index, const char *data, int len)
{
    if(index <0 || index >=6) return;
    QSerialPort *port = m_port[index];

    if(port && port->isOpen()){
        port->write(data, len);
        qDebug() << "串口"<<index<<"发送成功";
    }else{
        qDebug() << "串口"<<index<<"未打开，发送失败";
    }
}
