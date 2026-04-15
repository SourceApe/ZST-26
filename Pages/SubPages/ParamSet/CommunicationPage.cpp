#include "CommunicationPage.h"
#include <QDir>

CommunicationPage::CommunicationPage()
    : QObject(nullptr)
{
    QDir dir("/opt/zst26");
    if (!dir.exists()) {
        dir.mkpath("/opt/zst26");
    }

    m_settings = new QSettings("/opt/zst26/config.ini", QSettings::IniFormat, this);
    m_settings->setIniCodec("UTF-8");
    loadAllConfig();
}

CommunicationPage::~CommunicationPage()
{
    delete m_settings;
}

CommunicationPage* CommunicationPage::instance()
{
    static CommunicationPage s_instance;
    return &s_instance;
}

QString CommunicationPage::rs485Addr() const { return m_rs485Addr; }
void CommunicationPage::setRs485Addr(const QString &value) {
    if (m_rs485Addr == value) return;
    m_rs485Addr = value;
    emit rs485AddrChanged();
}

int CommunicationPage::rs485BaudIndex() const { return m_rs485BaudIndex; }
void CommunicationPage::setRs485BaudIndex(int value) {
    if (m_rs485BaudIndex == value) return;
    m_rs485BaudIndex = value;
    emit rs485BaudIndexChanged();
}

int CommunicationPage::rs485ProtoIndex() const { return m_rs485ProtoIndex; }
void CommunicationPage::setRs485ProtoIndex(int value) {
    if (m_rs485ProtoIndex == value) return;
    m_rs485ProtoIndex = value;
    emit rs485ProtoIndexChanged();
}

int CommunicationPage::rs232BaudIndex() const { return m_rs232BaudIndex; }
void CommunicationPage::setRs232BaudIndex(int value) {
    if (m_rs232BaudIndex == value) return;
    m_rs232BaudIndex = value;
    emit rs232BaudIndexChanged();
}

int CommunicationPage::rs232ProtoIndex() const { return m_rs232ProtoIndex; }
void CommunicationPage::setRs232ProtoIndex(int value) {
    if (m_rs232ProtoIndex == value) return;
    m_rs232ProtoIndex = value;
    emit rs232ProtoIndexChanged();
}

// ====================== 加载配置 ======================
void CommunicationPage::loadAllConfig()
{
    setRs485Addr(m_settings->value("Comm/RS485Addr", "1").toString());
    setRs485BaudIndex(m_settings->value("Comm/RS485BaudIndex", 0).toInt());
    setRs485ProtoIndex(m_settings->value("Comm/RS485ProtoIndex", 0).toInt());

    setRs232BaudIndex(m_settings->value("Comm/RS232BaudIndex", 0).toInt());
    setRs232ProtoIndex(m_settings->value("Comm/RS232ProtoIndex", 0).toInt());
}

// ====================== 保存配置 ======================
void CommunicationPage::saveAllConfig()
{
    m_settings->setValue("Comm/RS485Addr", m_rs485Addr);
    m_settings->setValue("Comm/RS485BaudIndex", m_rs485BaudIndex);
    m_settings->setValue("Comm/RS485ProtoIndex", m_rs485ProtoIndex);

    m_settings->setValue("Comm/RS232BaudIndex", m_rs232BaudIndex);
    m_settings->setValue("Comm/RS232ProtoIndex", m_rs232ProtoIndex);

    m_settings->sync();
}
