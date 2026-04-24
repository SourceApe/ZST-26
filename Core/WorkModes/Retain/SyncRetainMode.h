#ifndef SYNCRETAINMODE_H
#define SYNCRETAINMODE_H

#include <QObject>
#include <QTimer>
#include "RetainBase.h"

class SyncRetainMode : public RetainBase
{
    Q_OBJECT

public:
    explicit SyncRetainMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;

private slots:
    void runStep();

private:
    QTimer m_timer;
    int m_step = 0;

    int m_retainTimeout;
    int m_pipeEmptyTime;
    int m_rotateTimeout;
    int m_retainPumpSpeed;
    int m_retainBottleVol;
};

#endif // SYNCRETAINMODE_H
