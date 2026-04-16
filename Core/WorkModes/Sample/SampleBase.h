#ifndef SAMPLEBASE_H
#define SAMPLEBASE_H

#include <QObject>
#include <QTimer>
#include "../../../Pages/SubPages/WorkMode/ModePage.h"

class SampleBase : public QObject
{
    Q_OBJECT
public:
    explicit SampleBase(QObject *parent = nullptr);

    // 统一接口
    virtual void start() = 0;
    virtual void stop() = 0;

signals:
    void finished();

protected:
    ModePage *m_config;
    QTimer m_timer;
    int m_currentCount;
};

#endif // MODEBASE_H
