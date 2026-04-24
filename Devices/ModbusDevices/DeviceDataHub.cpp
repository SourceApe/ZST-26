#include "DeviceDataHub.h"

DeviceDataHub& DeviceDataHub::instance()
{
    static DeviceDataHub inst;
    return inst;
}

void DeviceDataHub::notifyWriteHoldingReg(int port, int slave, int regAddr)
{
    emit writeHoldingRegRequested(port, slave, regAddr);
}
