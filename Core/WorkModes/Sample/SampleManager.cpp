#include "SampleManager.h"
#include "../../../Pages/SubPages/WorkMode/ModePage.h"
#include "FixedSampleMode.h"
#include "TimeRatioMode.h"
#include "FlowRatioMode.h"
#include "FlowTrackMode.h"
#include "ExtTriggerSampleMode.h"

SampleManager::SampleManager(QObject *parent)
    : QObject{parent}
{}

SampleManager& SampleManager::instance()
{
    static SampleManager s_instance;
    return s_instance;
}

void SampleManager::start()
{
    stop();

    int index = ModePage::instance()->sampleModeIndex();
    switch(index) {
    case 0: m_currentMode = new FixedSampleMode(this); break;
    case 1: m_currentMode = new TimeRatioMode(this); break;
    case 2: m_currentMode = new FlowRatioMode(this); break;
    case 3: m_currentMode = new FlowTrackMode(this); break;
    case 4: m_currentMode = new ExtTriggerSampleMode(this); break;
    default: return;
    }

    connect(m_currentMode, &SampleBase::finished, this, &SampleManager::finished);
    m_currentMode->start();
}

void SampleManager::stop()
{
    if (m_currentMode) {
        m_currentMode->stop();
        m_currentMode->deleteLater();
        m_currentMode = nullptr;
    }
}
