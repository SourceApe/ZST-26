import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import "Components"
import com.buzzerdevice.config 1.0
import com.mainpage.config 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1024
    height: 600
    color: "#f0f0f0"

    property var globalWindow: this
    property int currentTab: 0

    function beep() {
        BuzzerConfig.beepOnce(70);
    }

    Item {
        z: 9999
        anchors.bottom: parent.bottom
        width: parent.width
        height: 300

        NumKeyboard {
            id: globalKeyboard
            anchors.fill: parent
        }
    }

    function showNumKeyboard(input) {
        globalKeyboard.targetInput = input;
        globalKeyboard.visible = true;
    }

    // ========== 顶部Tab栏 ==========
    TabBar {
        id: topTabBar
        width: parent.width
        height: 80
        currentIndex: currentTab
        background: Rectangle { color: "#0077FF" }

        CustomTabButton {
            text: "主页"
            tabIndex: 0
            onClicked: currentTab = 0
        }

        CustomTabButton {
            text: "工作模式"
            tabIndex: 1
            onClicked: {
                if (MainPageConfig.userLevel < 1) {
                    globalPopUps.warningVisible = true
                } else {
                    currentTab = 1
                }
            }
        }

        CustomTabButton {
            text: "参数设置"
            tabIndex: 2
            onClicked: {
                if (MainPageConfig.userLevel < 1) {
                    globalPopUps.warningVisible = true
                } else {
                    currentTab = 2
                }
            }
        }

        CustomTabButton {
            text: "历史记录"
            tabIndex: 3
            onClicked: currentTab = 3
        }

        CustomTabButton {
            text: "关于"
            tabIndex: 4
            onClicked: currentTab = 4
        }// 留空 → 由 mainWindow 处理

        CustomTabButton {
            text: "系统调试"
            tabIndex: 5
            onClicked: {
                if (MainPageConfig.userLevel < 2) {
                    globalPopUps.warningVisible = true
                } else {
                    currentTab = 5
                }
            }
        }
    }

    // ========== 主内容区 ==========
    StackLayout {
        id: mainContent
        anchors.top: topTabBar.bottom
        anchors.bottom: statusBar.top
        width: parent.width
        currentIndex: currentTab

        Loader { source: "qrc:/Pages/HomePage.qml"; Layout.fillWidth: true; Layout.fillHeight: true }
        Loader { source: "qrc:/Pages/WorkModePage.qml"; Layout.fillWidth: true; Layout.fillHeight: true }
        Loader { source: "qrc:/Pages/ParamSetPage.qml"; Layout.fillWidth: true; Layout.fillHeight: true }
        Loader { source: "qrc:/Pages/HistoryPage.qml"; Layout.fillWidth: true; Layout.fillHeight: true }
        Loader { source: "qrc:/Pages/AboutPage.qml"; Layout.fillWidth: true; Layout.fillHeight: true }
        Loader { source: "qrc:/Pages/DebugPage.qml"; Layout.fillWidth: true; Layout.fillHeight: true }
    }

    // ========== 底部状态栏 ==========
    Rectangle {
        id: statusBar
        anchors.bottom: parent.bottom
        width: parent.width
        height: 40
        color: "#B3D6FF"

        RowLayout {
            anchors.fill: parent
            spacing: 20

            Text { text: "设备状态: "; Layout.leftMargin: 20; font.pixelSize: 20 }
            Item { Layout.fillWidth: true }
            Text { text: "冰箱温度: "; font.pixelSize: 20 }
            Item { Layout.fillWidth: true }
            Text {
                id: timeLabel
                text: MainPageConfig.currentTime;
                Layout.rightMargin: 20;
                font.pixelSize: 20
                MouseArea {
                    anchors.fill: parent
                    onPressed: mainWindow.beep()
                    onClicked: {
                        globalPopUps.timeSetVisible = true
                    }
                }
            }


        }
    }

    // 全局弹窗
    PopUps {
        id: globalPopUps
        // 监听警告弹窗关闭，在 main.qml 里恢复 Tab（作用域正确，永不报错）
        onWarningClosed: {
            topTabBar.currentIndex = currentTab
        }
        // 登录成功信号（可选，用来做登录后的额外操作）
        onLoginSuccess: {
            // 比如登录后刷新页面，这里不用改也能正常用
        }
    }
}
