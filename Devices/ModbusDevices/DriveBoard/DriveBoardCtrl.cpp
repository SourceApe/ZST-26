#include "QDebug"

#include "DriveBoardCtrl.h"
#include "../../Modbus/ModbusRtuMaster.h"
#include "../DeviceDataHub.h"

DriveBoardCtrl::DriveBoardCtrl()
{
}

DriveBoardCtrl& DriveBoardCtrl::instance()
{
    static DriveBoardCtrl s_instance;
    return s_instance;
}

bool DriveBoardCtrl::init()
{
    setAllOutput(4, 10, 0);

    return 0;
}

void DriveBoardCtrl::setOutput(int port, int slave, int channel, bool on, int regAddr)
{
    if (channel < 1 || channel > 16) return;

    QMutexLocker lock(&m_mutex);
    auto& modbus = ModbusRtuMaster::instance();

    quint16 val = modbus.getHoldingReg(port, slave, regAddr);
    int bit = channel - 1;

    if (on) val |= (1U << bit);
    else val &= ~(1U << bit);

    modbus.setHoldingReg(port, slave, regAddr, val);
    DeviceDataHub::instance().notifyWriteHoldingReg(port, slave, regAddr);
}

bool DriveBoardCtrl::getOutputState(int port, int slave, int channel, int regAddr)
{
    if (channel < 1 || channel > 16) return false;

    QMutexLocker lock(&m_mutex);
    quint16 val = ModbusRtuMaster::instance().getHoldingReg(port, slave, regAddr);
    return (val & (1U << (channel - 1))) != 0;
}

void DriveBoardCtrl::setAllOutput(int port, int slave, quint16 value, int regAddr)
{
    QMutexLocker lock(&m_mutex);
    auto& modbus = ModbusRtuMaster::instance();
    modbus.setHoldingReg(port, slave, regAddr, value);
    DeviceDataHub::instance().notifyWriteHoldingReg(port, slave, regAddr);
}

// 输入状态读取
bool DriveBoardCtrl::getInputState(int port, int slave, int channel, int regAddr)
{
    if (channel < 1 || channel > 16) return false;

    QMutexLocker lock(&m_mutex);
    quint16 val = ModbusRtuMaster::instance().getInputReg(port, slave, regAddr);
    return (val & (1U << (channel - 1))) != 0;
}
