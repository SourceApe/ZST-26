#include "WorkModeManager.h"
#include "../Pages/SubPages/WorkMode/ModePage.h"
#include "WorkModes/Sample/FixedSampleMode.h"
#include <QDebug>

WorkModeManager::WorkModeManager(QObject *parent)
    : QObject{parent}
    , m_currentMode(nullptr)
{
}

WorkModeManager* WorkModeManager::instance()
{
    static WorkModeManager s_ins;
    return &s_ins;
}

void WorkModeManager::start()
{
    stop();

    int mode = ModePage::instance()->sampleModeIndex();

    switch(mode){
    case 0:
        m_currentMode = new FixedSampleMode(this);
        break;
    default:
        break;
    }

    if (m_currentMode) {
        connect(m_currentMode, &SampleBase::finished, this, &WorkModeManager::stop);
        m_currentMode->start();
    }
}

void WorkModeManager::stop()
{
    if (m_currentMode) {
        m_currentMode->stop();
        m_currentMode->deleteLater();
        m_currentMode = nullptr;
        emit stopped();
    }
}
