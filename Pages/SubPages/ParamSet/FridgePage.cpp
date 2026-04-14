#include "FridgePage.h"
#include <QDir>

FridgePage::FridgePage()
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

FridgePage::~FridgePage()
{
    delete m_settings;
}

FridgePage* FridgePage::instance()
{
    static FridgePage s_instance;
    return &s_instance;
}

QString FridgePage::setTemp() const { return m_setTemp; }
void FridgePage::setSetTemp(const QString &value) {
    if (m_setTemp == value) return;
    m_setTemp = value;
    emit setTempChanged();
}

QString FridgePage::tempOverHighAlarm() const { return m_tempOverHighAlarm; }
void FridgePage::setTempOverHighAlarm(const QString &value) {
    if (m_tempOverHighAlarm == value) return;
    m_tempOverHighAlarm = value;
    emit tempOverHighAlarmChanged();
}

QString FridgePage::tempOverLowAlarm() const { return m_tempOverLowAlarm; }
void FridgePage::setTempOverLowAlarm(const QString &value) {
    if (m_tempOverLowAlarm == value) return;
    m_tempOverLowAlarm = value;
    emit tempOverLowAlarmChanged();
}

QString FridgePage::overLimitDelayAlarm() const { return m_overLimitDelayAlarm; }
void FridgePage::setOverLimitDelayAlarm(const QString &value) {
    if (m_overLimitDelayAlarm == value) return;
    m_overLimitDelayAlarm = value;
    emit overLimitDelayAlarmChanged();
}

QString FridgePage::defrostTime() const { return m_defrostTime; }
void FridgePage::setDefrostTime(const QString &value) {
    if (m_defrostTime == value) return;
    m_defrostTime = value;
    emit defrostTimeChanged();
}

// ====================== 加载配置 ======================
void FridgePage::loadAllConfig()
{
    setSetTemp(m_settings->value("Fridge/SetTemp", "5.0").toString());
    setTempOverHighAlarm(m_settings->value("Fridge/TempOverHighAlarm", "15.0").toString());
    setTempOverLowAlarm(m_settings->value("Fridge/TempOverLowAlarm", "0.0").toString());
    setOverLimitDelayAlarm(m_settings->value("Fridge/OverLimitDelayAlarm", "5").toString());
    setDefrostTime(m_settings->value("Fridge/DefrostTime", "30").toString());
}

// ====================== 保存配置 ======================
void FridgePage::saveAllConfig()
{
    m_settings->setValue("Fridge/SetTemp", m_setTemp);
    m_settings->setValue("Fridge/TempOverHighAlarm", m_tempOverHighAlarm);
    m_settings->setValue("Fridge/TempOverLowAlarm", m_tempOverLowAlarm);
    m_settings->setValue("Fridge/OverLimitDelayAlarm", m_overLimitDelayAlarm);
    m_settings->setValue("Fridge/DefrostTime", m_defrostTime);

    m_settings->sync();
}
