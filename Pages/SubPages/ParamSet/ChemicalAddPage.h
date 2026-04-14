#ifndef CHEMICALADDPAGE_H
#define CHEMICALADDPAGE_H

#include <QObject>
#include <QSettings>
#include <QVariantList>

class ChemicalAddPage : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVariantList channelList READ channelList WRITE setChannelList NOTIFY channelListChanged)
    Q_PROPERTY(QVariantList ratioList   READ ratioList   WRITE setRatioList   NOTIFY ratioListChanged)

    Q_PROPERTY(int globalChannel1 READ globalChannel1 WRITE setGlobalChannel1 NOTIFY globalChannel1Changed)
    Q_PROPERTY(int globalChannel2 READ globalChannel2 WRITE setGlobalChannel2 NOTIFY globalChannel2Changed)
    Q_PROPERTY(int globalChannel3 READ globalChannel3 WRITE setGlobalChannel3 NOTIFY globalChannel3Changed)

public:
    QVariantList channelList() const;
    QVariantList ratioList() const;
    int globalChannel1() const;
    int globalChannel2() const;
    int globalChannel3() const;

    void setChannelList(const QVariantList& v);
    void setRatioList(const QVariantList& v);
    void setGlobalChannel1(int v);
    void setGlobalChannel2(int v);
    void setGlobalChannel3(int v);

signals:
    void channelListChanged();
    void ratioListChanged();
    void globalChannel1Changed();
    void globalChannel2Changed();
    void globalChannel3Changed();

public:
    static ChemicalAddPage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit ChemicalAddPage();
    QSettings* m_settings;

    QVariantList m_channels;
    QVariantList m_ratios;
    int m_ch1, m_ch2, m_ch3;
};

#endif
