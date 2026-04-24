#include "WorkFlowManager.h"
#include "../Pages/SubPages/WorkMode/ModePage.h"
#include "WorkModes/Sample/SampleManager.h"
#include "WorkModes/Supply/SupplyManager.h"
#include "WorkModes/Retain/RetainManager.h"

WorkFlowManager::WorkFlowManager(QObject *parent)
    : QObject{parent}
{
    connect(&SampleManager::instance(), &SampleManager::finished, this, &WorkFlowManager::onSampleDone);
    connect(&SupplyManager::instance(), &SupplyManager::finished, this, &WorkFlowManager::onSupplyDone);
    connect(&RetainManager::instance(), &RetainManager::finished, this, &WorkFlowManager::onRetainDone);
}

WorkFlowManager& WorkFlowManager::instance()
{
    static WorkFlowManager s_instance;
    return s_instance;
}

bool WorkFlowManager::isFixedSample()
{
    return ModePage::instance()->sampleModeIndex() == 0;
}

void WorkFlowManager::startFlow()
{
    if (m_state != Idle) return;

    m_state = Sampling;
    SampleManager::instance().start();
}

void WorkFlowManager::stopFlow()
{
    SampleManager::instance().stop();
    SupplyManager::instance().stop();
    RetainManager::instance().stop();
    m_state = Idle;
    emit flowStopped();
}

void WorkFlowManager::onSampleDone()
{
    if (m_state != Sampling) return;

    if (isFixedSample()) {
        m_state = Retaining;
        RetainManager::instance().start();
        return;
    }

    // 其他 → 进入供样
    m_state = Supplying;
    SupplyManager::instance().start();
}

void WorkFlowManager::onSupplyDone()
{
    if (m_state != Supplying) return;

    m_state = Retaining;
    RetainManager::instance().start();
}

void WorkFlowManager::onRetainDone()
{
    if (m_state != Retaining) return;

    if (isFixedSample()) {
        m_state = Idle;
        emit flowFinished();
        return;
    }
    // 循环：回到采样
    m_state = Sampling;
    SampleManager::instance().start();
}
