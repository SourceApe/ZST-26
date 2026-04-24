#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include <QTimer>

class Application : public QObject
{
    Q_OBJECT
public:
    static Application* instance();

    // 设备全局初始化（开机跑一次）
    Q_INVOKABLE void init();

    // 给 QML 调用：启动 / 停止
    Q_INVOKABLE void startRun();
    Q_INVOKABLE void stopRun();
    Q_INVOKABLE void startSchedule();// 定时启动（开启检查）
    Q_INVOKABLE void stopSchedule(); // 取消定时

    // 获取当前是否运行
    Q_INVOKABLE bool isRunning() const;

private slots:
    void checkTime();

    void onFlowFinished();

private:
    explicit Application(QObject *parent = nullptr);

    QTimer m_scheduleTimer;
    // 全局状态
    bool m_isRunning;
};

#endif
