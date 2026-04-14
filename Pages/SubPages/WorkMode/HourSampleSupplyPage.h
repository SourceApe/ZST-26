#ifndef HOURSAMPLESUPPLYPAGE_H
#define HOURSAMPLESUPPLYPAGE_H

#include <QObject>
#include <QSettings>
#include <QList>
#include <QString>
#include <QVariantList>

class HourSampleSupplyPage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList selectedHours READ selectedHours WRITE setSelectedHours NOTIFY selectedHoursChanged)
    Q_PROPERTY(int advanceMinutes READ advanceMinutes WRITE setAdvanceMinutes NOTIFY advanceMinutesChanged)

public:
    QVariantList selectedHours() const;
    void setSelectedHours(const QVariantList& value);

    int advanceMinutes() const;
    void setAdvanceMinutes(int value);

signals:
    void selectedHoursChanged();
    void advanceMinutesChanged();

public:
    static HourSampleSupplyPage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit HourSampleSupplyPage();
    ~HourSampleSupplyPage();

    QSettings* m_settings;
    QList<int> m_selectedHours;
    int m_advanceMinutes;
};

#endif
