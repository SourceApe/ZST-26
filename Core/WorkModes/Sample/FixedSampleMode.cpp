#include <QDebug>
#include <QDateTime>

#include "FixedSampleMode.h"
#include "../../../Pages/SubPages/WorkMode/ModePage.h"
#include "../../../Pages/SubPages/ParamSet/PumpValvePage.h"
#include "../../../Devices/ModbusDevices/DriveBoard/DriveBoardCtrl.h"

#define LOG(format) qDebug() << "[" << QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss") << "]" << format

FixedSampleMode::FixedSampleMode(QObject *parent)
    : SampleBase{parent}
{
    m_timer.setInterval(100);
    connect(&m_timer, &QTimer::timeout, this, &FixedSampleMode::runStep);
}

void FixedSampleMode::start()
{
    qDebug() << "▶ 定量采样开始";

    // 直接读取你的泵阀配置
    m_sampleBucketCleanCnt = PumpValvePage::instance()->sampleBucketCleanCnt().toInt();
    m_sampleBucketCleanVol = PumpValvePage::instance()->sampleBucketCleanVol().toInt();
    m_stirTime             = PumpValvePage::instance()->sampleStirTime().toInt();
    m_emptyTime            = PumpValvePage::instance()->sampleEmptyTime().toInt();
    m_pipeEmptyTime        = PumpValvePage::instance()->samplePipeEmptyTime().toInt();
    m_sampleTimeout        = PumpValvePage::instance()->sampleTimeout().toInt();
    m_extPumpPreTime       = PumpValvePage::instance()->extPumpPreTime().toInt();
    m_samplePumpSpeed      = PumpValvePage::instance()->samplePumpSpeed().toInt();
    m_sampleBucketVol      = PumpValvePage::instance()->sampleBucketVol().toInt();

    m_step = 0;
    m_timer.start();
}

void FixedSampleMode::stop()
{
    m_timer.stop();
    qDebug() << "⏹ 定量采样停止";
}

void FixedSampleMode::runStep()
{
    switch (m_step) {
    case 0:
        LOG("① 采样管路排空");
        DriveBoardCtrl::instance().setOutput(4, 10, 1,  true);
        m_delayMs = m_pipeEmptyTime * 1000;
        m_step = 1;
        break;
    case 1:
        if (m_delayMs > 0) { m_delayMs -= 100; return; }
        LOG("② 开外接泵");
        DriveBoardCtrl::instance().setOutput(4, 10, 2,  true);
        m_delayMs = m_extPumpPreTime * 1000;
        m_step = 2;
        break;

    case 2:
        if (m_delayMs > 0) { m_delayMs -= 100; return; }
        DriveBoardCtrl::instance().setOutput(4, 10, 3,  true);
        LOG("③ 润洗");
        m_step = 3;
        break;

    case 3:
        LOG("④ 桶排空");
        DriveBoardCtrl::instance().setOutput(4, 10, 4,  true);
        m_step = 4;
        break;

    case 4:
        LOG("⑤ 关外接泵");
        DriveBoardCtrl::instance().setOutput(4, 10, 5,  true);
        m_step = 5;
        break;

    case 5:
        qDebug() << "⑥ 排空采样桶";
        // Hardware::openTankValve();
        // Hardware::delay(m_emptyTime);
        m_step = 6;
        break;

    case 6:
        qDebug() << "⑦ 关外接泵";
        // Hardware::stopExtPump();
        m_step = 7;
        break;

    case 7:
        qDebug() << "⑧ 管路再次排空";
        // Hardware::pipeEmpty(m_pipeEmptyTime);
        m_step = 8;
        break;

    case 8:
        qDebug() << "⑨ 再次开外接泵";
        // Hardware::startExtPump();
        m_step = 9;
        break;

    case 9:
        qDebug() << "⑩ 泵打到水节点";
        // Hardware::pumpToWater();
        m_step = 10;
        break;

    case 10:
        qDebug() << "⑪ 进水";
        // Hardware::waterIn();
        m_step = 11;
        break;

    case 11:
        qDebug() << "⑫ 关外接泵";
        // Hardware::stopExtPump();
        m_step = 12;
        break;

    case 12:
        qDebug() << "⑬ 最后排空管路";
        // Hardware::pipeEmpty(m_pipeEmptyTime);
        m_step = 99;
        break;

    case 99:
        m_timer.stop();
        qDebug() << "✅ 定量采样完成！";

        emit finished();   // 流程结束 → 不跑供样/留样
        break;
    }
}
