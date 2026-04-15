#include "CalibrationPage.h"
#include <QDir>

CalibrationPage::CalibrationPage()
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

CalibrationPage::~CalibrationPage()
{
    delete m_settings;
}

CalibrationPage* CalibrationPage::instance()
{
    static CalibrationPage s_instance;
    return &s_instance;
}

// 加药泵
QString CalibrationPage::pump1Factor() const { return m_pump1Factor; }
void CalibrationPage::setPump1Factor(const QString &value) {
    if (m_pump1Factor == value) return;
    m_pump1Factor = value; emit pump1FactorChanged();
}

QString CalibrationPage::pump2Factor() const { return m_pump2Factor; }
void CalibrationPage::setPump2Factor(const QString &value) {
    if (m_pump2Factor == value) return;
    m_pump2Factor = value; emit pump2FactorChanged();
}

QString CalibrationPage::pump3Factor() const { return m_pump3Factor; }
void CalibrationPage::setPump3Factor(const QString &value) {
    if (m_pump3Factor == value) return;
    m_pump3Factor = value; emit pump3FactorChanged();
}

QString CalibrationPage::pump4Factor() const { return m_pump4Factor; }
void CalibrationPage::setPump4Factor(const QString &value) {
    if (m_pump4Factor == value) return;
    m_pump4Factor = value; emit pump4FactorChanged();
}

// 采样泵
QString CalibrationPage::samplePump200ml() const { return m_samplePump200ml; }
void CalibrationPage::setSamplePump200ml(const QString &value) {
    if (m_samplePump200ml == value) return;
    m_samplePump200ml = value; emit samplePump200mlChanged();
}

QString CalibrationPage::samplePump500ml() const { return m_samplePump500ml; }
void CalibrationPage::setSamplePump500ml(const QString &value) {
    if (m_samplePump500ml == value) return;
    m_samplePump500ml = value; emit samplePump500mlChanged();
}

QString CalibrationPage::samplePipePulse() const { return m_samplePipePulse; }
void CalibrationPage::setSamplePipePulse(const QString &value) {
    if (m_samplePipePulse == value) return;
    m_samplePipePulse = value; emit samplePipePulseChanged();
}

// 留样泵
QString CalibrationPage::retainPump200ml() const { return m_retainPump200ml; }
void CalibrationPage::setRetainPump200ml(const QString &value) {
    if (m_retainPump200ml == value) return;
    m_retainPump200ml = value; emit retainPump200mlChanged();
}

QString CalibrationPage::retainPump500ml() const { return m_retainPump500ml; }
void CalibrationPage::setRetainPump500ml(const QString &value) {
    if (m_retainPump500ml == value) return;
    m_retainPump500ml = value; emit retainPump500mlChanged();
}

QString CalibrationPage::retainPipePulse() const { return m_retainPipePulse; }
void CalibrationPage::setRetainPipePulse(const QString &value) {
    if (m_retainPipePulse == value) return;
    m_retainPipePulse = value; emit retainPipePulseChanged();
}

// 冰箱
QString CalibrationPage::fridgeRealTemp() const { return m_fridgeRealTemp; }
void CalibrationPage::setFridgeRealTemp(const QString &value) {
    if (m_fridgeRealTemp == value) return;
    m_fridgeRealTemp = value; emit fridgeRealTempChanged();
}

QString CalibrationPage::fridgeCalibTemp() const { return m_fridgeCalibTemp; }
void CalibrationPage::setFridgeCalibTemp(const QString &value) {
    if (m_fridgeCalibTemp == value) return;
    m_fridgeCalibTemp = value; emit fridgeCalibTempChanged();
}

// 加载全部
void CalibrationPage::loadAllConfig()
{
    setPump1Factor(m_settings->value("Calib/Pump1Factor", "1.000").toString());
    setPump2Factor(m_settings->value("Calib/Pump2Factor", "1.000").toString());
    setPump3Factor(m_settings->value("Calib/Pump3Factor", "1.000").toString());
    setPump4Factor(m_settings->value("Calib/Pump4Factor", "1.000").toString());

    setSamplePump200ml(m_settings->value("Calib/SamplePump200ml", "0").toString());
    setSamplePump500ml(m_settings->value("Calib/SamplePump500ml", "0").toString());
    setSamplePipePulse(m_settings->value("Calib/SamplePipePulse", "0").toString());

    setRetainPump200ml(m_settings->value("Calib/RetainPump200ml", "0").toString());
    setRetainPump500ml(m_settings->value("Calib/RetainPump500ml", "0").toString());
    setRetainPipePulse(m_settings->value("Calib/RetainPipePulse", "0").toString());

    setFridgeRealTemp(m_settings->value("Calib/FridgeRealTemp", "0.0").toString());
    setFridgeCalibTemp(m_settings->value("Calib/FridgeCalibTemp", "0.0").toString());
}

// ====================== 每个按钮独立保存（只存当前项） ======================

void CalibrationPage::savePump1Factor() {
    m_settings->setValue("Calib/Pump1Factor", m_pump1Factor);
    m_settings->sync();
}

void CalibrationPage::savePump2Factor() {
    m_settings->setValue("Calib/Pump2Factor", m_pump2Factor);
    m_settings->sync();
}

void CalibrationPage::savePump3Factor() {
    m_settings->setValue("Calib/Pump3Factor", m_pump3Factor);
    m_settings->sync();
}

void CalibrationPage::savePump4Factor() {
    m_settings->setValue("Calib/Pump4Factor", m_pump4Factor);
    m_settings->sync();
}

void CalibrationPage::saveSamplePipePulse() {
    m_settings->setValue("Calib/SamplePipePulse", m_samplePipePulse);
    m_settings->sync();
}

void CalibrationPage::saveSamplePump200ml() {
    m_settings->setValue("Calib/SamplePump200ml", m_samplePump200ml);
    m_settings->sync();
}

void CalibrationPage::saveSamplePump500ml() {
    m_settings->setValue("Calib/SamplePump500ml", m_samplePump500ml);
    m_settings->sync();
}

void CalibrationPage::saveRetainPipePulse() {
    m_settings->setValue("Calib/RetainPipePulse", m_retainPipePulse);
    m_settings->sync();
}

void CalibrationPage::saveRetainPump200ml() {
    m_settings->setValue("Calib/RetainPump200ml", m_retainPump200ml);
    m_settings->sync();
}

void CalibrationPage::saveRetainPump500ml() {
    m_settings->setValue("Calib/RetainPump500ml", m_retainPump500ml);
    m_settings->sync();
}

void CalibrationPage::saveFridgeCalib() {
    m_settings->setValue("Calib/FridgeRealTemp", m_fridgeRealTemp);
    m_settings->setValue("Calib/FridgeCalibTemp", m_fridgeCalibTemp);
    m_settings->sync();
}
