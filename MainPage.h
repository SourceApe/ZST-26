#ifndef MAINPAGE_H
#define MAINPAGE_H

#include <QObject>
#include <QString>
#include <QTimer>
#include <QDateTime>

class MainPage : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int userLevel READ userLevel WRITE setUserLevel NOTIFY userLevelChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString currentTime READ currentTime NOTIFY currentTimeChanged)

public:
    int userLevel() const;
    void setUserLevel(int level);
    QString userName() const;
    void setUserName(QString name);
    QString currentTime() const;
    void updateCurrentTime();

    static MainPage* instance();
    Q_INVOKABLE bool checkOperatorPwd(const QString &pwd);
    Q_INVOKABLE bool checkAdminPwd(const QString &pwd);

signals:
    void userLevelChanged();
    void userNameChanged();
    void currentTimeChanged();

private:
    // ✅ 无参构造，禁止传 parent
    explicit MainPage();
    ~MainPage();

    int m_userLevel;
    QString m_userName;
    QString m_currentTime;
    QTimer m_timeTimer;
};

#endif // MAINPAGE_H
