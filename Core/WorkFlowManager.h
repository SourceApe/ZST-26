#ifndef WORKFLOWMANAGER_H
#define WORKFLOWMANAGER_H

#include <QObject>

class WorkFlowManager : public QObject
{
    Q_OBJECT
public:
    static WorkFlowManager& instance();
    Q_INVOKABLE void startFlow();
    Q_INVOKABLE void stopFlow();

signals:
    void flowFinished();
    void flowStopped();

private slots:
    void onSampleDone();
    void onSupplyDone();
    void onRetainDone();

private:
    explicit WorkFlowManager(QObject *parent = nullptr);
    bool isFixedSample();

    enum State { Idle, Sampling, Supplying, Retaining };
    State m_state = Idle;
};

#endif // WORKFLOWMANAGER_H
