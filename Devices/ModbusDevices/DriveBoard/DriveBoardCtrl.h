#ifndef DRIVEBOARDCTRL_H
#define DRIVEBOARDCTRL_H

#include <QMutex>

class DriveBoardCtrl
{
public:
    static DriveBoardCtrl& instance();

    bool init();
    // 输出控制
    void setOutput(int port, int slave, int channel, bool on, int regAddr = 560);
    bool getOutputState(int port, int slave, int channel, int regAddr = 560);
    void setAllOutput(int port, int slave, quint16 value, int regAddr = 560);

    // 输入状态读取（DI 开关量）
    bool getInputState(int port, int slave, int channel, int regAddr = 630);

private:
    DriveBoardCtrl();
    QMutex m_mutex;
};

#endif
