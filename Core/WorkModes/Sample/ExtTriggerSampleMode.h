#ifndef EXTTRIGGERSAMPLEMODE_H
#define EXTTRIGGERSAMPLEMODE_H

#include <QObject>
#include "SampleBase.h"

class ExtTriggerSampleMode : public SampleBase
{
    Q_OBJECT

public:
    explicit ExtTriggerSampleMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // EXTTRIGGERSAMPLEMODE_H
