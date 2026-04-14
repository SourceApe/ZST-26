#ifndef ANALOGCHANNELPAGE_H
#define ANALOGCHANNELPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class AnalogChannelPage : public QObject
{
    Q_OBJECT

    // 4-20mA 外部触发采样
    Q_PROPERTY(QString sampleTriggerLower READ sampleTriggerLower WRITE setSampleTriggerLower NOTIFY sampleTriggerLowerChanged)

    // 4-20mA 外部触发供样
    Q_PROPERTY(QString supplyRange READ supplyRange WRITE setSupplyRange NOTIFY supplyRangeChanged)
    Q_PROPERTY(QString supplyTriggerValue READ supplyTriggerValue WRITE setSupplyTriggerValue NOTIFY supplyTriggerValueChanged)
    Q_PROPERTY(QString supplyMeterData READ supplyMeterData WRITE setSupplyMeterData NOTIFY supplyMeterDataChanged)

    // 超标留样 - COD
    Q_PROPERTY(QString codRange READ codRange WRITE setCodRange NOTIFY codRangeChanged)
    Q_PROPERTY(QString codOverLimit READ codOverLimit WRITE setCodOverLimit NOTIFY codOverLimitChanged)
    Q_PROPERTY(QString codMeterData READ codMeterData WRITE setCodMeterData NOTIFY codMeterDataChanged)

    // 超标留样 - NH3
    Q_PROPERTY(QString nh3Range READ nh3Range WRITE setNh3Range NOTIFY nh3RangeChanged)
    Q_PROPERTY(QString nh3OverLimit READ nh3OverLimit WRITE setNh3OverLimit NOTIFY nh3OverLimitChanged)
    Q_PROPERTY(QString nh3MeterData READ nh3MeterData WRITE setNh3MeterData NOTIFY nh3MeterDataChanged)

    // 超标留样 - TP
    Q_PROPERTY(QString tpRange READ tpRange WRITE setTpRange NOTIFY tpRangeChanged)
    Q_PROPERTY(QString tpOverLimit READ tpOverLimit WRITE setTpOverLimit NOTIFY tpOverLimitChanged)
    Q_PROPERTY(QString tpMeterData READ tpMeterData WRITE setTpMeterData NOTIFY tpMeterDataChanged)

    // 超标留样 - TN
    Q_PROPERTY(QString tnRange READ tnRange WRITE setTnRange NOTIFY tnRangeChanged)
    Q_PROPERTY(QString tnOverLimit READ tnOverLimit WRITE setTnOverLimit NOTIFY tnOverLimitChanged)
    Q_PROPERTY(QString tnMeterData READ tnMeterData WRITE setTnMeterData NOTIFY tnMeterDataChanged)

public:
    QString sampleTriggerLower() const;
    void setSampleTriggerLower(const QString& value);

    QString supplyRange() const;
    void setSupplyRange(const QString& value);
    QString supplyTriggerValue() const;
    void setSupplyTriggerValue(const QString& value);
    QString supplyMeterData() const;
    void setSupplyMeterData(const QString& value);

    QString codRange() const;
    void setCodRange(const QString& value);
    QString codOverLimit() const;
    void setCodOverLimit(const QString& value);
    QString codMeterData() const;
    void setCodMeterData(const QString& value);

    QString nh3Range() const;
    void setNh3Range(const QString& value);
    QString nh3OverLimit() const;
    void setNh3OverLimit(const QString& value);
    QString nh3MeterData() const;
    void setNh3MeterData(const QString& value);

    QString tpRange() const;
    void setTpRange(const QString& value);
    QString tpOverLimit() const;
    void setTpOverLimit(const QString& value);
    QString tpMeterData() const;
    void setTpMeterData(const QString& value);

    QString tnRange() const;
    void setTnRange(const QString& value);
    QString tnOverLimit() const;
    void setTnOverLimit(const QString& value);
    QString tnMeterData() const;
    void setTnMeterData(const QString& value);

signals:
    void sampleTriggerLowerChanged();

    void supplyRangeChanged();
    void supplyTriggerValueChanged();
    void supplyMeterDataChanged();

    void codRangeChanged();
    void codOverLimitChanged();
    void codMeterDataChanged();

    void nh3RangeChanged();
    void nh3OverLimitChanged();
    void nh3MeterDataChanged();

    void tpRangeChanged();
    void tpOverLimitChanged();
    void tpMeterDataChanged();

    void tnRangeChanged();
    void tnOverLimitChanged();
    void tnMeterDataChanged();

public:
    static AnalogChannelPage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit AnalogChannelPage();
    ~AnalogChannelPage();

    QSettings* m_settings;

    QString m_sampleTriggerLower;

    QString m_supplyRange;
    QString m_supplyTriggerValue;
    QString m_supplyMeterData;

    QString m_codRange;
    QString m_codOverLimit;
    QString m_codMeterData;

    QString m_nh3Range;
    QString m_nh3OverLimit;
    QString m_nh3MeterData;

    QString m_tpRange;
    QString m_tpOverLimit;
    QString m_tpMeterData;

    QString m_tnRange;
    QString m_tnOverLimit;
    QString m_tnMeterData;
};

#endif
