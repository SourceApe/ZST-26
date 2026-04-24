#ifndef FIXEDSAMPLEMODE_H
#define FIXEDSAMPLEMODE_H

#include <QTimer>
#include "SampleBase.h"

class FixedSampleMode : public SampleBase
{
    Q_OBJECT
public:
    explicit FixedSampleMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;

private slots:
    void runStep();

private:
    QTimer m_timer;
    int m_step = 0;
    int m_delayMs;

    int m_sampleBucketCleanCnt;
    int m_sampleBucketCleanVol;
    int m_stirTime;
    int m_emptyTime;
    int m_pipeEmptyTime;
    int m_sampleTimeout;
    int m_extPumpPreTime;
    int m_samplePumpSpeed;
    int m_sampleBucketVol;

    int m_currentLoop = 0;
};

#endif // FIXEDSAMPLEMODE_H
