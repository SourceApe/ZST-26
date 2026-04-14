#ifndef FIXEDSAMPLE_H
#define FIXEDSAMPLE_H

#include "ModeBase.h"
#include "../../Pages/SubPages/WorkMode/ModePage.h"
#include <QTimer>

class FixedSampleMode : public ModeBase
{
    Q_OBJECT
public:
    explicit FixedSampleMode(QObject *parent = nullptr);

    bool start() override;
    void stop() override;
    bool isRunning() const override;

private slots:
    void onSampleProcess();

private:
    void loadParamsFromModePage();

    QTimer m_timer;
    bool m_running;

    double m_targetSampleVol;
    int    m_retainBottleNum;
    double m_retainVol;
    double m_currentVol;
};

#endif // FIXEDSAMPLE_H
