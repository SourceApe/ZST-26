#ifndef CALIBRATIONPAGE_H
#define CALIBRATIONPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class CalibrationPage : public QObject
{
    Q_OBJECT

    // 加药泵1~4
    Q_PROPERTY(QString pump1Factor READ pump1Factor WRITE setPump1Factor NOTIFY pump1FactorChanged)
    Q_PROPERTY(QString pump2Factor READ pump2Factor WRITE setPump2Factor NOTIFY pump2FactorChanged)
    Q_PROPERTY(QString pump3Factor READ pump3Factor WRITE setPump3Factor NOTIFY pump3FactorChanged)
    Q_PROPERTY(QString pump4Factor READ pump4Factor WRITE setPump4Factor NOTIFY pump4FactorChanged)

    // 采样泵
    Q_PROPERTY(QString samplePump200ml READ samplePump200ml WRITE setSamplePump200ml NOTIFY samplePump200mlChanged)
    Q_PROPERTY(QString samplePump500ml READ samplePump500ml WRITE setSamplePump500ml NOTIFY samplePump500mlChanged)
    Q_PROPERTY(QString samplePipePulse READ samplePipePulse WRITE setSamplePipePulse NOTIFY samplePipePulseChanged)

    // 留样泵
    Q_PROPERTY(QString retainPump200ml READ retainPump200ml WRITE setRetainPump200ml NOTIFY retainPump200mlChanged)
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

    QString pump4Factor() const;
    void setPump4Factor(const QString& value);

    QString samplePump200ml() const;
    void setSamplePump200ml(const QString& value);

    QString samplePump500ml() const;
    void setSamplePump500ml(const QString& value);

    QString samplePipePulse() const;
    void setSamplePipePulse(const QString& value);

    QString retainPump200ml() const;
    void setRetainPump200ml(const QString& value);

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
    void pump4FactorChanged();
    void samplePump200mlChanged();
    void samplePump500mlChanged();
    void samplePipePulseChanged();
    void retainPump200mlChanged();
    void retainPump500mlChanged();
    void retainPipePulseChanged();
    void fridgeRealTempChanged();
    void fridgeCalibTempChanged();

public:
    static CalibrationPage* instance();
    Q_INVOKABLE void loadAllConfig();

    // 每个校准按钮 独立保存
    Q_INVOKABLE void savePump1Factor();
    Q_INVOKABLE void savePump2Factor();
    Q_INVOKABLE void savePump3Factor();
    Q_INVOKABLE void savePump4Factor();

    Q_INVOKABLE void saveSamplePipePulse();
    Q_INVOKABLE void saveSamplePump200ml();
    Q_INVOKABLE void saveSamplePump500ml();

    Q_INVOKABLE void saveRetainPipePulse();
    Q_INVOKABLE void saveRetainPump200ml();
    Q_INVOKABLE void saveRetainPump500ml();

    Q_INVOKABLE void saveFridgeCalib();

private:
    explicit CalibrationPage();
    ~CalibrationPage();

    QSettings* m_settings;

    QString m_pump1Factor;
    QString m_pump2Factor;
    QString m_pump3Factor;
    QString m_pump4Factor;

    QString m_samplePump200ml;
    QString m_samplePump500ml;
    QString m_samplePipePulse;

    QString m_retainPump200ml;
    QString m_retainPump500ml;
    QString m_retainPipePulse;

    QString m_fridgeRealTemp;
    QString m_fridgeCalibTemp;
};

#endif // CALIBRATIONPAGE_H
