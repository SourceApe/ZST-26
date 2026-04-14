import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"

Page {
    id: historyPage
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
                text: "瓶样信息查询"
                isSelected: stackLayout.currentIndex === 0
                onClicked: stackLayout.currentIndex = 0
            }

            CustomNavButton {
                text: "采样信息查询"
                isSelected: stackLayout.currentIndex === 1
                onClicked: stackLayout.currentIndex = 1
            }

            CustomNavButton {
                text: "留样信息查询"
                isSelected: stackLayout.currentIndex === 2
                onClicked: stackLayout.currentIndex = 2
            }

            CustomNavButton {
                text: "日志查询"
                isSelected: stackLayout.currentIndex === 3
                onClicked: stackLayout.currentIndex = 3
            }

            CustomNavButton {
                text: "故障查询"
                isSelected: stackLayout.currentIndex === 4
                onClicked: stackLayout.currentIndex = 4
            }

            CustomNavButton {
                text: "参数修改查询"
                isSelected: stackLayout.currentIndex === 5
                onClicked: stackLayout.currentIndex = 5
            }

            CustomNavButton {
                text: "开关门查询"
                isSelected: stackLayout.currentIndex === 6
                onClicked: stackLayout.currentIndex = 6
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
            source: "qrc:/Pages/SubPages/History/BottleSamplePage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/History/SamplingPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/History/RetainedSamplePage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/History/LogPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/History/FaultPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/History/ParamChangePage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/History/DoorPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
