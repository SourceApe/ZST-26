#ifndef OVERLIMITRETAINMODE_H
#define OVERLIMITRETAINMODE_H

#include <QObject>
#include "RetainBase.h"

class OverLimitRetainMode : public RetainBase
{
    Q_OBJECT

public:
    explicit OverLimitRetainMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // OVERLIMITRETAINMODE_H
