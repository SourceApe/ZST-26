#ifndef SAMPLEMANAGER_H
#define SAMPLEMANAGER_H

#include <QObject>
#include "SampleBase.h"

class SampleManager : public QObject
{
    Q_OBJECT

public:
    static SampleManager& instance();
    void start(); // 启动采样
    void stop();  // 停止采样

signals:
    void finished(); // 转发采样完成信号

private:
    explicit SampleManager(QObject *parent = nullptr);

    SampleBase* m_currentMode = nullptr;
};

#endif // SAMPLEMANAGER_H
