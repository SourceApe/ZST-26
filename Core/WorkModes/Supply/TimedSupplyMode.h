#ifndef TIMEDSUPPLYMODE_H
#define TIMEDSUPPLYMODE_H

#include <QObject>
#include "SupplyBase.h"

class TimedSupplyMode : public SupplyBase
{
    Q_OBJECT

public:
    explicit TimedSupplyMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // TIMEDSUPPLYMODE_H
