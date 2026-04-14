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

    // 1. 获取通信配置（用你已经写好的接口 ✅）
    CommunicationPage *comm = CommunicationPage::instance();
    QVariantList comConfigList = comm->comConfig();

    // 2. 硬件串口映射
    QString portMap[6] = {
        "ttymxc1",   // COM1
        "ttymxc2",   // COM2
        "ttymxc4",   // COM3
        "ttymxc5",   // COM4 → Modbus
        "ttymxc6",   // COM5
        "ttymxc7"    // COM6
    };

    // 3. 遍历初始化（普通串口 / Modbus 自动区分）
    for (int i = 0; i < 6; ++i) {
        // 从你返回的 QVariantList 里拿配置 ✅
        QVariantMap cfg = comConfigList.at(i).toMap();
        int modeIndex    = cfg["modeIndex"].toInt();       // 0=普通 1=Modbus
        QString baudStr  = cfg["baud"].toString();         // 波特率

        // 字符串转 Qt 波特率枚举
        qint32 baud = QSerialPort::Baud9600;
        if      (baudStr == "2400")  baud = QSerialPort::Baud2400;
        else if (baudStr == "4800")  baud = QSerialPort::Baud4800;
        else if (baudStr == "9600")  baud = QSerialPort::Baud9600;
        else if (baudStr == "19200") baud = QSerialPort::Baud19200;
        else if (baudStr == "38400") baud = QSerialPort::Baud38400;
        else if (baudStr == "57600") baud = QSerialPort::Baud57600;
        else if (baudStr == "115200")baud= QSerialPort::Baud115200;

        // ================ 模式判断 ================
        if (modeIndex == 1) {
            // Modbus 模式
            ModbusRtuMaster::instance()->initPort(i, portMap[i], baud);
            qDebug() << "串口" << i << "→ Modbus 模式：" << portMap[i];
        } else {
            // 普通串口模式
            SerialPort::instance()->initPort(i, portMap[i], baud);
            qDebug() << "串口" << i << "→ 普通模式：" << portMap[i];
        }
    }

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
