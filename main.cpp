#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Core/Application.h"

#include "Devices/BuzzerCtrl.h"

#include "MainPage.h"
#include "Pages/SubPages/WorkMode/ModePage.h"
#include "Pages/SubPages/WorkMode/HourSampleSupplyPage.h"
#include "Pages/SubPages/WorkMode/AnalogChannelPage.h"
#include "Pages/SubPages/ParamSet/PumpValvePage.h"
#include "Pages/SubPages/ParamSet/ChemicalAddPage.h"
#include "Pages/SubPages/ParamSet/FridgePage.h"
#include "Pages/SubPages/ParamSet/CommunicationPage.h"
#include "Pages/SubPages/ParamSet/MaintainPage.h"
#include "Pages/SubPages/Debug/CalibrationPage.h"



template <typename T>
static QObject* registerSingleton(QQmlEngine *engine, QJSEngine *)
{
    T *inst = T::instance();
    engine->setObjectOwnership(inst, QQmlEngine::CppOwnership);
    return inst;
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterSingletonType<BuzzerCtrl>("com.buzzerdevice.config",1,0,"BuzzerConfig", registerSingleton<BuzzerCtrl>);
    qmlRegisterSingletonType<MainPage>("com.mainpage.config",1,0,"MainPageConfig", registerSingleton<MainPage>);
    qmlRegisterSingletonType<ModePage>("com.modepage.config",1,0,"ModePageConfig", registerSingleton<ModePage>);
    qmlRegisterSingletonType<HourSampleSupplyPage>("com.hoursamplesupplypage.config",1,0,"HourSampleSupplyPageConfig", registerSingleton<HourSampleSupplyPage>);
    qmlRegisterSingletonType<AnalogChannelPage>("com.analogchannelpage.config",1,0,"AnalogChannelPageConfig", registerSingleton<AnalogChannelPage>);
    qmlRegisterSingletonType<PumpValvePage>("com.pumpvalvepage.config",1,0,"PumpValvePageConfig", registerSingleton<PumpValvePage>);
    qmlRegisterSingletonType<ChemicalAddPage>("com.chemicaladdpage.config",1,0,"ChemicalAddPageConfig", registerSingleton<ChemicalAddPage>);
    qmlRegisterSingletonType<FridgePage>("com.fridgepage.config",1,0,"FridgePageConfig", registerSingleton<FridgePage>);
    qmlRegisterSingletonType<CommunicationPage>("com.communicationpage.config",1,0,"CommunicationPageConfig", registerSingleton<CommunicationPage>);
    qmlRegisterSingletonType<MaintainPage>("com.maintainpage.config",1,0,"MaintainPageConfig", registerSingleton<MaintainPage>);
    qmlRegisterSingletonType<CalibrationPage>("com.calibrationpage.config",1,0,"CalibrationPageConfig", registerSingleton<CalibrationPage>);

    Application::instance()->init();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
