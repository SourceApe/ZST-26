#include "AnalogChannelPage.h"
#include <QDir>

AnalogChannelPage::AnalogChannelPage()
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

AnalogChannelPage::~AnalogChannelPage()
{
    delete m_settings;
}

AnalogChannelPage* AnalogChannelPage::instance()
{
    static AnalogChannelPage s_instance;
    return &s_instance;
}

// 采样触发下限
QString AnalogChannelPage::sampleTriggerLower() const { return m_sampleTriggerLower; }
void AnalogChannelPage::setSampleTriggerLower(const QString &value) {
    if (m_sampleTriggerLower == value) return;
    m_sampleTriggerLower = value;
    emit sampleTriggerLowerChanged();
}

// 供样参数
QString AnalogChannelPage::supplyRange() const { return m_supplyRange; }
void AnalogChannelPage::setSupplyRange(const QString &value) {
    if (m_supplyRange == value) return;
    m_supplyRange = value;
    emit supplyRangeChanged();
}
QString AnalogChannelPage::supplyTriggerValue() const { return m_supplyTriggerValue; }
void AnalogChannelPage::setSupplyTriggerValue(const QString &value) {
    if (m_supplyTriggerValue == value) return;
    m_supplyTriggerValue = value;
    emit supplyTriggerValueChanged();
}
QString AnalogChannelPage::supplyMeterData() const { return m_supplyMeterData; }
void AnalogChannelPage::setSupplyMeterData(const QString &value) {
    if (m_supplyMeterData == value) return;
    m_supplyMeterData = value;
    emit supplyMeterDataChanged();
}

// COD
QString AnalogChannelPage::codRange() const { return m_codRange; }
void AnalogChannelPage::setCodRange(const QString &value) {
    if (m_codRange == value) return;
    m_codRange = value;
    emit codRangeChanged();
}
QString AnalogChannelPage::codOverLimit() const { return m_codOverLimit; }
void AnalogChannelPage::setCodOverLimit(const QString &value) {
    if (m_codOverLimit == value) return;
    m_codOverLimit = value;
    emit codOverLimitChanged();
}
QString AnalogChannelPage::codMeterData() const { return m_codMeterData; }
void AnalogChannelPage::setCodMeterData(const QString &value) {
    if (m_codMeterData == value) return;
    m_codMeterData = value;
    emit codMeterDataChanged();
}

// NH3
QString AnalogChannelPage::nh3Range() const { return m_nh3Range; }
void AnalogChannelPage::setNh3Range(const QString &value) {
    if (m_nh3Range == value) return;
    m_nh3Range = value;
    emit nh3RangeChanged();
}
QString AnalogChannelPage::nh3OverLimit() const { return m_nh3OverLimit; }
void AnalogChannelPage::setNh3OverLimit(const QString &value) {
    if (m_nh3OverLimit == value) return;
    m_nh3OverLimit = value;
    emit nh3OverLimitChanged();
}
QString AnalogChannelPage::nh3MeterData() const { return m_nh3MeterData; }
void AnalogChannelPage::setNh3MeterData(const QString &value) {
    if (m_nh3MeterData == value) return;
    m_nh3MeterData = value;
    emit nh3MeterDataChanged();
}

// TP
QString AnalogChannelPage::tpRange() const { return m_tpRange; }
void AnalogChannelPage::setTpRange(const QString &value) {
    if (m_tpRange == value) return;
    m_tpRange = value;
    emit tpRangeChanged();
}
QString AnalogChannelPage::tpOverLimit() const { return m_tpOverLimit; }
void AnalogChannelPage::setTpOverLimit(const QString &value) {
    if (m_tpOverLimit == value) return;
    m_tpOverLimit = value;
    emit tpOverLimitChanged();
}
QString AnalogChannelPage::tpMeterData() const { return m_tpMeterData; }
void AnalogChannelPage::setTpMeterData(const QString &value) {
    if (m_tpMeterData == value) return;
    m_tpMeterData = value;
    emit tpMeterDataChanged();
}

// TN
QString AnalogChannelPage::tnRange() const { return m_tnRange; }
void AnalogChannelPage::setTnRange(const QString &value) {
    if (m_tnRange == value) return;
    m_tnRange = value;
    emit tnRangeChanged();
}
QString AnalogChannelPage::tnOverLimit() const { return m_tnOverLimit; }
void AnalogChannelPage::setTnOverLimit(const QString &value) {
    if (m_tnOverLimit == value) return;
    m_tnOverLimit = value;
    emit tnOverLimitChanged();
}
QString AnalogChannelPage::tnMeterData() const { return m_tnMeterData; }
void AnalogChannelPage::setTnMeterData(const QString &value) {
    if (m_tnMeterData == value) return;
    m_tnMeterData = value;
    emit tnMeterDataChanged();
}

// 加载配置
void AnalogChannelPage::loadAllConfig()
{
    setSampleTriggerLower(m_settings->value("Analog/SampleTriggerLower", "4").toString());

    setSupplyRange(m_settings->value("Analog/SupplyRange", "20").toString());
    setSupplyTriggerValue(m_settings->value("Analog/SupplyTriggerValue", "12").toString());
    setSupplyMeterData(m_settings->value("Analog/SupplyMeterData", "0").toString());

    setCodRange(m_settings->value("Analog/CODRange", "500").toString());
    setCodOverLimit(m_settings->value("Analog/CODOverLimit", "50").toString());
    setCodMeterData(m_settings->value("Analog/CODMeterData", "0").toString());

    setNh3Range(m_settings->value("Analog/NH3Range", "50").toString());
    setNh3OverLimit(m_settings->value("Analog/NH3OverLimit", "5").toString());
    setNh3MeterData(m_settings->value("Analog/NH3MeterData", "0").toString());

    setTpRange(m_settings->value("Analog/TPRange", "10").toString());
    setTpOverLimit(m_settings->value("Analog/TPOverLimit", "1").toString());
    setTpMeterData(m_settings->value("Analog/TPMeterData", "0").toString());

    setTnRange(m_settings->value("Analog/TNRange", "50").toString());
    setTnOverLimit(m_settings->value("Analog/TNOverLimit", "15").toString());
    setTnMeterData(m_settings->value("Analog/TNMeterData", "0").toString());
}

// 保存配置
void AnalogChannelPage::saveAllConfig()
{
    m_settings->setValue("Analog/SampleTriggerLower", m_sampleTriggerLower);

    m_settings->setValue("Analog/SupplyRange", m_supplyRange);
    m_settings->setValue("Analog/SupplyTriggerValue", m_supplyTriggerValue);
    m_settings->setValue("Analog/SupplyMeterData", m_supplyMeterData);

    m_settings->setValue("Analog/CODRange", m_codRange);
    m_settings->setValue("Analog/CODOverLimit", m_codOverLimit);
    m_settings->setValue("Analog/CODMeterData", m_codMeterData);

    m_settings->setValue("Analog/NH3Range", m_nh3Range);
    m_settings->setValue("Analog/NH3OverLimit", m_nh3OverLimit);
    m_settings->setValue("Analog/NH3MeterData", m_nh3MeterData);

    m_settings->setValue("Analog/TPRange", m_tpRange);
    m_settings->setValue("Analog/TPOverLimit", m_tpOverLimit);
    m_settings->setValue("Analog/TPMeterData", m_tpMeterData);

    m_settings->setValue("Analog/TNRange", m_tnRange);
    m_settings->setValue("Analog/TNOverLimit", m_tnOverLimit);
    m_settings->setValue("Analog/TNMeterData", m_tnMeterData);

    m_settings->sync();
}
