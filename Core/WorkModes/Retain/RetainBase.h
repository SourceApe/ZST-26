#ifndef RETAINBASE_H
#define RETAINBASE_H

#include <QObject>

class RetainBase : public QObject
{
    Q_OBJECT
public:
    explicit RetainBase(QObject *parent = nullptr);

    virtual void start() = 0;
    virtual void stop() = 0;

signals:
    void finished(); // 留样完成信号
};

#endif // RETAINBASE_H
