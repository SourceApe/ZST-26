#include <QDebug>
#include <QDateTime>

#include "Application.h"
#include "WorkModeManager.h"
#include "../Devices/SerialPort.h"
#include "../Devices/Modbus/ModbusRtuMaster.h"

Application::Application(QObject *parent)
    : QObject{parent}
    , m_isRunning(false)
{

    m_scheduleTimer.setInterval(1000);
    connect(&m_scheduleTimer, &QTimer::timeout, this, &Application::checkTime);

    connect(WorkModeManager::instance(), &WorkModeManager::stopped,
            this, &Application::stopRun);
}

Application* Application::instance()
{
    static Application s_instance;
    return &s_instance;
}

void Application::init()
{
    SerialPort::instance()->initPort(0, "ttymxc1");
    SerialPort::instance()->initPort(1, "ttymxc2");
    SerialPort::instance()->initPort(2, "ttymxc4");
    SerialPort::instance()->initPort(4, "ttymxc6");
    SerialPort::instance()->initPort(5, "ttymxc7");

    ModbusRtuMaster::instance()->initPort(3, "ttymxc5");
    qDebug() << "✅ 设备初始化完成";
}

void Application::startRun()
{
    if (m_isRunning) return;

    m_isRunning = true;
    WorkModeManager::instance()->start();
}

// ======================
// ✅ 修复：真正停止底层
// ======================
void Application::stopRun()
{
    if (!m_isRunning) return;

    // 先停止底层模式
    WorkModeManager::instance()->stop();

    // 再更新状态
    m_isRunning = false;

    qDebug() << "设备已停止";
}

void Application::startSchedule()
{
    qDebug() << "⏰ 开启定时启动监控";
    m_scheduleTimer.start();
}

void Application::stopSchedule()
{
    m_scheduleTimer.stop();
}

void Application::checkTime()
{
    if (m_isRunning) return;

    int year   = ModePage::instance()->scheduleYear().toInt();
    int month  = ModePage::instance()->scheduleMonth().toInt();
    int day    = ModePage::instance()->scheduleDay().toInt();
    int hour   = ModePage::instance()->scheduleHour().toInt();
    int minute = ModePage::instance()->scheduleMinute().toInt();

    QDateTime now = QDateTime::currentDateTime();
    QDateTime target(QDate(year, month, day), QTime(hour, minute));

    if (now >= target && now < target.addSecs(1)) {
        qDebug() << "✅ 定时时间到，自动启动！";
        startRun();
        m_scheduleTimer.stop();
    }
}

bool Application::isRunning() const
{
    return m_isRunning;
}
