#ifndef BUZZERCTRL_H
#define BUZZERCTRL_H

#include <QObject>
#include <QFile>
#include <QTimer>

class BuzzerCtrl : public QObject
{
    Q_OBJECT
public:
    // 单例入口
    static BuzzerCtrl* instance();

    // 给QML调用
    Q_INVOKABLE void beepOnce(int ms = 60);

private:
    explicit BuzzerCtrl(QObject *parent = nullptr);
    void setGpioHigh();
    void setGpioLow();
};

#endif
