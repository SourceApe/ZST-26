#include "SupplyManager.h"
#include "../../../Pages/SubPages/WorkMode/ModePage.h"
#include "ImmediateSupplyMode.h"
#include "TimedSupplyMode.h"
#include "ExtTriggerSupplyMode.h"

SupplyManager::SupplyManager(QObject *parent)
    : QObject{parent}
{}

SupplyManager& SupplyManager::instance()
{
    static SupplyManager s_instance;
    return s_instance;
}

void SupplyManager::start()
{
    stop();

    int index = ModePage::instance()->supplyModeIndex();
    switch(index) {
    case 0: m_currentMode = new ImmediateSupplyMode(this); break;
    case 1: m_currentMode = new TimedSupplyMode(this); break;
    case 2: m_currentMode = new ExtTriggerSupplyMode(this); break;
    default: return;
    }

    connect(m_currentMode, &SupplyBase::finished, this, &SupplyManager::finished);
    m_currentMode->start();
}

void SupplyManager::stop()
{
    if (m_currentMode) {
        m_currentMode->stop();
        m_currentMode->deleteLater();
        m_currentMode = nullptr;
    }
}
