import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: numKeyboard
    width: parent.width
    height: 300
    color: "#1A1A1A"
    visible: false
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter

    property var targetInput: null

    // 悬浮大输入框
    Rectangle {
        id: floatBg
        width: parent.width
        height: 80
        anchors.bottom: numKeyboard.top
        visible: numKeyboard.visible
        color: "white"

        TextField {
            id: floatInput
            anchors.fill: parent
            font.pixelSize: 40
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            background: Rectangle {
                color: "white"
                border.color: "black"
                border.width: 2
            }
            onTextChanged: {
                targetInput.text = floatInput.text
            }
        }
    }

    onVisibleChanged: {
        if (visible && targetInput) {
            floatInput.text = targetInput.text
            Qt.callLater(function(){
                floatInput.forceActiveFocus()
            })
        }
    }

    GridLayout {
        rows: 4
        columns: 3
        rowSpacing: 2
        columnSpacing: 2
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            model: [
                "1", "2", "3",
                "4", "5", "6",
                "7", "8", "9",
                ".", "0", "删除"
            ]

            Rectangle {
                Layout.preferredWidth: 120
                Layout.preferredHeight: 60
                color: mouseArea.pressed ? "#666666" : "#333333" // 👈 按下变色

                Text {
                    anchors.centerIn: parent
                    text: modelData
                    color: "white"
                    font.pixelSize: 28
                    font.bold: true
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onPressed: mainWindow.beep()
                    onClicked: {
                        if (!targetInput) return
                        floatInput.forceActiveFocus()

                        if (modelData === "删除") {
                            floatInput.text = floatInput.text.slice(0, -1)
                        } else if (modelData === ".") {
                            if (!floatInput.text.includes(".")) {
                                floatInput.text += "."
                            }
                        } else {
                            floatInput.text += modelData
                        }
                    }
                }
            }
        }

        // 清空键
        Rectangle {
            Layout.preferredWidth: 242
            Layout.preferredHeight: 60
            Layout.columnSpan: 2
            color: mouseClear.pressed ? "#FFB74D" : "#FF9500" // 按下变亮

            Text {
                anchors.centerIn: parent
                text: "清空"
                color: "white"
                font.pixelSize: 28
                font.bold: true
            }

            MouseArea {
                id: mouseClear
                anchors.fill: parent
                onPressed: mainWindow.beep()
                onClicked: {
                    floatInput.text = ""
                    floatInput.forceActiveFocus()
                }
            }
        }

        // 确认键
        Rectangle {
            Layout.preferredWidth: 120
            Layout.preferredHeight: 60
            color: mouseOk.pressed ? "#81C784" : "#4CD964" // 按下变亮

            Text {
                anchors.centerIn: parent
                text: "确认"
                color: "white"
                font.pixelSize: 28
                font.bold: true
            }

            MouseArea {
                id: mouseOk
                anchors.fill: parent
                onPressed: mainWindow.beep()
                onClicked: {
                    if (targetInput) {
                        targetInput.text = floatInput.text
                    }
                    numKeyboard.visible = false
                }
            }
        }
    }
}
