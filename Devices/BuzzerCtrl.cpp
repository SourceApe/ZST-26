#include "BuzzerCtrl.h"
#include <QThread>

#define GPIO_PATH "/sys/class/leds/beep/brightness"

// 单例
BuzzerCtrl* BuzzerCtrl::instance()
{
    static BuzzerCtrl s_instance;
    return &s_instance;
}

BuzzerCtrl::BuzzerCtrl(QObject *parent)
    : QObject(parent)
{
    setGpioLow();
}

void BuzzerCtrl::setGpioHigh()
{
    QFile f(GPIO_PATH);
    if(f.open(QIODevice::WriteOnly)){
        f.write("1");
        f.close();
    }
}

void BuzzerCtrl::setGpioLow()
{
    QFile f(GPIO_PATH);
    if(f.open(QIODevice::WriteOnly)){
        f.write("0");
        f.close();
    }
}

void BuzzerCtrl::beepOnce(int ms)
{
    setGpioHigh();
//    QTimer::singleShot(ms, this, &BuzzerCtrl::setGpioLow);
    QThread::msleep(ms);
    setGpioLow();
}
