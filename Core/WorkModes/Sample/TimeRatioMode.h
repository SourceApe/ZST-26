#ifndef TIMERATIOMODE_H
#define TIMERATIOMODE_H

#include <QObject>
#include "SampleBase.h"

class TimeRatioMode : public SampleBase
{
    Q_OBJECT

public:
    explicit TimeRatioMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // TIMERATIOMODE_H
