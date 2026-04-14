import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"

Page {
    id: paramSetPage
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
                text: "泵阀参数"
                isSelected: stackLayout.currentIndex === 0
                onClicked: stackLayout.currentIndex = 0
            }

            CustomNavButton {
                text: "加药参数"
                isSelected: stackLayout.currentIndex === 1
                onClicked: stackLayout.currentIndex = 1
            }

            CustomNavButton {
                text: "冰箱参数"
                isSelected: stackLayout.currentIndex === 2
                onClicked: stackLayout.currentIndex = 2
            }

            CustomNavButton {
                text: "通讯设置"
                isSelected: stackLayout.currentIndex === 3
                onClicked: stackLayout.currentIndex = 3
            }

            CustomNavButton {
                text: "维护参数"
                isSelected: stackLayout.currentIndex === 4
                onClicked: stackLayout.currentIndex = 4
            }

            CustomNavButton {
                text: "预处理参数"
                isSelected: stackLayout.currentIndex === 5
                onClicked: stackLayout.currentIndex = 5
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
            source: "qrc:/Pages/SubPages/ParamSet/PumpValvePage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/ParamSet/ChemicalAddPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/ParamSet/FridgePage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/ParamSet/CommunicationPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/ParamSet/MaintainPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader {
            source: "qrc:/Pages/SubPages/ParamSet/PreprocessorPage.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
