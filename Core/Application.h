#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include "WorkModeManager.h"

class Application : public QObject
{
    Q_OBJECT
public:
    static Application* instance();

    Q_INVOKABLE bool init();
    Q_INVOKABLE void shutdown();

    Q_INVOKABLE WorkModeManager* workModeManager() const;

private:
    explicit Application(QObject *parent = nullptr);
    ~Application();

    WorkModeManager* m_workModeManager;
};

#endif // Application_H
