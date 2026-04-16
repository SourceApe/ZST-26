#include "FixedSampleMode.h"
#include <QDebug>

FixedSampleMode::FixedSampleMode(QObject *parent)
    : SampleBase{parent}
{
    m_timer.setInterval(10);
    connect(&m_timer, &QTimer::timeout, this, &FixedSampleMode::runStep);
}

void FixedSampleMode::start()
{
    qDebug() << "=====================================";
    qDebug() << "       启动 【定量采样模式】";
    qDebug() << "=====================================";

    m_sampleVol = m_config->fixedSampleVol().toDouble();
    m_retainBottle = m_config->fixedRetainBottleNum().toInt();
    m_retainVol = m_config->fixedRetainVol().toDouble();

    m_step = 0;
    m_timer.start();
}

void FixedSampleMode::stop()
{
    if (m_timer.isActive()) {
        m_timer.stop();
        qDebug() << "定量采样已停止";
    }
}

void FixedSampleMode::runStep()
{
    if (!m_timer.isActive()) return;

    switch(m_step) {
    case 0:
        qDebug() << "步骤1：切换瓶号";
        m_step++;
        break;

    case 1:
        qDebug() << "步骤2：开泵";
        m_step++;
        break;

    case 2:
        qDebug() << "步骤3：定量采样中...";
        m_step++;
        break;

    case 3:
        qDebug() << "步骤4：关泵、完成";
        m_timer.stop();
        qDebug() << "✅ 采样全部完成！";

        // ======================
        // ✅ 最后再发完成信号
        // ======================
        emit finished();
        break;
    }
}
