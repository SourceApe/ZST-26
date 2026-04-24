#ifndef RETAINMANAGER_H
#define RETAINMANAGER_H

#include <QObject>
#include "RetainBase.h"

class RetainManager : public QObject
{
    Q_OBJECT
public:
    static RetainManager& instance();
    void start(); // 启动留样
    void stop();  // 停止留样

signals:
    void finished(); // 转发留样完成信号

private:
    explicit RetainManager(QObject *parent = nullptr);

    RetainBase* m_currentMode = nullptr;
};

#endif // RETAINMANAGER_H
