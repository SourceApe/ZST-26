QT += quick serialport serialbus

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    Core/Application.cpp \
    Core/WorkModeManager.cpp \
    Core/WorkModes/Sample/FixedSampleMode.cpp \
    Core/WorkModes/Sample/SampleBase.cpp \
    Devices/BuzzerCtrl.cpp \
    Devices/Modbus/ModbusRtuMaster.cpp \
    Devices/SerialPort.cpp \
    MainPage.cpp \
    Pages/SubPages/Debug/CalibrationPage.cpp \
    Pages/SubPages/ParamSet/ChemicalAddPage.cpp \
    Pages/SubPages/ParamSet/CommunicationPage.cpp \
    Pages/SubPages/ParamSet/FridgePage.cpp \
    Pages/SubPages/ParamSet/MaintainPage.cpp \
    Pages/SubPages/ParamSet/PumpValvePage.cpp \
    Pages/SubPages/WorkMode/AnalogChannelPage.cpp \
    Pages/SubPages/WorkMode/HourSampleSupplyPage.cpp \
    Pages/SubPages/WorkMode/ModePage.cpp \
    main.cpp \

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Core/Application.h \
    Core/WorkModeManager.h \
    Core/WorkModes/Sample/FixedSampleMode.h \
    Core/WorkModes/Sample/SampleBase.h \
    Devices/BuzzerCtrl.h \
    Devices/Modbus/ModbusRtuMaster.h \
    Devices/SerialPort.h \
    MainPage.h \
    Pages/SubPages/Debug/CalibrationPage.h \
    Pages/SubPages/ParamSet/ChemicalAddPage.h \
    Pages/SubPages/ParamSet/CommunicationPage.h \
    Pages/SubPages/ParamSet/FridgePage.h \
    Pages/SubPages/ParamSet/MaintainPage.h \
    Pages/SubPages/ParamSet/PumpValvePage.h \
    Pages/SubPages/WorkMode/AnalogChannelPage.h \
    Pages/SubPages/WorkMode/HourSampleSupplyPage.h \
    Pages/SubPages/WorkMode/ModePage.h \
