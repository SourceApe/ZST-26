#ifndef WORKMODEMANAGER_H
#define WORKMODEMANAGER_H

#include <QObject>
#include "WorkModes/Sample/SampleBase.h"
#include "WorkModes/Sample/FixedSampleMode.h"

class WorkModeManager : public QObject
{
    Q_OBJECT
public:
    static WorkModeManager* instance();

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

signals:
    void stopped();

private:
    explicit WorkModeManager(QObject *parent = nullptr);
    SampleBase *m_currentMode;
};

#endif // WORKMODEMANAGER_H
