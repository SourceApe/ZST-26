#ifndef FRIDGEPAGE_H
#define FRIDGEPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class FridgePage : public QObject
{
    Q_OBJECT

    // 制冷温控参数
    Q_PROPERTY(QString setTemp READ setTemp WRITE setSetTemp NOTIFY setTempChanged)
    Q_PROPERTY(QString tempOverHighAlarm READ tempOverHighAlarm WRITE setTempOverHighAlarm NOTIFY tempOverHighAlarmChanged)
    Q_PROPERTY(QString tempOverLowAlarm READ tempOverLowAlarm WRITE setTempOverLowAlarm NOTIFY tempOverLowAlarmChanged)
    Q_PROPERTY(QString overLimitDelayAlarm READ overLimitDelayAlarm WRITE setOverLimitDelayAlarm NOTIFY overLimitDelayAlarmChanged)
    Q_PROPERTY(QString defrostTime READ defrostTime WRITE setDefrostTime NOTIFY defrostTimeChanged)

public:
    QString setTemp() const;
    void setSetTemp(const QString& value);

    QString tempOverHighAlarm() const;
    void setTempOverHighAlarm(const QString& value);

    QString tempOverLowAlarm() const;
    void setTempOverLowAlarm(const QString& value);

    QString overLimitDelayAlarm() const;
    void setOverLimitDelayAlarm(const QString& value);

    QString defrostTime() const;
    void setDefrostTime(const QString& value);

signals:
    void setTempChanged();
    void tempOverHighAlarmChanged();
    void tempOverLowAlarmChanged();
    void overLimitDelayAlarmChanged();
    void defrostTimeChanged();

public:
    static FridgePage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit FridgePage();
    ~FridgePage();

    QSettings* m_settings;

    QString m_setTemp;
    QString m_tempOverHighAlarm;
    QString m_tempOverLowAlarm;
    QString m_overLimitDelayAlarm;
    QString m_defrostTime;
};

#endif /* FRIDGEPAGE_Hs */
