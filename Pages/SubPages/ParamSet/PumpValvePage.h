#ifndef PUMPVALVEPAGE_H
#define PUMPVALVEPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class PumpValvePage : public QObject
{
    Q_OBJECT

    // 采样参数
    Q_PROPERTY(QString sampleCleanTimes READ sampleCleanTimes WRITE setSampleCleanTimes NOTIFY sampleCleanTimesChanged)
    Q_PROPERTY(QString sampleCleanVol READ sampleCleanVol WRITE setSampleCleanVol NOTIFY sampleCleanVolChanged)
    Q_PROPERTY(QString sampleStirTime READ sampleStirTime WRITE setSampleStirTime NOTIFY sampleStirTimeChanged)
    Q_PROPERTY(QString sampleEmptyTime READ sampleEmptyTime WRITE setSampleEmptyTime NOTIFY sampleEmptyTimeChanged)
    Q_PROPERTY(QString samplePipeEmptyTime READ samplePipeEmptyTime WRITE setSamplePipeEmptyTime NOTIFY samplePipeEmptyTimeChanged)
    Q_PROPERTY(QString sampleTimeout READ sampleTimeout WRITE setSampleTimeout NOTIFY sampleTimeoutChanged)
    Q_PROPERTY(QString extPumpPreTime READ extPumpPreTime WRITE setExtPumpPreTime NOTIFY extPumpPreTimeChanged)

    // 留样参数
    Q_PROPERTY(QString retainTimeout READ retainTimeout WRITE setRetainTimeout NOTIFY retainTimeoutChanged)
    Q_PROPERTY(QString retainPipeEmptyTime READ retainPipeEmptyTime WRITE setRetainPipeEmptyTime NOTIFY retainPipeEmptyTimeChanged)
    Q_PROPERTY(QString tableRotateTimeout READ tableRotateTimeout WRITE setTableRotateTimeout NOTIFY tableRotateTimeoutChanged)

    // 时间校准
    Q_PROPERTY(QString calibYear READ calibYear WRITE setCalibYear NOTIFY calibYearChanged)
    Q_PROPERTY(QString calibMonth READ calibMonth WRITE setCalibMonth NOTIFY calibMonthChanged)
    Q_PROPERTY(QString calibDay READ calibDay WRITE setCalibDay NOTIFY calibDayChanged)
    Q_PROPERTY(QString calibHour READ calibHour WRITE setCalibHour NOTIFY calibHourChanged)
    Q_PROPERTY(QString calibMinute READ calibMinute WRITE setCalibMinute NOTIFY calibMinuteChanged)
    Q_PROPERTY(QString calibSecond READ calibSecond WRITE setCalibSecond NOTIFY calibSecondChanged)

    // 泵 & 阀 & 流量计
    Q_PROPERTY(QString samplePumpSpeed READ samplePumpSpeed WRITE setSamplePumpSpeed NOTIFY samplePumpSpeedChanged)
    Q_PROPERTY(QString retainPumpSpeed READ retainPumpSpeed WRITE setRetainPumpSpeed NOTIFY retainPumpSpeedChanged)
    Q_PROPERTY(QString sampleBottleVol READ sampleBottleVol WRITE setSampleBottleVol NOTIFY sampleBottleVolChanged)
    Q_PROPERTY(QString retainBottleVol READ retainBottleVol WRITE setRetainBottleVol NOTIFY retainBottleVolChanged)
    Q_PROPERTY(QString retainBottleCount READ retainBottleCount WRITE setRetainBottleCount NOTIFY retainBottleCountChanged)
    Q_PROPERTY(QString flowMeterRange READ flowMeterRange WRITE setFlowMeterRange NOTIFY flowMeterRangeChanged)
    Q_PROPERTY(QString pulseFlowMeter READ pulseFlowMeter WRITE setPulseFlowMeter NOTIFY pulseFlowMeterChanged)

public:
    QString sampleCleanTimes() const;
    void setSampleCleanTimes(const QString& value);
    QString sampleCleanVol() const;
    void setSampleCleanVol(const QString& value);
    QString sampleStirTime() const;
    void setSampleStirTime(const QString& value);
    QString sampleEmptyTime() const;
    void setSampleEmptyTime(const QString& value);
    QString samplePipeEmptyTime() const;
    void setSamplePipeEmptyTime(const QString& value);
    QString sampleTimeout() const;
    void setSampleTimeout(const QString& value);
    QString extPumpPreTime() const;
    void setExtPumpPreTime(const QString& value);

    QString retainTimeout() const;
    void setRetainTimeout(const QString& value);
    QString retainPipeEmptyTime() const;
    void setRetainPipeEmptyTime(const QString& value);
    QString tableRotateTimeout() const;
    void setTableRotateTimeout(const QString& value);

    QString calibYear() const;
    void setCalibYear(const QString& value);
    QString calibMonth() const;
    void setCalibMonth(const QString& value);
    QString calibDay() const;
    void setCalibDay(const QString& value);
    QString calibHour() const;
    void setCalibHour(const QString& value);
    QString calibMinute() const;
    void setCalibMinute(const QString& value);
    QString calibSecond() const;
    void setCalibSecond(const QString& value);

    QString samplePumpSpeed() const;
    void setSamplePumpSpeed(const QString& value);
    QString retainPumpSpeed() const;
    void setRetainPumpSpeed(const QString& value);
    QString sampleBottleVol() const;
    void setSampleBottleVol(const QString& value);
    QString retainBottleVol() const;
    void setRetainBottleVol(const QString& value);
    QString retainBottleCount() const;
    void setRetainBottleCount(const QString& value);
    QString flowMeterRange() const;
    void setFlowMeterRange(const QString& value);
    QString pulseFlowMeter() const;
    void setPulseFlowMeter(const QString& value);

signals:
    void sampleCleanTimesChanged();
    void sampleCleanVolChanged();
    void sampleStirTimeChanged();
    void sampleEmptyTimeChanged();
    void samplePipeEmptyTimeChanged();
    void sampleTimeoutChanged();
    void extPumpPreTimeChanged();

    void retainTimeoutChanged();
    void retainPipeEmptyTimeChanged();
    void tableRotateTimeoutChanged();

    void calibYearChanged();
    void calibMonthChanged();
    void calibDayChanged();
    void calibHourChanged();
    void calibMinuteChanged();
    void calibSecondChanged();

    void samplePumpSpeedChanged();
    void retainPumpSpeedChanged();
    void sampleBottleVolChanged();
    void retainBottleVolChanged();
    void retainBottleCountChanged();
    void flowMeterRangeChanged();
    void pulseFlowMeterChanged();

public:
    static PumpValvePage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit PumpValvePage();
    ~PumpValvePage();

    QSettings* m_settings;

    QString m_sampleCleanTimes;
    QString m_sampleCleanVol;
    QString m_sampleStirTime;
    QString m_sampleEmptyTime;
    QString m_samplePipeEmptyTime;
    QString m_sampleTimeout;
    QString m_extPumpPreTime;

    QString m_retainTimeout;
    QString m_retainPipeEmptyTime;
    QString m_tableRotateTimeout;

    QString m_calibYear;
    QString m_calibMonth;
    QString m_calibDay;
    QString m_calibHour;
    QString m_calibMinute;
    QString m_calibSecond;

    QString m_samplePumpSpeed;
    QString m_retainPumpSpeed;
    QString m_sampleBottleVol;
    QString m_retainBottleVol;
    QString m_retainBottleCount;
    QString m_flowMeterRange;
    QString m_pulseFlowMeter;
};

#endif
