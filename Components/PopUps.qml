import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "."
import com.mainpage.config 1.0

Item {
    id: popUpsRoot
    anchors.fill: parent
    z: 999
    visible: true

    property alias loginVisible: globalLoginDialog.visible
    property alias warningVisible: warningDialog.visible
    property alias saveSuccessVisible: saveSuccessDialog.visible

    signal loginSuccess()
    signal warningClosed()
    signal saveSuccessClosed()

    // ==========================================================================
    // 登录弹窗
    // ==========================================================================
    Item {
        id: globalLoginDialog
        anchors.fill: parent
        visible: false
        onVisibleChanged: pwdInput.text = ""

        // 很浅的半透明黑（无动画）
        Rectangle {
            anchors.fill: parent
            color: "#55000000"
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            preventStealing: true
        }

        Rectangle {
            width: 420
            height: 260
            anchors.centerIn: parent
            color: "#ffffff"
            radius: 12
            border.color: "#0077FF"
            border.width: 2

            scale: visible ? 1 : 0.8
            Behavior on scale {
                NumberAnimation { duration: 220; easing.type: Easing.OutQuad }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "用户登录"
                    font.pixelSize: 28
                    color: "#0077FF"
                }

                RowLayout {
                    Layout.topMargin: 30
                    Layout.alignment: Qt.AlignHCenter
                    Text { text: "密 码:"; font.pixelSize: 26 }
                    TextField {
                        id: pwdInput
                        width: 240
                        height: 50
                        font.pixelSize: 26
                        echoMode: TextInput.Password
                        MouseArea {
                            anchors.fill: parent
                            onPressed: mainWindow.beep()
                            onClicked: mainWindow.showNumKeyboard(pwdInput)
                        }
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 60
                    CustomButton {
                        buttonText: "取消"
                        buttonWidth: 120
                        buttonHeight: 50
                        fontSize: 26
                        onClicked: globalLoginDialog.visible = false
                    }
                    CustomButton {
                        buttonText: "登录"
                        buttonWidth: 120
                        buttonHeight: 50
                        fontSize: 26
                        onClicked: {
                            if (MainPageConfig.checkOperatorPwd(pwdInput.text)) {
                                MainPageConfig.userLevel = 1
                                MainPageConfig.userName = "操作员"
                            } else if (MainPageConfig.checkAdminPwd(pwdInput.text)) {
                                MainPageConfig.userLevel = 2
                                MainPageConfig.userName = "管理员"
                            } else {
                                MainPageConfig.userLevel = 0
                                MainPageConfig.userName = "访客"
                            }
                            globalLoginDialog.visible = false
                            loginSuccess()
                        }
                    }
                }
            }
        }
    }

    // ==========================================================================
    // 权限不足
    // ==========================================================================
    Item {
        id: warningDialog
        anchors.fill: parent
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#22000000"
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            preventStealing: true
        }

        Rectangle {
            width: 420
            height: 260
            anchors.centerIn: parent
            color: "white"
            radius: 12
            border.color: "#0077FF"
            border.width: 2

            scale: visible ? 1 : 0.8
            Behavior on scale {
                NumberAnimation { duration: 220; easing.type: Easing.OutQuad }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "⚠ 权限不足"
                    font.pixelSize: 28
                    color: "#ff2222"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "无权限访问此功能，请重新登录"
                    font.pixelSize: 22
                    color: "#555555"
                }
                Item { Layout.fillHeight: true }
                CustomButton {
                    Layout.alignment: Qt.AlignHCenter
                    buttonText: "确定"
                    buttonWidth: 110
                    buttonHeight: 45
                    fontSize: 22
                    onClicked: {
                        warningDialog.visible = false
                        warningClosed()
                    }
                }
            }
        }
    }

    // ==========================================================================
    // 保存成功
    // ==========================================================================
    Item {
        id: saveSuccessDialog
        anchors.fill: parent
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#22000000"
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            preventStealing: true
        }

        Rectangle {
            width: 400
            height: 240
            anchors.centerIn: parent
            color: "white"
            radius: 12
            border.color: "#009955"
            border.width: 2

            scale: visible ? 1 : 0.8
            Behavior on scale {
                NumberAnimation { duration: 220; easing.type: Easing.OutQuad }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "\u2713 保存成功"
                    font.pixelSize: 28
                    color: "#009955"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "参数已成功保存"
                    font.pixelSize: 22
                    color: "#555555"
                }
                Item { Layout.fillHeight: true }
                CustomButton {
                    Layout.alignment: Qt.AlignHCenter
                    buttonText: "确定"
                    buttonWidth: 110
                    buttonHeight: 45
                    fontSize: 22
                    onClicked: {
                        saveSuccessDialog.visible = false
                        saveSuccessClosed()
                    }
                }
            }
        }
    }
}
