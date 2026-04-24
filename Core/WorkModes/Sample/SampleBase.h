#ifndef SAMPLEBASE_H
#define SAMPLEBASE_H

#include <QObject>

class SampleBase : public QObject
{
    Q_OBJECT

public:
    explicit SampleBase(QObject *parent = nullptr);

    virtual void start() = 0;
    virtual void stop() = 0;

signals:
    void finished(); // 采样完成信号
};

#endif // SAMPLEBASE_H
