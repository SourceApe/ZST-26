#ifndef MODEBASE_H
#define MODEBASE_H

#include <QObject>
#include <QVariantMap>

class ModeBase : public QObject
{
    Q_OBJECT
public:
    explicit ModeBase(QObject *parent = nullptr);
    virtual ~ModeBase() = default;

    virtual bool start() = 0;
    virtual void stop() = 0;
    virtual bool isRunning() const = 0;

signals:
    void started();
    void stopped();
    void runError(const QString &err);
    void statusUpdate(const QString &status);
};

#endif // MODEBASE_H
