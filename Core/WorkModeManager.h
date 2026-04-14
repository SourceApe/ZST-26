#ifndef WORKMODEMANAGER_H
#define WORKMODEMANAGER_H

#include <QObject>
#include "WorkModes/ModeBase.h"
#include "WorkModes/FixedSampleMode.h"

enum WorkMode {
    None = 0,
    FixedSample,  // 定量采样
    TimeRatio,
    FlowRatio,
    FlowTrack,
    ExtTrigger
};

class WorkModeManager : public QObject
{
    Q_OBJECT
public:
    static WorkModeManager* instance();

    Q_INVOKABLE bool switchMode(int modeIndex);
    Q_INVOKABLE bool startMode();
    Q_INVOKABLE void stopMode();
    Q_INVOKABLE int currentMode() const;

signals:
    void modeChanged(int mode);
    void statusUpdate(QString msg);
    void runError(QString err);

private:
    explicit WorkModeManager(QObject *parent = nullptr);
    ~WorkModeManager();

    ModeBase* m_currentMode;
    WorkMode m_mode;
};

#endif // WORKMODEMANAGER_H
