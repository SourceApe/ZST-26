#include "PumpValvePage.h"
#include <QDir>

PumpValvePage::PumpValvePage()
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

PumpValvePage::~PumpValvePage()
{
    delete m_settings;
}

PumpValvePage* PumpValvePage::instance()
{
    static PumpValvePage s_instance;
    return &s_instance;
}

// 采样参数
QString PumpValvePage::sampleBucketCleanCnt() const { return m_sampleBucketCleanCnt; }
void PumpValvePage::setSampleBucketCleanCnt(const QString &value) {
    if (m_sampleBucketCleanCnt == value) return;
    m_sampleBucketCleanCnt = value; emit sampleBucketCleanCntChanged();
}
QString PumpValvePage::sampleBucketCleanVol() const { return m_sampleBucketCleanVol; }
void PumpValvePage::setSampleBucketCleanVol(const QString &value) {
    if (m_sampleBucketCleanVol == value) return;
    m_sampleBucketCleanVol = value; emit sampleBucketCleanVolChanged();
}
QString PumpValvePage::sampleStirTime() const { return m_sampleStirTime; }
void PumpValvePage::setSampleStirTime(const QString &value) {
    if (m_sampleStirTime == value) return;
    m_sampleStirTime = value; emit sampleStirTimeChanged();
}
QString PumpValvePage::sampleEmptyTime() const { return m_sampleEmptyTime; }
void PumpValvePage::setSampleEmptyTime(const QString &value) {
    if (m_sampleEmptyTime == value) return;
    m_sampleEmptyTime = value; emit sampleEmptyTimeChanged();
}
QString PumpValvePage::samplePipeEmptyTime() const { return m_samplePipeEmptyTime; }
void PumpValvePage::setSamplePipeEmptyTime(const QString &value) {
    if (m_samplePipeEmptyTime == value) return;
    m_samplePipeEmptyTime = value; emit samplePipeEmptyTimeChanged();
}
QString PumpValvePage::sampleTimeout() const { return m_sampleTimeout; }
void PumpValvePage::setSampleTimeout(const QString &value) {
    if (m_sampleTimeout == value) return;
    m_sampleTimeout = value; emit sampleTimeoutChanged();
}
QString PumpValvePage::extPumpPreTime() const { return m_extPumpPreTime; }
void PumpValvePage::setExtPumpPreTime(const QString &value) {
    if (m_extPumpPreTime == value) return;
    m_extPumpPreTime = value; emit extPumpPreTimeChanged();
}

// 留样参数
QString PumpValvePage::retainTimeout() const { return m_retainTimeout; }
void PumpValvePage::setRetainTimeout(const QString &value) {
    if (m_retainTimeout == value) return;
    m_retainTimeout = value; emit retainTimeoutChanged();
}
QString PumpValvePage::retainPipeEmptyTime() const { return m_retainPipeEmptyTime; }
void PumpValvePage::setRetainPipeEmptyTime(const QString &value) {
    if (m_retainPipeEmptyTime == value) return;
    m_retainPipeEmptyTime = value; emit retainPipeEmptyTimeChanged();
}
QString PumpValvePage::tableRotateTimeout() const { return m_tableRotateTimeout; }
void PumpValvePage::setTableRotateTimeout(const QString &value) {
    if (m_tableRotateTimeout == value) return;
    m_tableRotateTimeout = value; emit tableRotateTimeoutChanged();
}

// 时间校准
QString PumpValvePage::calibYear() const { return m_calibYear; }
void PumpValvePage::setCalibYear(const QString &value) {
    if (m_calibYear == value) return;
    m_calibYear = value; emit calibYearChanged();
}
QString PumpValvePage::calibMonth() const { return m_calibMonth; }
void PumpValvePage::setCalibMonth(const QString &value) {
    if (m_calibMonth == value) return;
    m_calibMonth = value; emit calibMonthChanged();
}
QString PumpValvePage::calibDay() const { return m_calibDay; }
void PumpValvePage::setCalibDay(const QString &value) {
    if (m_calibDay == value) return;
    m_calibDay = value; emit calibDayChanged();
}
QString PumpValvePage::calibHour() const { return m_calibHour; }
void PumpValvePage::setCalibHour(const QString &value) {
    if (m_calibHour == value) return;
    m_calibHour = value; emit calibHourChanged();
}
QString PumpValvePage::calibMinute() const { return m_calibMinute; }
void PumpValvePage::setCalibMinute(const QString &value) {
    if (m_calibMinute == value) return;
    m_calibMinute = value; emit calibMinuteChanged();
}
QString PumpValvePage::calibSecond() const { return m_calibSecond; }
void PumpValvePage::setCalibSecond(const QString &value) {
    if (m_calibSecond == value) return;
    m_calibSecond = value; emit calibSecondChanged();
}

// 泵 & 流量计
QString PumpValvePage::samplePumpSpeed() const { return m_samplePumpSpeed; }
void PumpValvePage::setSamplePumpSpeed(const QString &value) {
    if (m_samplePumpSpeed == value) return;
    m_samplePumpSpeed = value; emit samplePumpSpeedChanged();
}
QString PumpValvePage::retainPumpSpeed() const { return m_retainPumpSpeed; }
void PumpValvePage::setRetainPumpSpeed(const QString &value) {
    if (m_retainPumpSpeed == value) return;
    m_retainPumpSpeed = value; emit retainPumpSpeedChanged();
}
QString PumpValvePage::sampleBucketVol() const { return m_sampleBucketVol; }
void PumpValvePage::setSampleBucketVol(const QString &value) {
    if (m_sampleBucketVol == value) return;
    m_sampleBucketVol = value; emit sampleBucketVolChanged();
}
QString PumpValvePage::retainBottleVol() const { return m_retainBottleVol; }
void PumpValvePage::setRetainBottleVol(const QString &value) {
    if (m_retainBottleVol == value) return;
    m_retainBottleVol = value; emit retainBottleVolChanged();
}
QString PumpValvePage::retainBottleCount() const { return m_retainBottleCount; }
void PumpValvePage::setRetainBottleCount(const QString &value) {
    if (m_retainBottleCount == value) return;
    m_retainBottleCount = value; emit retainBottleCountChanged();
}
QString PumpValvePage::flowMeterRange() const { return m_flowMeterRange; }
void PumpValvePage::setFlowMeterRange(const QString &value) {
    if (m_flowMeterRange == value) return;
    m_flowMeterRange = value; emit flowMeterRangeChanged();
}
QString PumpValvePage::pulseFlowMeter() const { return m_pulseFlowMeter; }
void PumpValvePage::setPulseFlowMeter(const QString &value) {
    if (m_pulseFlowMeter == value) return;
    m_pulseFlowMeter = value; emit pulseFlowMeterChanged();
}

void PumpValvePage::loadAllConfig()
{
    setSampleBucketCleanCnt(m_settings->value("PumpValve/SampleBucketCleanCnt", "2").toString());
    setSampleBucketCleanVol(m_settings->value("PumpValve/SampleBucketCleanVol", "500").toString());
    setSampleStirTime(m_settings->value("PumpValve/SampleStirTime", "10").toString());
    setSampleEmptyTime(m_settings->value("PumpValve/SampleEmptyTime", "10").toString());
    setSamplePipeEmptyTime(m_settings->value("PumpValve/SamplePipeEmptyTime", "5").toString());
    setSampleTimeout(m_settings->value("PumpValve/SampleTimeout", "60").toString());
    setExtPumpPreTime(m_settings->value("PumpValve/ExtPumpPreTime", "3").toString());

    setRetainTimeout(m_settings->value("PumpValve/RetainTimeout", "60").toString());
    setRetainPipeEmptyTime(m_settings->value("PumpValve/RetainPipeEmptyTime", "5").toString());
    setTableRotateTimeout(m_settings->value("PumpValve/TableRotateTimeout", "30").toString());

    setCalibYear(m_settings->value("PumpValve/CalibYear", "2025").toString());
    setCalibMonth(m_settings->value("PumpValve/CalibMonth", "4").toString());
    setCalibDay(m_settings->value("PumpValve/CalibDay", "1").toString());
    setCalibHour(m_settings->value("PumpValve/CalibHour", "0").toString());
    setCalibMinute(m_settings->value("PumpValve/CalibMinute", "0").toString());
    setCalibSecond(m_settings->value("PumpValve/CalibSecond", "0").toString());

    setSamplePumpSpeed(m_settings->value("PumpValve/SamplePumpSpeed", "60").toString());
    setRetainPumpSpeed(m_settings->value("PumpValve/RetainPumpSpeed", "60").toString());
    setSampleBucketVol(m_settings->value("PumpValve/SampleBucketVol", "1000").toString());
    setRetainBottleVol(m_settings->value("PumpValve/RetainBottletVol", "500").toString());
    setRetainBottleCount(m_settings->value("PumpValve/RetainBottleCount", "24").toString());
    setFlowMeterRange(m_settings->value("PumpValve/FlowMeterRange", "50").toString());
    setPulseFlowMeter(m_settings->value("PumpValve/PulseFlowMeter", "0.01").toString());
}

void PumpValvePage::saveAllConfig()
{
    m_settings->setValue("PumpValve/SampleBucketCleanCnt", m_sampleBucketCleanCnt);
    m_settings->setValue("PumpValve/SampleBucketCleanVol", m_sampleBucketCleanVol);
    m_settings->setValue("PumpValve/SampleStirTime", m_sampleStirTime);
    m_settings->setValue("PumpValve/SampleEmptyTime", m_sampleEmptyTime);
    m_settings->setValue("PumpValve/SamplePipeEmptyTime", m_samplePipeEmptyTime);
    m_settings->setValue("PumpValve/SampleTimeout", m_sampleTimeout);
    m_settings->setValue("PumpValve/ExtPumpPreTime", m_extPumpPreTime);

    m_settings->setValue("PumpValve/RetainTimeout", m_retainTimeout);
    m_settings->setValue("PumpValve/RetainPipeEmptyTime", m_retainPipeEmptyTime);
    m_settings->setValue("PumpValve/TableRotateTimeout", m_tableRotateTimeout);

    m_settings->setValue("PumpValve/CalibYear", m_calibYear);
    m_settings->setValue("PumpValve/CalibMonth", m_calibMonth);
    m_settings->setValue("PumpValve/CalibDay", m_calibDay);
    m_settings->setValue("PumpValve/CalibHour", m_calibHour);
    m_settings->setValue("PumpValve/CalibMinute", m_calibMinute);
    m_settings->setValue("PumpValve/CalibSecond", m_calibSecond);

    m_settings->setValue("PumpValve/SamplePumpSpeed", m_samplePumpSpeed);
    m_settings->setValue("PumpValve/RetainPumpSpeed", m_retainPumpSpeed);
    m_settings->setValue("PumpValve/SampleBucketVol", m_sampleBucketVol);
    m_settings->setValue("PumpValve/RetainBottleVol", m_retainBottleVol);
    m_settings->setValue("PumpValve/RetainBottleCount", m_retainBottleCount);
    m_settings->setValue("PumpValve/FlowMeterRange", m_flowMeterRange);
    m_settings->setValue("PumpValve/PulseFlowMeter", m_pulseFlowMeter);

    m_settings->sync();
}
