#include "RetainManager.h"
#include "../../../Pages/SubPages/WorkMode/ModePage.h"
#include "SyncRetainMode.h"
#include "OverLimitRetainMode.h"

RetainManager::RetainManager(QObject *parent)
    : QObject{parent}
{}

RetainManager& RetainManager::instance()
{
    static RetainManager s_instance;
    return s_instance;
}

void RetainManager::start()
{
    stop();

    int index = ModePage::instance()->retainModeIndex();
    switch(index) {
    case 0: m_currentMode = new SyncRetainMode(this); break;
    case 1: m_currentMode = new OverLimitRetainMode(this); break;
    default: return;
    }

    connect(m_currentMode, &RetainBase::finished, this, &RetainManager::finished);
    m_currentMode->start();
}

void RetainManager::stop()
{
    if (m_currentMode) {
        m_currentMode->stop();
        m_currentMode->deleteLater();
        m_currentMode = nullptr;
    }
}
