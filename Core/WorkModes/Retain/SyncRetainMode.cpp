#include <QDebug>

#include "SyncRetainMode.h"
#include "../../../Pages/SubPages/WorkMode/ModePage.h"
#include "../../../Pages/SubPages/ParamSet/PumpValvePage.h"

SyncRetainMode::SyncRetainMode(QObject *parent) : RetainBase(parent)
{
    m_timer.setInterval(100);
    connect(&m_timer, &QTimer::timeout, this, &SyncRetainMode::runStep);
}

void SyncRetainMode::start()
{
    qDebug() << "▶ 同步留样开始";

    m_retainTimeout    = PumpValvePage::instance()->retainTimeout().toInt();
    m_pipeEmptyTime    = PumpValvePage::instance()->retainPipeEmptyTime().toInt();
    m_rotateTimeout    = PumpValvePage::instance()->tableRotateTimeout().toInt();
    m_retainPumpSpeed  = PumpValvePage::instance()->retainPumpSpeed().toInt();
    m_retainBottleVol  = PumpValvePage::instance()->retainBottleVol().toInt();

    m_step = 0;
    m_timer.start();
}

void SyncRetainMode::stop()
{
    m_timer.stop();
    qDebug() << "⏹ 同步留样停止";
}

void SyncRetainMode::runStep()
{
    switch (m_step) {
    case 0:
        qDebug() << "① 留样管路排空";
        m_step++;
        break;

    case 1:
        qDebug() << "② 转盘旋转到目标瓶号";
        m_step++;
        break;

    case 2:
        qDebug() << "③ 搅拌";
        m_step++;
        break;

    case 3:
        qDebug() << "④ 到达水节点";
        m_step++;
        break;

    case 4:
        qDebug() << "⑤ 开始留样";
        m_step++;
        break;

    case 5:
        qDebug() << "⑥ 留样管路再次排空";
        m_step++;
        break;

    case 6:
        qDebug() << "⑦ 关闭搅拌";
        m_step++;
        break;

    case 7:
        qDebug() << "⑧ 排空采样桶";
        m_step = 99;
        break;

    case 99:
        m_timer.stop();
        qDebug() << "✅ 同步留样完成";
        emit finished();
        break;
    }
}
