#ifndef IMMEDIATESUPPLYMODE_H
#define IMMEDIATESUPPLYMODE_H

#include <QObject>
#include "SupplyBase.h"

class ImmediateSupplyMode : public SupplyBase
{
    Q_OBJECT

public:
    explicit ImmediateSupplyMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // IMMEDIATESUPPLYMODE_H
