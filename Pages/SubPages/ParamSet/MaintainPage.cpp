#include "MaintainPage.h"
#include <QDir>

MaintainPage::MaintainPage()
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

MaintainPage::~MaintainPage()
{
    delete m_settings;
}

MaintainPage* MaintainPage::instance()
{
    static MaintainPage s_instance;
    return &s_instance;
}

QString MaintainPage::ch1Total() const { return m_ch1Total; }
void MaintainPage::setCh1Total(const QString &value) {
    if (m_ch1Total == value) return;
    m_ch1Total = value;
    emit ch1TotalChanged();
}

QString MaintainPage::ch1AlarmLeft() const { return m_ch1AlarmLeft; }
void MaintainPage::setCh1AlarmLeft(const QString &value) {
    if (m_ch1AlarmLeft == value) return;
    m_ch1AlarmLeft = value;
    emit ch1AlarmLeftChanged();
}

QString MaintainPage::ch1Expire() const { return m_ch1Expire; }
void MaintainPage::setCh1Expire(const QString &value) {
    if (m_ch1Expire == value) return;
    m_ch1Expire = value;
    emit ch1ExpireChanged();
}

QString MaintainPage::ch2Total() const { return m_ch2Total; }
void MaintainPage::setCh2Total(const QString &value) {
    if (m_ch2Total == value) return;
    m_ch2Total = value;
    emit ch2TotalChanged();
}

QString MaintainPage::ch2AlarmLeft() const { return m_ch2AlarmLeft; }
void MaintainPage::setCh2AlarmLeft(const QString &value) {
    if (m_ch2AlarmLeft == value) return;
    m_ch2AlarmLeft = value;
    emit ch2AlarmLeftChanged();
}

QString MaintainPage::ch2Expire() const { return m_ch2Expire; }
void MaintainPage::setCh2Expire(const QString &value) {
    if (m_ch2Expire == value) return;
    m_ch2Expire = value;
    emit ch2ExpireChanged();
}

QString MaintainPage::ch3Total() const { return m_ch3Total; }
void MaintainPage::setCh3Total(const QString &value) {
    if (m_ch3Total == value) return;
    m_ch3Total = value;
    emit ch3TotalChanged();
}

QString MaintainPage::ch3AlarmLeft() const { return m_ch3AlarmLeft; }
void MaintainPage::setCh3AlarmLeft(const QString &value) {
    if (m_ch3AlarmLeft == value) return;
    m_ch3AlarmLeft = value;
    emit ch3AlarmLeftChanged();
}

QString MaintainPage::ch3Expire() const { return m_ch3Expire; }
void MaintainPage::setCh3Expire(const QString &value) {
    if (m_ch3Expire == value) return;
    m_ch3Expire = value;
    emit ch3ExpireChanged();
}

QString MaintainPage::samplePumpLife() const { return m_samplePumpLife; }
void MaintainPage::setSamplePumpLife(const QString &value) {
    if (m_samplePumpLife == value) return;
    m_samplePumpLife = value;
    emit samplePumpLifeChanged();
}

QString MaintainPage::retainPumpLife() const { return m_retainPumpLife; }
void MaintainPage::setRetainPumpLife(const QString &value) {
    if (m_retainPumpLife == value) return;
    m_retainPumpLife = value;
    emit retainPumpLifeChanged();
}

// ====================== 加载配置 ======================
void MaintainPage::loadAllConfig()
{
    setCh1Total(m_settings->value("Maintain/Ch1Total", "500").toString());
    setCh1AlarmLeft(m_settings->value("Maintain/Ch1AlarmLeft", "50").toString());
    setCh1Expire(m_settings->value("Maintain/Ch1Expire", "90").toString());

    setCh2Total(m_settings->value("Maintain/Ch2Total", "500").toString());
    setCh2AlarmLeft(m_settings->value("Maintain/Ch2AlarmLeft", "50").toString());
    setCh2Expire(m_settings->value("Maintain/Ch2Expire", "90").toString());

    setCh3Total(m_settings->value("Maintain/Ch3Total", "500").toString());
    setCh3AlarmLeft(m_settings->value("Maintain/Ch3AlarmLeft", "50").toString());
    setCh3Expire(m_settings->value("Maintain/Ch3Expire", "90").toString());

    setSamplePumpLife(m_settings->value("Maintain/SamplePumpLife", "180").toString());
    setRetainPumpLife(m_settings->value("Maintain/RetainPumpLife", "180").toString());
}

// ====================== 保存配置 ======================
void MaintainPage::saveAllConfig()
{
    m_settings->setValue("Maintain/Ch1Total", m_ch1Total);
    m_settings->setValue("Maintain/Ch1AlarmLeft", m_ch1AlarmLeft);
    m_settings->setValue("Maintain/Ch1Expire", m_ch1Expire);

    m_settings->setValue("Maintain/Ch2Total", m_ch2Total);
    m_settings->setValue("Maintain/Ch2AlarmLeft", m_ch2AlarmLeft);
    m_settings->setValue("Maintain/Ch2Expire", m_ch2Expire);

    m_settings->setValue("Maintain/Ch3Total", m_ch3Total);
    m_settings->setValue("Maintain/Ch3AlarmLeft", m_ch3AlarmLeft);
    m_settings->setValue("Maintain/Ch3Expire", m_ch3Expire);

    m_settings->setValue("Maintain/SamplePumpLife", m_samplePumpLife);
    m_settings->setValue("Maintain/RetainPumpLife", m_retainPumpLife);

    m_settings->sync();
}
