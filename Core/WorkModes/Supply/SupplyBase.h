#ifndef SUPPLYBASE_H
#define SUPPLYBASE_H

#include <QObject>

class SupplyBase : public QObject
{
    Q_OBJECT

public:
    explicit SupplyBase(QObject *parent = nullptr);

    virtual void start() = 0;
    virtual void stop() = 0;

signals:
    void finished(); // 供样完成信号
};

#endif // SUPPLYBASE_H
