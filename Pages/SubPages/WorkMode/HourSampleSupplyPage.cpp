#include "HourSampleSupplyPage.h"
#include <QStandardPaths>
#include <QDir>

HourSampleSupplyPage::HourSampleSupplyPage()
    : QObject(nullptr)
{
    // 工业设备标准做法：固定路径
    QString configPath = "/opt/zst26/config.ini";

    // 确保目录存在
    QDir dir("/opt/zst26");
    if (!dir.exists()) {
        dir.mkpath("/opt/zst26");
    }

    m_settings = new QSettings(configPath, QSettings::IniFormat, this);
    m_settings->setIniCodec("UTF-8");
    loadAllConfig();
}

HourSampleSupplyPage::~HourSampleSupplyPage()
{
    delete m_settings;
}

HourSampleSupplyPage* HourSampleSupplyPage::instance()
{
    static HourSampleSupplyPage s_instance;
    return &s_instance;
}

QVariantList HourSampleSupplyPage::selectedHours() const
{
    QVariantList list;
    for (int h : m_selectedHours)
        list << h;
    return list;
}

void HourSampleSupplyPage::setSelectedHours(const QVariantList& value)
{
    QList<int> temp;
    for (const QVariant& v : value) {
        int h = v.toInt();
        if (h >= 1 && h <= 24) // 匹配你 QML 1~24 小时
            temp << h;
    }

    if (m_selectedHours == temp)
        return;

    m_selectedHours = temp;
    emit selectedHoursChanged();
}

int HourSampleSupplyPage::advanceMinutes() const
{
    return m_advanceMinutes;
}

void HourSampleSupplyPage::setAdvanceMinutes(int value)
{
    if (m_advanceMinutes == value)
        return;
    m_advanceMinutes = value;
    emit advanceMinutesChanged();
}

void HourSampleSupplyPage::loadAllConfig()
{
    QVariantList hourList = m_settings->value("HourSampleSupply/SelectedHours").toList();

    m_selectedHours.clear();
    for (const QVariant& var : hourList) {
        int h = var.toInt();
        if (h >= 1 && h <= 24)
            m_selectedHours.append(h);
    }

    m_advanceMinutes = m_settings->value("HourSampleSupply/AdvanceMinutes", 0).toInt();

    emit selectedHoursChanged();
    emit advanceMinutesChanged();
}

void HourSampleSupplyPage::saveAllConfig()
{
    QVariantList hourList;
    for (int h : m_selectedHours)
        hourList << h;

    m_settings->setValue("HourSampleSupply/SelectedHours", hourList);
    m_settings->setValue("HourSampleSupply/AdvanceMinutes", m_advanceMinutes);
    m_settings->sync();
}
