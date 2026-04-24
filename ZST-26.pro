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
    Core/WorkFlowManager.cpp \
    Core/WorkModes/Retain/OverLimitRetainMode.cpp \
    Core/WorkModes/Retain/RetainBase.cpp \
    Core/WorkModes/Retain/RetainManager.cpp \
    Core/WorkModes/Retain/SyncRetainMode.cpp \
    Core/WorkModes/Sample/ExtTriggerSampleMode.cpp \
    Core/WorkModes/Sample/FixedSampleMode.cpp \
    Core/WorkModes/Sample/FlowRatioMode.cpp \
    Core/WorkModes/Sample/FlowTrackMode.cpp \
    Core/WorkModes/Sample/SampleBase.cpp \
    Core/WorkModes/Sample/SampleManager.cpp \
    Core/WorkModes/Sample/TimeRatioMode.cpp \
    Core/WorkModes/Supply/ExtTriggerSupplyMode.cpp \
    Core/WorkModes/Supply/ImmediateSupplyMode.cpp \
    Core/WorkModes/Supply/SupplyBase.cpp \
    Core/WorkModes/Supply/SupplyManager.cpp \
    Core/WorkModes/Supply/TimedSupplyMode.cpp \
    Devices/BuzzerCtrl.cpp \
    Devices/Modbus/ModbusRtuMaster.cpp \
    Devices/ModbusDevices/DeviceDataHub.cpp \
    Devices/ModbusDevices/DriveBoard/DriveBoardCtrl.cpp \
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
    Core/WorkFlowManager.h \
    Core/WorkModes/Retain/OverLimitRetainMode.h \
    Core/WorkModes/Retain/RetainBase.h \
    Core/WorkModes/Retain/RetainManager.h \
    Core/WorkModes/Retain/SyncRetainMode.h \
    Core/WorkModes/Sample/ExtTriggerSampleMode.h \
    Core/WorkModes/Sample/FixedSampleMode.h \
    Core/WorkModes/Sample/FlowRatioMode.h \
    Core/WorkModes/Sample/FlowTrackMode.h \
    Core/WorkModes/Sample/SampleBase.h \
    Core/WorkModes/Sample/SampleManager.h \
    Core/WorkModes/Sample/TimeRatioMode.h \
    Core/WorkModes/Supply/ExtTriggerSupplyMode.h \
    Core/WorkModes/Supply/ImmediateSupplyMode.h \
    Core/WorkModes/Supply/SupplyBase.h \
    Core/WorkModes/Supply/SupplyManager.h \
    Core/WorkModes/Supply/TimedSupplyMode.h \
    Devices/BuzzerCtrl.h \
    Devices/Modbus/ModbusRtuMaster.h \
    Devices/ModbusDevices/DeviceDataHub.h \
    Devices/ModbusDevices/DriveBoard/DriveBoardCtrl.h \
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
