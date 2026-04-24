#ifndef DEVICEDATAHUB_H
#define DEVICEDATAHUB_H

#include <QObject>

class DeviceDataHub : public QObject
{
    Q_OBJECT
public:
    static DeviceDataHub& instance();
    void notifyWriteHoldingReg(int port, int slave, int regAddr);

signals:
    void writeHoldingRegRequested(int port, int slave, int regAddr);

private:
    DeviceDataHub() = default;
};

#endif
