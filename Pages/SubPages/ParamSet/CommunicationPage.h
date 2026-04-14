#ifndef COMMUNICATIONPAGE_H
#define COMMUNICATIONPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>
#include <QVector>
#include <QVariantList>

class CommunicationPage : public QObject
{
    Q_OBJECT

    // 先定义结构体！！！
    struct ComItem {
        QString baud;
        int modeIndex;
        int masterSlaveIndex;
        QString address;
    };

    // 提供给 QML 使用：6 个串口配置数组
    Q_PROPERTY(QVariantList comConfig READ comConfig WRITE setComConfig NOTIFY comConfigChanged)

public:
    static CommunicationPage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

    QVariantList comConfig() const;
    void setComConfig(const QVariantList& config);

signals:
    void comConfigChanged();

private:
    explicit CommunicationPage();
    ~CommunicationPage();

    QSettings* m_settings;
    QVector<ComItem> m_comList; // 现在顺序正确，不报错
};

#endif
