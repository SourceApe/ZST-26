import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"

Page {
    id: root
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }
    title: "流程控制"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        RowLayout {
            Layout.fillWidth: true
            spacing: 20

            // ========== 左侧：手动调试栏 ==========
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 360
                radius: 12
                border.color: "#0077FF"
                border.width: 2
                color: "#FAFAFA"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    // 标题栏
                    Rectangle {
                        Layout.fillWidth: true
                        height: 60
                        color: "#BBDEFB"
                        radius: 8

                        Label {
                            anchors.centerIn: parent
                            text: "手动调试"
                            font.pixelSize: 26
                            color: "#0077FF"
                            font.bold: true
                        }
                    }

                    // 按钮区域（3行2列）
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 30
                        // 第1行
                        RowLayout {
                            CustomButton {
                                buttonText: "采样调试"
                                buttonWidth: 140
                                buttonHeight: 50
                                fontSize: 20
                            }
                            Item { Layout.fillWidth: true }
                            CustomButton {
                                buttonText: "全流程调试"
                                buttonWidth: 140
                                buttonHeight: 50
                                fontSize: 20
                            }
                        }
                        // 第2行
                        RowLayout {
                            CustomButton {
                                buttonText: "供样调试"
                                buttonWidth: 140
                                buttonHeight: 50
                                fontSize: 20
                            }
                            Item { Layout.fillWidth: true }
                            CustomButton {
                                buttonText: "立即停止"
                                buttonWidth: 140
                                buttonHeight: 50
                                fontSize: 20
                            }
                        }
                        // 第3行
                        RowLayout {
                            CustomButton {
                                buttonText: "留样调试"
                                buttonWidth: 140
                                buttonHeight: 50
                                fontSize: 20
                            }
                        }
                    }
                }
            }

            // ========== 右侧：调试参数栏 ==========
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 360
                radius: 12
                border.color: "#0077FF"
                border.width: 2
                color: "#FAFAFA"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 20

                    // 标题栏（浅蓝色背景）
                    Rectangle {
                        Layout.fillWidth: true
                        height: 60
                        color: "#BBDEFB"
                        radius: 8

                        Label {
                            anchors.centerIn: parent
                            text: "调试参数"
                            font.pixelSize: 26
                            color: "#0077FF"
                            font.bold: true
                        }
                    }

                    // 参数列表
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 10
                        anchors.margins: 20
                        LabelComboBox {
                            id: samplingModeBox
                            labelText: qsTr("混匀桶:")
                            comboModel: ["A桶", "B桶"]
                            labelWidth: 150
                        }
                        LabelInputField {
                            labelText: "水泵提前打水："
                            unitText: "min"
                            labelWidth: 150
                            inputWidth: 150
                            fontSize: 20
                        }
                        LabelInputField {
                            labelText: "采样量："
                            unitText: "mL"
                            labelWidth: 150
                            inputWidth: 150
                            fontSize: 20
                        }
                        LabelInputField {
                            labelText: "供样时间："
                            unitText: "min"
                            labelWidth: 150
                            inputWidth: 150
                            fontSize: 20
                        }
                        LabelInputField {
                            labelText: "超标等待："
                            unitText: "min"
                            labelWidth: 150
                            inputWidth: 150
                            fontSize: 20
                        }
                        LabelInputField {
                            labelText: "留样量："
                            unitText: "mL"
                            labelWidth: 150
                            inputWidth: 150
                            fontSize: 20
                        }
                    }
                }
            }
        }

        // ====================== 底部瓶号+操作栏 ======================
        RowLayout {
            Layout.fillWidth: true
            spacing: 35
            Layout.alignment: Qt.AlignHCenter
            RowLayout {
                Label {
                    text: "开始瓶号："
                    font.pixelSize: 22
                }
                InputFieldLabel {
                    inputWidth: 60
                }
            }
            RowLayout {
                Label {
                    text: "结束瓶号："
                    font.pixelSize: 22
                }
                InputFieldLabel {
                    inputWidth: 60
                }
            }
            CustomButton {
                buttonText: "润洗"
                buttonWidth: 100
                buttonHeight: 45
                fontSize: 20
            }
            CustomButton {
                buttonText: "排空"
                buttonWidth: 100
                buttonHeight: 45
                fontSize: 20
            }
        }
    }
}
