#ifndef FLOWTRACKMODE_H
#define FLOWTRACKMODE_H

#include <QObject>
#include "SampleBase.h"

class FlowTrackMode : public SampleBase
{
    Q_OBJECT

public:
    explicit FlowTrackMode(QObject *parent = nullptr);

    void start() override;
    void stop() override;
};

#endif // FLOWTRACKMODE_H
