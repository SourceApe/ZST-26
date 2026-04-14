#include "ModePage.h"
#include <QDir>

ModePage::ModePage()
    : QObject(nullptr) // 单例不能有 parent
{
    // 固定路径 /opt/zst26 适合你的嵌入式设备
    QDir dir("/opt/zst26");
    if (!dir.exists()) {
        dir.mkpath("/opt/zst26");
    }

    m_settings = new QSettings("/opt/zst26/config.ini", QSettings::IniFormat, this);
    m_settings->setIniCodec("UTF-8");
    loadAllConfig();
}

ModePage::~ModePage()
{
    delete m_settings;
}

ModePage* ModePage::instance()
{
    static ModePage s_instance;
    return &s_instance;
}

int ModePage::sampleModeIndex() const { return m_sampleModeIndex; }
void ModePage::setSampleModeIndex(int value) {
    if (m_sampleModeIndex == value) return;
    m_sampleModeIndex = value;
    emit sampleModeIndexChanged();
}

QString ModePage::fixedSampleVol() const { return m_fixedSampleVol; }
void ModePage::setFixedSampleVol(const QString &value) {
    if (m_fixedSampleVol == value) return;
    m_fixedSampleVol = value;
    emit fixedSampleVolChanged();
}
QString ModePage::fixedRetainBottleNum() const { return m_fixedRetainBottleNum; }
void ModePage::setFixedRetainBottleNum(const QString &value) {
    if (m_fixedRetainBottleNum == value) return;
    m_fixedRetainBottleNum = value;
    emit fixedRetainBottleNumChanged();
}
QString ModePage::fixedRetainVol() const { return m_fixedRetainVol; }
void ModePage::setFixedRetainVol(const QString &value) {
    if (m_fixedRetainVol == value) return;
    m_fixedRetainVol = value;
    emit fixedRetainVolChanged();
}

QString ModePage::timeRatioSampleVol() const { return m_timeRatioSampleVol; }
void ModePage::setTimeRatioSampleVol(const QString &value) {
    if (m_timeRatioSampleVol == value) return;
    m_timeRatioSampleVol = value;
    emit timeRatioSampleVolChanged();
}
QString ModePage::timeRatioInterval() const { return m_timeRatioInterval; }
void ModePage::setTimeRatioInterval(const QString &value) {
    if (m_timeRatioInterval == value) return;
    m_timeRatioInterval = value;
    emit timeRatioIntervalChanged();
}
QString ModePage::timeRatioSampleCount() const { return m_timeRatioSampleCount; }
void ModePage::setTimeRatioSampleCount(const QString &value) {
    if (m_timeRatioSampleCount == value) return;
    m_timeRatioSampleCount = value;
    emit timeRatioSampleCountChanged();
}

QString ModePage::flowRatioSampleVol() const { return m_flowRatioSampleVol; }
void ModePage::setFlowRatioSampleVol(const QString &value) {
    if (m_flowRatioSampleVol == value) return;
    m_flowRatioSampleVol = value;
    emit flowRatioSampleVolChanged();
}
QString ModePage::flowRatioSampleCount() const { return m_flowRatioSampleCount; }
void ModePage::setFlowRatioSampleCount(const QString &value) {
    if (m_flowRatioSampleCount == value) return;
    m_flowRatioSampleCount = value;
    emit flowRatioSampleCountChanged();
}
QString ModePage::flowRatioTotalFlow() const { return m_flowRatioTotalFlow; }
void ModePage::setFlowRatioTotalFlow(const QString &value) {
    if (m_flowRatioTotalFlow == value) return;
    m_flowRatioTotalFlow = value;
    emit flowRatioTotalFlowChanged();
}

QString ModePage::flowTrackSampleRatio() const { return m_flowTrackSampleRatio; }
void ModePage::setFlowTrackSampleRatio(const QString &value) {
    if (m_flowTrackSampleRatio == value) return;
    m_flowTrackSampleRatio = value;
    emit flowTrackSampleRatioChanged();
}
QString ModePage::flowTrackInterval() const { return m_flowTrackInterval; }
void ModePage::setFlowTrackInterval(const QString &value) {
    if (m_flowTrackInterval == value) return;
    m_flowTrackInterval = value;
    emit flowTrackIntervalChanged();
}
QString ModePage::flowTrackSampleCount() const { return m_flowTrackSampleCount; }
void ModePage::setFlowTrackSampleCount(const QString &value) {
    if (m_flowTrackSampleCount == value) return;
    m_flowTrackSampleCount = value;
    emit flowTrackSampleCountChanged();
}

QString ModePage::extTriggerSampleVol() const { return m_extTriggerSampleVol; }
void ModePage::setExtTriggerSampleVol(const QString &value) {
    if (m_extTriggerSampleVol == value) return;
    m_extTriggerSampleVol = value;
    emit extTriggerSampleVolChanged();
}
QString ModePage::extTriggerInterval() const { return m_extTriggerInterval; }
void ModePage::setExtTriggerInterval(const QString &value) {
    if (m_extTriggerInterval == value) return;
    m_extTriggerInterval = value;
    emit extTriggerIntervalChanged();
}
QString ModePage::extTriggerSampleCount() const { return m_extTriggerSampleCount; }
void ModePage::setExtTriggerSampleCount(const QString &value) {
    if (m_extTriggerSampleCount == value) return;
    m_extTriggerSampleCount = value;
    emit extTriggerSampleCountChanged();
}

int ModePage::supplyModeIndex() const { return m_supplyModeIndex; }
void ModePage::setSupplyModeIndex(int value) {
    if (m_supplyModeIndex == value) return;
    m_supplyModeIndex = value;
    emit supplyModeIndexChanged();
}
QString ModePage::supplyTime() const { return m_supplyTime; }
void ModePage::setSupplyTime(const QString &value) {
    if (m_supplyTime == value) return;
    m_supplyTime = value;
    emit supplyTimeChanged();
}
QString ModePage::supplyLowerLimit() const { return m_supplyLowerLimit; }
void ModePage::setSupplyLowerLimit(const QString &value) {
    if (m_supplyLowerLimit == value) return;
    m_supplyLowerLimit = value;
    emit supplyLowerLimitChanged();
}

int ModePage::retainModeIndex() const { return m_retainModeIndex; }
void ModePage::setRetainModeIndex(int value) {
    if (m_retainModeIndex == value) return;
    m_retainModeIndex = value;
    emit retainModeIndexChanged();
}
QString ModePage::retainModeRetainVol() const { return m_retainModeRetainVol; }
void ModePage::setRetainModeRetainVol(const QString &value) {
    if (m_retainModeRetainVol == value) return;
    m_retainModeRetainVol = value;
    emit retainModeRetainVolChanged();
}
QString ModePage::parallelSample() const { return m_parallelSample; }
void ModePage::setParallelSample(const QString &value) {
    if (m_parallelSample == value) return;
    m_parallelSample = value;
    emit parallelSampleChanged();
}
QString ModePage::overWaitTime() const { return m_overWaitTime; }
void ModePage::setOverWaitTime(const QString &value) {
    if (m_overWaitTime == value) return;
    m_overWaitTime = value;
    emit overWaitTimeChanged();
}

QString ModePage::scheduleYear() const { return m_scheduleYear; }
void ModePage::setScheduleYear(const QString &value) {
    if (m_scheduleYear == value) return;
    m_scheduleYear = value;
    emit scheduleYearChanged();
}
QString ModePage::scheduleMonth() const { return m_scheduleMonth; }
void ModePage::setScheduleMonth(const QString &value) {
    if (m_scheduleMonth == value) return;
    m_scheduleMonth = value;
    emit scheduleMonthChanged();
}
QString ModePage::scheduleDay() const { return m_scheduleDay; }
void ModePage::setScheduleDay(const QString &value) {
    if (m_scheduleDay == value) return;
    m_scheduleDay = value;
    emit scheduleDayChanged();
}
QString ModePage::scheduleHour() const { return m_scheduleHour; }
void ModePage::setScheduleHour(const QString &value) {
    if (m_scheduleHour == value) return;
    m_scheduleHour = value;
    emit scheduleHourChanged();
}
QString ModePage::scheduleMinute() const { return m_scheduleMinute; }
void ModePage::setScheduleMinute(const QString &value) {
    if (m_scheduleMinute == value) return;
    m_scheduleMinute = value;
    emit scheduleMinuteChanged();
}

// ====================== 加载配置 ======================
void ModePage::loadAllConfig()
{
    setSampleModeIndex(m_settings->value("Sample/ModeIndex", 0).toInt());

    setFixedSampleVol(m_settings->value("Sample/FixedSampleVol", "500").toString());
    setFixedRetainBottleNum(m_settings->value("Sample/FixedRetainBottleNum", "1").toString());
    setFixedRetainVol(m_settings->value("Sample/FixedRetainVol", "500").toString());

    setTimeRatioSampleVol(m_settings->value("Sample/TimeRatioSampleVol", "500").toString());
    setTimeRatioInterval(m_settings->value("Sample/TimeRatioInterval", "10").toString());
    setTimeRatioSampleCount(m_settings->value("Sample/TimeRatioSampleCount", "2").toString());

    setFlowRatioSampleVol(m_settings->value("Sample/FlowRatioSampleVol", "500").toString());
    setFlowRatioSampleCount(m_settings->value("Sample/FlowRatioSampleCount", "2").toString());
    setFlowRatioTotalFlow(m_settings->value("Sample/FlowRatioTotalFlow", "1000").toString());

    setFlowTrackSampleRatio(m_settings->value("Sample/FlowTrackSampleRatio", "1000").toString());
    setFlowTrackInterval(m_settings->value("Sample/FlowTrackInterval", "10").toString());
    setFlowTrackSampleCount(m_settings->value("Sample/FlowTrackSampleCount", "2").toString());

    setExtTriggerSampleVol(m_settings->value("Sample/ExtTriggerSampleVol", "500").toString());
    setExtTriggerInterval(m_settings->value("Sample/ExtTriggerInterval", "10").toString());
    setExtTriggerSampleCount(m_settings->value("Sample/ExtTriggerSampleCount", "2").toString());

    setSupplyModeIndex(m_settings->value("Supply/ModeIndex", 0).toInt());
    setSupplyTime(m_settings->value("Supply/Time", "5").toString());
    setSupplyLowerLimit(m_settings->value("Supply/LowerLimit", "100").toString());

    setRetainModeIndex(m_settings->value("Retain/ModeIndex", 0).toInt());

    setRetainModeRetainVol(m_settings->value("Retain/RetainModeRetainVol", "500").toString());
    setParallelSample(m_settings->value("Retain/ParallelSample", "2").toString());
    setOverWaitTime(m_settings->value("Retain/OverWaitTime", "10").toString());

    setScheduleYear(m_settings->value("Schedule/Year", "2025").toString());
    setScheduleMonth(m_settings->value("Schedule/Month", "4").toString());
    setScheduleDay(m_settings->value("Schedule/Day", "8").toString());
    setScheduleHour(m_settings->value("Schedule/Hour", "8").toString());
    setScheduleMinute(m_settings->value("Schedule/Minute", "0").toString());
}

// ====================== 保存配置 ======================
void ModePage::saveAllConfig()
{
    m_settings->setValue("Sample/ModeIndex", m_sampleModeIndex);

    m_settings->setValue("Sample/FixedSampleVol", m_fixedSampleVol);
    m_settings->setValue("Sample/FixedRetainBottleNum", m_fixedRetainBottleNum);
    m_settings->setValue("Sample/FixedRetainVol", m_fixedRetainVol);

    m_settings->setValue("Sample/TimeRatioSampleVol", m_timeRatioSampleVol);
    m_settings->setValue("Sample/TimeRatioInterval", m_timeRatioInterval);
    m_settings->setValue("Sample/TimeRatioSampleCount", m_timeRatioSampleCount);

    m_settings->setValue("Sample/FlowRatioSampleVol", m_flowRatioSampleVol);
    m_settings->setValue("Sample/FlowRatioSampleCount", m_flowRatioSampleCount);
    m_settings->setValue("Sample/FlowRatioTotalFlow", m_flowRatioTotalFlow);

    m_settings->setValue("Sample/FlowTrackSampleRatio", m_flowTrackSampleRatio);
    m_settings->setValue("Sample/FlowTrackInterval", m_flowTrackInterval);
    m_settings->setValue("Sample/FlowTrackSampleCount", m_flowTrackSampleCount);

    m_settings->setValue("Sample/ExtTriggerSampleVol", m_extTriggerSampleVol);
    m_settings->setValue("Sample/ExtTriggerInterval", m_extTriggerInterval);
    m_settings->setValue("Sample/ExtTriggerSampleCount", m_extTriggerSampleCount);

    m_settings->setValue("Supply/ModeIndex", m_supplyModeIndex);
    m_settings->setValue("Supply/Time", m_supplyTime);
    m_settings->setValue("Supply/LowerLimit", m_supplyLowerLimit);

    m_settings->setValue("Retain/ModeIndex", m_retainModeIndex);
    m_settings->setValue("Retain/RetainModeRetainVol", m_retainModeRetainVol);
    m_settings->setValue("Retain/ParallelSample", m_parallelSample);
    m_settings->setValue("Retain/OverWaitTime", m_overWaitTime);

    m_settings->setValue("Schedule/Year", m_scheduleYear);
    m_settings->setValue("Schedule/Month", m_scheduleMonth);
    m_settings->setValue("Schedule/Day", m_scheduleDay);
    m_settings->setValue("Schedule/Hour", m_scheduleHour);
    m_settings->setValue("Schedule/Minute", m_scheduleMinute);

    m_settings->sync();
}
