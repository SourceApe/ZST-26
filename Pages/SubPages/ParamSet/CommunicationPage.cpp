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

    // 就和你ModePage一样！直接加载，默认值自带兜底
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

QVariantList CommunicationPage::comConfig() const
{
    QVariantList list;
    for (const auto& item : m_comList) {
        QVariantMap map;
        map["baud"] = item.baud;
        map["modeIndex"] = item.modeIndex;
        map["masterSlaveIndex"] = item.masterSlaveIndex;
        map["address"] = item.address;
        list.append(map);
    }
    return list;
}

void CommunicationPage::setComConfig(const QVariantList& config)
{
    if (config.size() != 6)
        return;

    for (int i = 0; i < 6; ++i) {
        QVariantMap map = config.at(i).toMap();
        m_comList[i].baud = map["baud"].toString();
        m_comList[i].modeIndex = map["modeIndex"].toInt();
        m_comList[i].masterSlaveIndex = map["masterSlaveIndex"].toInt();
        m_comList[i].address = map["address"].toString();
    }

    emit comConfigChanged();
}

// ====================== 完全和你 ModePage 一样的写法 ======================
void CommunicationPage::loadAllConfig()
{
    m_comList.resize(6);

    for (int i = 0; i < 6; ++i) {
        QString prefix = QString("Communication/COM%1_").arg(i + 1);

        // 你怎么写ModePage，我就怎么写这里！
        m_comList[i].baud = m_settings->value(prefix + "Baud", "9600").toString();
        m_comList[i].modeIndex = m_settings->value(prefix + "Mode", 0).toInt();
        m_comList[i].masterSlaveIndex = m_settings->value(prefix + "MasterSlave", 0).toInt();
        m_comList[i].address = m_settings->value(prefix + "Address", "1").toString();
    }

    emit comConfigChanged();
}

void CommunicationPage::saveAllConfig()
{
    for (int i = 0; i < 6; ++i) {
        QString prefix = QString("Communication/COM%1_").arg(i + 1);
        m_settings->setValue(prefix + "Baud", m_comList[i].baud);
        m_settings->setValue(prefix + "Mode", m_comList[i].modeIndex);
        m_settings->setValue(prefix + "MasterSlave", m_comList[i].masterSlaveIndex);
        m_settings->setValue(prefix + "Address", m_comList[i].address);
    }

    m_settings->sync();
}
