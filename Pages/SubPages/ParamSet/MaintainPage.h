#ifndef MAINTAINPAGE_H
#define MAINTAINPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class MaintainPage : public QObject
{
    Q_OBJECT

    // 通道1固化剂
    Q_PROPERTY(QString ch1Total READ ch1Total WRITE setCh1Total NOTIFY ch1TotalChanged)
    Q_PROPERTY(QString ch1AlarmLeft READ ch1AlarmLeft WRITE setCh1AlarmLeft NOTIFY ch1AlarmLeftChanged)
    Q_PROPERTY(QString ch1Expire READ ch1Expire WRITE setCh1Expire NOTIFY ch1ExpireChanged)

    // 通道2固化剂
    Q_PROPERTY(QString ch2Total READ ch2Total WRITE setCh2Total NOTIFY ch2TotalChanged)
    Q_PROPERTY(QString ch2AlarmLeft READ ch2AlarmLeft WRITE setCh2AlarmLeft NOTIFY ch2AlarmLeftChanged)
    Q_PROPERTY(QString ch2Expire READ ch2Expire WRITE setCh2Expire NOTIFY ch2ExpireChanged)

    // 通道3固化剂
    Q_PROPERTY(QString ch3Total READ ch3Total WRITE setCh3Total NOTIFY ch3TotalChanged)
    Q_PROPERTY(QString ch3AlarmLeft READ ch3AlarmLeft WRITE setCh3AlarmLeft NOTIFY ch3AlarmLeftChanged)
    Q_PROPERTY(QString ch3Expire READ ch3Expire WRITE setCh3Expire NOTIFY ch3ExpireChanged)

    // 泵管寿命
    Q_PROPERTY(QString samplePumpLife READ samplePumpLife WRITE setSamplePumpLife NOTIFY samplePumpLifeChanged)
    Q_PROPERTY(QString retainPumpLife READ retainPumpLife WRITE setRetainPumpLife NOTIFY retainPumpLifeChanged)

public:
    QString ch1Total() const;
    void setCh1Total(const QString& value);
    QString ch1AlarmLeft() const;
    void setCh1AlarmLeft(const QString& value);
    QString ch1Expire() const;
    void setCh1Expire(const QString& value);

    QString ch2Total() const;
    void setCh2Total(const QString& value);
    QString ch2AlarmLeft() const;
    void setCh2AlarmLeft(const QString& value);
    QString ch2Expire() const;
    void setCh2Expire(const QString& value);

    QString ch3Total() const;
    void setCh3Total(const QString& value);
    QString ch3AlarmLeft() const;
    void setCh3AlarmLeft(const QString& value);
    QString ch3Expire() const;
    void setCh3Expire(const QString& value);

    QString samplePumpLife() const;
    void setSamplePumpLife(const QString& value);
    QString retainPumpLife() const;
    void setRetainPumpLife(const QString& value);

signals:
    void ch1TotalChanged();
    void ch1AlarmLeftChanged();
    void ch1ExpireChanged();

    void ch2TotalChanged();
    void ch2AlarmLeftChanged();
    void ch2ExpireChanged();

    void ch3TotalChanged();
    void ch3AlarmLeftChanged();
    void ch3ExpireChanged();

    void samplePumpLifeChanged();
    void retainPumpLifeChanged();

public:
    static MaintainPage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit MaintainPage();
    ~MaintainPage();

    QSettings* m_settings;

    QString m_ch1Total;
    QString m_ch1AlarmLeft;
    QString m_ch1Expire;

    QString m_ch2Total;
    QString m_ch2AlarmLeft;
    QString m_ch2Expire;

    QString m_ch3Total;
    QString m_ch3AlarmLeft;
    QString m_ch3Expire;

    QString m_samplePumpLife;
    QString m_retainPumpLife;
};

#endif // MAINTAINPAGE_H
