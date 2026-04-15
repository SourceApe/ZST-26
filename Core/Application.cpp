#include "Application.h"
#include "QDebug"
#include "../Devices/SerialPort.h"
#include "../Devices/Modbus/ModbusRtuMaster.h"
#include "Pages/SubPages/ParamSet/CommunicationPage.h"

Application::Application(QObject *parent)
    : QObject(parent)
{
    m_workModeManager = WorkModeManager::instance();
}

Application::~Application()
{
    // 全局清理逻辑（可选）
}

Application* Application::instance()
{
    static Application s_instance;
    return &s_instance;
}

bool Application::init()
{
    qDebug() << "开始初始化硬件...";

    ModbusRtuMaster::instance()->initPort(3, "ttymxc5");
    SerialPort::instance()->initPort(0, "ttymxc1");
    SerialPort::instance()->initPort(1, "ttymxc2");
    SerialPort::instance()->initPort(2, "ttymxc4");
    SerialPort::instance()->initPort(4, "ttymxc6");
    SerialPort::instance()->initPort(5, "ttymxc7");

    qDebug() << "✅ 所有串口初始化完成！";
    return true;
}

void Application::shutdown()
{
}

WorkModeManager* Application::workModeManager() const
{
    return m_workModeManager;
}
