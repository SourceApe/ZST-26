#ifndef CALIBRATIONPAGE_H
#define CALIBRATIONPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class CalibrationPage : public QObject
{
    Q_OBJECT

    // 加药泵1~3
    Q_PROPERTY(QString pump1Factor READ pump1Factor WRITE setPump1Factor NOTIFY pump1FactorChanged)
    Q_PROPERTY(QString pump2Factor READ pump2Factor WRITE setPump2Factor NOTIFY pump2FactorChanged)
    Q_PROPERTY(QString pump3Factor READ pump3Factor WRITE setPump3Factor NOTIFY pump3FactorChanged)

    // 采样泵
    Q_PROPERTY(QString samplePump500ml READ samplePump500ml WRITE setSamplePump500ml NOTIFY samplePump500mlChanged)
    Q_PROPERTY(QString samplePipePulse READ samplePipePulse WRITE setSamplePipePulse NOTIFY samplePipePulseChanged)

    // 留样泵
    Q_PROPERTY(QString retainPump10ml READ retainPump10ml WRITE setRetainPump10ml NOTIFY retainPump10mlChanged)
    Q_PROPERTY(QString retainPump500ml READ retainPump500ml WRITE setRetainPump500ml NOTIFY retainPump500mlChanged)
    Q_PROPERTY(QString retainPipePulse READ retainPipePulse WRITE setRetainPipePulse NOTIFY retainPipePulseChanged)

    // 冰箱温度校准
    Q_PROPERTY(QString fridgeRealTemp READ fridgeRealTemp WRITE setFridgeRealTemp NOTIFY fridgeRealTempChanged)
    Q_PROPERTY(QString fridgeCalibTemp READ fridgeCalibTemp WRITE setFridgeCalibTemp NOTIFY fridgeCalibTempChanged)

public:
    QString pump1Factor() const;
    void setPump1Factor(const QString& value);

    QString pump2Factor() const;
    void setPump2Factor(const QString& value);

    QString pump3Factor() const;
    void setPump3Factor(const QString& value);

    QString samplePump500ml() const;
    void setSamplePump500ml(const QString& value);

    QString samplePipePulse() const;
    void setSamplePipePulse(const QString& value);

    QString retainPump10ml() const;
    void setRetainPump10ml(const QString& value);

    QString retainPump500ml() const;
    void setRetainPump500ml(const QString& value);

    QString retainPipePulse() const;
    void setRetainPipePulse(const QString& value);

    QString fridgeRealTemp() const;
    void setFridgeRealTemp(const QString& value);

    QString fridgeCalibTemp() const;
    void setFridgeCalibTemp(const QString& value);

signals:
    void pump1FactorChanged();
    void pump2FactorChanged();
    void pump3FactorChanged();
    void samplePump500mlChanged();
    void samplePipePulseChanged();
    void retainPump10mlChanged();
    void retainPump500mlChanged();
    void retainPipePulseChanged();
    void fridgeRealTempChanged();
    void fridgeCalibTempChanged();

public:
    static CalibrationPage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit CalibrationPage();
    ~CalibrationPage();

    QSettings* m_settings;

    QString m_pump1Factor;
    QString m_pump2Factor;
    QString m_pump3Factor;

    QString m_samplePump500ml;
    QString m_samplePipePulse;

    QString m_retainPump10ml;
    QString m_retainPump500ml;
    QString m_retainPipePulse;

    QString m_fridgeRealTemp;
    QString m_fridgeCalibTemp;
};

#endif // CALIBRATIONPAGE_H
