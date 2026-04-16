#ifndef FIXEDSAMPLEMODE_H
#define FIXEDSAMPLEMODE_H

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
    double m_sampleVol;
    int m_retainBottle;
    double m_retainVol;

    int m_step = 0;
};

#endif // FIXEDSAMPLEMODE_H
