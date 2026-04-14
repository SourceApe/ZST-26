import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"

Page {
    id: workModePage
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

            // 导航按钮：模式
            CustomNavButton {
                text: "模式"
                isSelected: stackLayout.currentIndex === 0
                onClicked: stackLayout.currentIndex = 0
            }

            // 导航按钮：整点供样
            CustomNavButton {
                text: "整点供样"
                isSelected: stackLayout.currentIndex === 1
                onClicked: stackLayout.currentIndex = 1
            }

            // 导航按钮：4-20mA通道
            CustomNavButton {
                text: "4-20mA通道"
                isSelected: stackLayout.currentIndex === 2
                onClicked: stackLayout.currentIndex = 2
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
            source: "qrc:/Pages/SubPages/WorkMode/ModePage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/WorkMode/HourSampleSupplyPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/WorkMode/AnalogChannelPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
