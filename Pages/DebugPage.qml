import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"

Page {
    id: debugPage
    width: parent.width
    height: parent.height

    Rectangle {
        id: leftNavBar
        width: 150
        height: parent.height
        color: "#005cc9" // 深蓝色导航栏

        Column {
            anchors.fill: parent
            anchors.margins: 0
            spacing: 0

            CustomNavButton {
                text: "校准"
                isSelected: stackLayout.currentIndex === 0
                onClicked: stackLayout.currentIndex = 0
            }

            CustomNavButton {
                text: "泵阀控制"
                isSelected: stackLayout.currentIndex === 1
                onClicked: stackLayout.currentIndex = 1
            }

            CustomNavButton {
                text: "流程控制"
                isSelected: stackLayout.currentIndex === 2
                onClicked: stackLayout.currentIndex = 2
            }

            CustomNavButton {
                text: "状态"
                isSelected: stackLayout.currentIndex === 3
                onClicked: stackLayout.currentIndex = 3
            }
        }
    }

    // ---------------------- 右侧内容区（StackLayout） ----------------------
    StackLayout {
        id: stackLayout
        anchors.left: leftNavBar.right
        width: parent.width - leftNavBar.width
        height: parent.height
        currentIndex: 0

        Loader {
            source: "qrc:/Pages/SubPages/Debug/CalibrationPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/Debug/PumpValveCtrlPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/Debug/ProcessCtrlPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/Debug/StatePage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
