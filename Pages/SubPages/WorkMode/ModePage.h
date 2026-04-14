#ifndef MODEPAGE_H
#define MODEPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class ModePage : public QObject
{
    Q_OBJECT

    // 采样模式
    Q_PROPERTY(int sampleModeIndex READ sampleModeIndex WRITE setSampleModeIndex NOTIFY sampleModeIndexChanged)

    //定量模式参数
    Q_PROPERTY(QString fixedSampleVol READ fixedSampleVol WRITE setFixedSampleVol NOTIFY fixedSampleVolChanged)
    Q_PROPERTY(QString fixedRetainBottleNum READ fixedRetainBottleNum WRITE setFixedRetainBottleNum NOTIFY fixedRetainBottleNumChanged)
    Q_PROPERTY(QString fixedRetainVol READ fixedRetainVol WRITE setFixedRetainVol NOTIFY fixedRetainVolChanged)
    //时间等比
    Q_PROPERTY(QString timeRatioSampleVol READ timeRatioSampleVol WRITE setTimeRatioSampleVol NOTIFY timeRatioSampleVolChanged)
    Q_PROPERTY(QString timeRatioInterval READ timeRatioInterval WRITE setTimeRatioInterval NOTIFY timeRatioIntervalChanged)
    Q_PROPERTY(QString timeRatioSampleCount READ timeRatioSampleCount WRITE setTimeRatioSampleCount NOTIFY timeRatioSampleCountChanged)
    //流量等比
    Q_PROPERTY(QString flowRatioSampleVol READ flowRatioSampleVol WRITE setFlowRatioSampleVol NOTIFY flowRatioSampleVolChanged)
    Q_PROPERTY(QString flowRatioSampleCount READ flowRatioSampleCount WRITE setFlowRatioSampleCount NOTIFY flowRatioSampleCountChanged)
    Q_PROPERTY(QString flowRatioTotalFlow READ flowRatioTotalFlow WRITE setFlowRatioTotalFlow NOTIFY flowRatioTotalFlowChanged)
    //流量跟踪
    Q_PROPERTY(QString flowTrackSampleRatio READ flowTrackSampleRatio WRITE setFlowTrackSampleRatio NOTIFY flowTrackSampleRatioChanged)
    Q_PROPERTY(QString flowTrackInterval READ flowTrackInterval WRITE setFlowTrackInterval NOTIFY flowTrackIntervalChanged)
    Q_PROPERTY(QString flowTrackSampleCount READ flowTrackSampleCount WRITE setFlowTrackSampleCount NOTIFY flowTrackSampleCountChanged)
    //外部触发
    Q_PROPERTY(QString extTriggerSampleVol READ extTriggerSampleVol WRITE setExtTriggerSampleVol NOTIFY extTriggerSampleVolChanged)
    Q_PROPERTY(QString extTriggerInterval READ extTriggerInterval WRITE setExtTriggerInterval NOTIFY extTriggerIntervalChanged)
    Q_PROPERTY(QString extTriggerSampleCount READ extTriggerSampleCount WRITE setExtTriggerSampleCount NOTIFY extTriggerSampleCountChanged)

    // 供样模式
    Q_PROPERTY(int supplyModeIndex READ supplyModeIndex WRITE setSupplyModeIndex NOTIFY supplyModeIndexChanged)

    //立即供样、整点供样、外部触发
    Q_PROPERTY(QString supplyTime READ supplyTime WRITE setSupplyTime NOTIFY supplyTimeChanged)
    Q_PROPERTY(QString supplyLowerLimit READ supplyLowerLimit WRITE setSupplyLowerLimit NOTIFY supplyLowerLimitChanged)

    // 留样模式
    Q_PROPERTY(int retainModeIndex READ retainModeIndex WRITE setRetainModeIndex NOTIFY retainModeIndexChanged)

    //同步留样、超标留样
    Q_PROPERTY(QString retainModeRetainVol READ retainModeRetainVol WRITE setRetainModeRetainVol NOTIFY retainModeRetainVolChanged)
    Q_PROPERTY(QString parallelSample READ parallelSample WRITE setParallelSample NOTIFY parallelSampleChanged)
    //超标留样
    Q_PROPERTY(QString overWaitTime READ overWaitTime WRITE setOverWaitTime NOTIFY overWaitTimeChanged)

    // 定时
    Q_PROPERTY(QString scheduleYear READ scheduleYear WRITE setScheduleYear NOTIFY scheduleYearChanged)
    Q_PROPERTY(QString scheduleMonth READ scheduleMonth WRITE setScheduleMonth NOTIFY scheduleMonthChanged)
    Q_PROPERTY(QString scheduleDay READ scheduleDay WRITE setScheduleDay NOTIFY scheduleDayChanged)
    Q_PROPERTY(QString scheduleHour READ scheduleHour WRITE setScheduleHour NOTIFY scheduleHourChanged)
    Q_PROPERTY(QString scheduleMinute READ scheduleMinute WRITE setScheduleMinute NOTIFY scheduleMinuteChanged)

public:
    int sampleModeIndex() const;
    void setSampleModeIndex(int value);

    QString fixedSampleVol() const;
    void setFixedSampleVol(const QString& value);
    QString fixedRetainBottleNum() const;
    void setFixedRetainBottleNum(const QString& value);
    QString fixedRetainVol() const;
    void setFixedRetainVol(const QString& value);

    QString timeRatioSampleVol() const;
    void setTimeRatioSampleVol(const QString& value);
    QString timeRatioInterval() const;
    void setTimeRatioInterval(const QString& value);
    QString timeRatioSampleCount() const;
    void setTimeRatioSampleCount(const QString& value);

    QString flowRatioSampleVol() const;
    void setFlowRatioSampleVol(const QString& value);
    QString flowRatioSampleCount() const;
    void setFlowRatioSampleCount(const QString& value);
    QString flowRatioTotalFlow() const;
    void setFlowRatioTotalFlow(const QString& value);

    QString flowTrackSampleRatio() const;
    void setFlowTrackSampleRatio(const QString& value);
    QString flowTrackInterval() const;
    void setFlowTrackInterval(const QString& value);
    QString flowTrackSampleCount() const;
    void setFlowTrackSampleCount(const QString& value);

    QString extTriggerSampleVol() const;
    void setExtTriggerSampleVol(const QString& value);
    QString extTriggerInterval() const;
    void setExtTriggerInterval(const QString& value);
    QString extTriggerSampleCount() const;
    void setExtTriggerSampleCount(const QString& value);

    int supplyModeIndex() const;
    void setSupplyModeIndex(int value);
    QString supplyTime() const;
    void setSupplyTime(const QString& value);
    QString supplyLowerLimit() const;
    void setSupplyLowerLimit(const QString& value);

    int retainModeIndex() const;
    void setRetainModeIndex(int value);
    QString retainModeRetainVol() const;
    void setRetainModeRetainVol(const QString& value);
    QString parallelSample() const;
    void setParallelSample(const QString& value);
    QString overWaitTime() const;
    void setOverWaitTime(const QString& value);

    QString scheduleYear() const;
    void setScheduleYear(const QString& value);
    QString scheduleMonth() const;
    void setScheduleMonth(const QString& value);
    QString scheduleDay() const;
    void setScheduleDay(const QString& value);
    QString scheduleHour() const;
    void setScheduleHour(const QString& value);
    QString scheduleMinute() const;
    void setScheduleMinute(const QString& value);

signals:
    void sampleModeIndexChanged();

    void fixedSampleVolChanged();
    void fixedRetainBottleNumChanged();
    void fixedRetainVolChanged();

    void timeRatioSampleVolChanged();
    void timeRatioIntervalChanged();
    void timeRatioSampleCountChanged();

    void flowRatioSampleVolChanged();
    void flowRatioSampleCountChanged();
    void flowRatioTotalFlowChanged();

    void flowTrackSampleRatioChanged();
    void flowTrackIntervalChanged();
    void flowTrackSampleCountChanged();

    void extTriggerSampleVolChanged();
    void extTriggerIntervalChanged();
    void extTriggerSampleCountChanged();

    void supplyModeIndexChanged();
    void supplyTimeChanged();
    void supplyLowerLimitChanged();

    void retainModeIndexChanged();
    void retainModeRetainVolChanged();
    void parallelSampleChanged();
    void overWaitTimeChanged();

    void scheduleYearChanged();
    void scheduleMonthChanged();
    void scheduleDayChanged();
    void scheduleHourChanged();
    void scheduleMinuteChanged();

public:
    static ModePage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit ModePage(); // 单例禁止传 parent
    ~ModePage();

    QSettings* m_settings;

    int m_sampleModeIndex;

    QString m_fixedSampleVol;
    QString m_fixedRetainBottleNum;
    QString m_fixedRetainVol;

    QString m_timeRatioSampleVol;
    QString m_timeRatioInterval;
    QString m_timeRatioSampleCount;

    QString m_flowRatioSampleVol;
    QString m_flowRatioSampleCount;
    QString m_flowRatioTotalFlow;

    QString m_flowTrackSampleRatio;
    QString m_flowTrackInterval;
    QString m_flowTrackSampleCount;

    QString m_extTriggerSampleVol;
    QString m_extTriggerInterval;
    QString m_extTriggerSampleCount;

    int m_supplyModeIndex;
    QString m_supplyTime;
    QString m_supplyLowerLimit;

    int m_retainModeIndex;
    QString m_retainModeRetainVol;
    QString m_parallelSample;
    QString m_overWaitTime;

    QString m_scheduleYear;
    QString m_scheduleMonth;
    QString m_scheduleDay;
    QString m_scheduleHour;
    QString m_scheduleMinute;
};

#endif /* MODEPAGE_H */
