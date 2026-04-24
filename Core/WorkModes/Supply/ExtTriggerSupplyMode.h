#ifndef EXTTRIGGERSUPPLYMODE_H
#define EXTTRIGGERSUPPLYMODE_H

#include <QObject>
#include "SupplyBase.h"

class ExtTriggerSupplyMode : public SupplyBase
{
    Q_OBJECT

public:
    explicit ExtTriggerSupplyMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // EXTTRIGGERSUPPLYMODE_H
