#include "SampleBase.h"

SampleBase::SampleBase(QObject *parent)
    : QObject{parent}
    , m_config(ModePage::instance())
    , m_currentCount(0)
{
}
