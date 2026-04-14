#include "FixedSampleMode.h"
#include <QDebug>

FixedSampleMode::FixedSampleMode(QObject *parent)
    : ModeBase(parent),
      m_running(false)
{
    m_timer.setInterval(100);
    connect(&m_timer, &QTimer::timeout, this, &FixedSampleMode::onSampleProcess);
}

bool FixedSampleMode::start()
{
    loadParamsFromModePage();

    if (m_targetSampleVol <= 0) {
        emit runError("采样量必须大于0");
        return false;
    }

    m_currentVol = 0;
    m_running = true;
    m_timer.start();
    emit started();
    emit statusUpdate("定量采样开始");
    return true;
}

void FixedSampleMode::stop()
{
    m_timer.stop();
    m_running = false;
    emit stopped();
}

bool FixedSampleMode::isRunning() const
{
    return m_running;
}

void FixedSampleMode::onSampleProcess()
{
    m_currentVol += 5;

    emit statusUpdate(QString("采样中：%1 / %2 ml")
                      .arg(m_currentVol)
                      .arg(m_targetSampleVol));

    if (m_currentVol >= m_targetSampleVol) {
        m_timer.stop();
        emit statusUpdate(QString("采样完成！瓶号：%1，留样量：%2 ml")
                          .arg(m_retainBottleNum)
                          .arg(m_retainVol));
        stop();
    }
}

void FixedSampleMode::loadParamsFromModePage()
{
    auto *modePage = ModePage::instance();
    m_targetSampleVol = modePage->fixedSampleVol().toDouble();
    m_retainBottleNum = modePage->fixedRetainBottleNum().toInt();
    m_retainVol = modePage->fixedRetainVol().toDouble();
}
