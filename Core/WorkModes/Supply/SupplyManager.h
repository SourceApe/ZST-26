#ifndef SUPPLYMANAGER_H
#define SUPPLYMANAGER_H

#include <QObject>
#include "SupplyBase.h"

class SupplyManager : public QObject
{
    Q_OBJECT

public:
    static SupplyManager& instance();
    void start(); // 启动供样
    void stop();  // 停止供样

signals:
    void finished(); // 转发供样完成信号

private:
    explicit SupplyManager(QObject *parent = nullptr);

    SupplyBase* m_currentMode = nullptr;
};

#endif // SUPPLYMANAGER_H
