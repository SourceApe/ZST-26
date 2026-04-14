#include "WorkModeManager.h"

WorkModeManager::WorkModeManager(QObject *parent)
    : QObject(parent),
      m_currentMode(nullptr),
      m_mode(None)
{
}

WorkModeManager::~WorkModeManager()
{
    // 停止当前模式
    if (m_currentMode) {
        m_currentMode->stop();
        m_currentMode->deleteLater();
        m_currentMode = nullptr;
    }
}

WorkModeManager* WorkModeManager::instance()
{
    static WorkModeManager s_instance;
    return &s_instance;
}

bool WorkModeManager::switchMode(int modeIndex)
{
    if (m_currentMode) {
        m_currentMode->stop();
        m_currentMode->deleteLater();
    }

    m_mode = (WorkMode)modeIndex;

    switch (m_mode) {
    case FixedSample:
        m_currentMode = new FixedSampleMode(this);
        break;
    default:
        m_currentMode = nullptr;
        return false;
    }

    connect(m_currentMode, &ModeBase::statusUpdate, this, &WorkModeManager::statusUpdate);
    connect(m_currentMode, &ModeBase::runError, this, &WorkModeManager::runError);

    emit modeChanged(m_mode);
    return true;
}

bool WorkModeManager::startMode()
{
    if (!m_currentMode) return false;
    return m_currentMode->start();
}

void WorkModeManager::stopMode()
{
    if (m_currentMode)
        m_currentMode->stop();
}

int WorkModeManager::currentMode() const
{
    return (int)m_mode;
}
