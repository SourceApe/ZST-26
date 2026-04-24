#ifndef FLOWRATIOMODE_H
#define FLOWRATIOMODE_H

#include <QObject>
#include "SampleBase.h"

class FlowRatioMode : public SampleBase
{
    Q_OBJECT

public:
    explicit FlowRatioMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // FLOWRATIOMODE_H
