#include "MainPage.h"
#include <QProcess>

// ✅ 构造函数：无参数，无 parent
MainPage::MainPage()
    : QObject(nullptr)  // 强制父类为空
{
    connect(&m_timeTimer, &QTimer::timeout, this, &MainPage::updateCurrentTime);
    m_timeTimer.start(1000);
    updateCurrentTime();

    m_userLevel = 2;
}

// ✅ 析构函数：空，不做任何保存
MainPage::~MainPage()
{
}

int MainPage::userLevel() const {
    return m_userLevel;
}

void MainPage::setUserLevel(int level) {
    if (m_userLevel != level) {
        m_userLevel = level;
        emit userLevelChanged();
    }
}

QString MainPage::userName() const {
    return m_userName;
}

void MainPage::setUserName(QString name) {
    if (m_userName != name) {
        m_userName = name;
        emit userNameChanged();
    }
}

QString MainPage::currentTime() const {
    return m_currentTime;
}

void MainPage::updateCurrentTime() {
    m_currentTime = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");
    emit currentTimeChanged();
}

void MainPage::setSystemDateTime(int year, int month, int day, int hour, int minute, int second)
{
    QDateTime dt(QDate(year, month, day), QTime(hour, minute, second));

    // Linux 设置时间命令
    QProcess::execute("date", {"-s", dt.toString("yyyy-MM-dd HH:mm:ss")});
    QProcess::execute("hwclock", {"-u", "-w"});
}

MainPage* MainPage::instance()
{
    static MainPage s_instance;
    return &s_instance;
}

bool MainPage::checkOperatorPwd(const QString &pwd)
{
    return pwd == "123456";
}

bool MainPage::checkAdminPwd(const QString &pwd)
{
    return pwd == "888888";
}
