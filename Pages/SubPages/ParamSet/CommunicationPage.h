#ifndef COMMUNICATIONPAGE_H
#define COMMUNICATIONPAGE_H

#include <QObject>
#include <QSettings>
#include <QString>

class CommunicationPage : public QObject
{
    Q_OBJECT

    // RS485
    Q_PROPERTY(QString rs485Addr READ rs485Addr WRITE setRs485Addr NOTIFY rs485AddrChanged)
    Q_PROPERTY(int rs485BaudIndex READ rs485BaudIndex WRITE setRs485BaudIndex NOTIFY rs485BaudIndexChanged)
    Q_PROPERTY(int rs485ProtoIndex READ rs485ProtoIndex WRITE setRs485ProtoIndex NOTIFY rs485ProtoIndexChanged)

    // RS232
    Q_PROPERTY(int rs232BaudIndex READ rs232BaudIndex WRITE setRs232BaudIndex NOTIFY rs232BaudIndexChanged)
    Q_PROPERTY(int rs232ProtoIndex READ rs232ProtoIndex WRITE setRs232ProtoIndex NOTIFY rs232ProtoIndexChanged)

public:
    QString rs485Addr() const;
    void setRs485Addr(const QString& value);

    int rs485BaudIndex() const;
    void setRs485BaudIndex(int value);

    int rs485ProtoIndex() const;
    void setRs485ProtoIndex(int value);

    int rs232BaudIndex() const;
    void setRs232BaudIndex(int value);

    int rs232ProtoIndex() const;
    void setRs232ProtoIndex(int value);

signals:
    void rs485AddrChanged();
    void rs485BaudIndexChanged();
    void rs485ProtoIndexChanged();

    void rs232BaudIndexChanged();
    void rs232ProtoIndexChanged();

public:
    static CommunicationPage* instance();
    Q_INVOKABLE void loadAllConfig();
    Q_INVOKABLE void saveAllConfig();

private:
    explicit CommunicationPage();
    ~CommunicationPage();

    QSettings* m_settings;

    QString m_rs485Addr;
    int m_rs485BaudIndex;
    int m_rs485ProtoIndex;

    int m_rs232BaudIndex;
    int m_rs232ProtoIndex;
};

#endif // COMMUNICATIONPAGE_H
