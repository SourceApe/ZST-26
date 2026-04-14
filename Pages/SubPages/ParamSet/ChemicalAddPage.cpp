#include "ChemicalAddPage.h"
#include <QDir>

ChemicalAddPage::ChemicalAddPage()
    : QObject(nullptr)
{
    QDir dir("/opt/zst26");
    if (!dir.exists())
        dir.mkpath("/opt/zst26");

    m_settings = new QSettings("/opt/zst26/config.ini", QSettings::IniFormat, this);
    loadAllConfig();
}

ChemicalAddPage* ChemicalAddPage::instance() {
    static ChemicalAddPage inst;
    return &inst;
}

// ================== GET / SET ==================
QVariantList ChemicalAddPage::channelList() const { return m_channels; }
QVariantList ChemicalAddPage::ratioList() const { return m_ratios; }

void ChemicalAddPage::setChannelList(const QVariantList& v) {
    m_channels = v;
    emit channelListChanged();
}

void ChemicalAddPage::setRatioList(const QVariantList& v) {
    m_ratios = v;
    emit ratioListChanged();
}

int ChemicalAddPage::globalChannel1() const { return m_ch1; }
int ChemicalAddPage::globalChannel2() const { return m_ch2; }
int ChemicalAddPage::globalChannel3() const { return m_ch3; }

void ChemicalAddPage::setGlobalChannel1(int v) {
    m_ch1 = v;
    emit globalChannel1Changed();
}

void ChemicalAddPage::setGlobalChannel2(int v) {
    m_ch2 = v;
    emit globalChannel2Changed();
}

void ChemicalAddPage::setGlobalChannel3(int v) {
    m_ch3 = v;
    emit globalChannel3Changed();
}

// ================== 加载配置（强制从文件刷新，保证切换页面恢复） ==================
void ChemicalAddPage::loadAllConfig()
{
    // 强制从磁盘重读，不使用内存缓存（关键）
    m_settings->sync();

    m_ch1 = m_settings->value("ChemicalAdd/Ch1", 0).toInt();
    m_ch2 = m_settings->value("ChemicalAdd/Ch2", 0).toInt();
    m_ch3 = m_settings->value("ChemicalAdd/Ch3", 0).toInt();

    m_channels.clear();
    m_ratios.clear();
    for(int i = 0; i < 24; i++) {
        m_channels.append(m_settings->value(QString("ChemicalAdd/Channel%1").arg(i), 0).toInt());
        m_ratios.append(m_settings->value(QString("ChemicalAdd/Ratio%1").arg(i), "1000").toString());
    }

}

// ================== 保存配置 ==================
void ChemicalAddPage::saveAllConfig()
{
    m_settings->setValue("ChemicalAdd/Ch1", m_ch1);
    m_settings->setValue("ChemicalAdd/Ch2", m_ch2);
    m_settings->setValue("ChemicalAdd/Ch3", m_ch3);

    for(int i = 0; i < 24; i++) {
        m_settings->setValue(QString("ChemicalAdd/Channel%1").arg(i), m_channels.at(i));
        m_settings->setValue(QString("ChemicalAdd/Ratio%1").arg(i), m_ratios.at(i));
    }

    m_settings->sync();
}
