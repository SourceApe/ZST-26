import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"

Page {
    width: parent.width
    height: parent.height
    title: "采样记录查询"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 0

        // 1. 顶部日期查询栏
        RowLayout {
            Layout.fillWidth: true
            Text {
                text: "日期索引:"
                font.pointSize: 18
            }
            // 年
            InputFieldLabel {
                unitText: "年"
            }
            // 月输入框
            InputFieldLabel {
                inputWidth: 45
                unitText: "月"
            }
            // 日输入框
            InputFieldLabel {
                inputWidth: 45
                unitText: "日  —  "
            }
            // 结束年
            InputFieldLabel {
                unitText: "年"
            }
            // 结束月
            InputFieldLabel {
                inputWidth: 45
                unitText: "月"
            }
            // 结束日
            InputFieldLabel {
                inputWidth: 45
                unitText: "日"
            }
            Item { Layout.fillWidth: true }
            CustomButton {
                buttonWidth: 90
                buttonText: "查询"
            }
        }

        // 2. 表格表头（带垂直分隔线，匹配图二）
        Rectangle {
            Layout.fillWidth: true
            Layout.topMargin: 10
            height: 40
            color: "#0077FF"
            border.color: "#757575"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                spacing: 0

                // 序号列
                Text {
                    Layout.preferredWidth: 80
                    text: "序号"
                    font.bold: true
                    font.pointSize: 14
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                }
                // 序号右侧竖线
                Rectangle {
                    width: 1
                    height: parent.height
                    color: "#757575"
                }

                // 时间列
                Text {
                    Layout.preferredWidth: 220
                    text: "时间"
                    font.bold: true
                    font.pointSize: 14
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                }
                // 时间右侧竖线
                Rectangle {
                    width: 1
                    height: parent.height
                    color: "#757575"
                }

                // 采样方式列
                Text {
                    Layout.preferredWidth: 140
                    text: "采样方式"
                    font.bold: true
                    font.pointSize: 14
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                }
                // 采样方式右侧竖线
                Rectangle {
                    width: 1
                    height: parent.height
                    color: "#757575"
                }

                // 采样量列
                Text {
                    Layout.preferredWidth: 160
                    text: "采样量 (mL)"
                    font.bold: true
                    font.pointSize: 14
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                }
                // 采样量右侧竖线
                Rectangle {
                    width: 1
                    height: parent.height
                    color: "#757575"
                }

                // 采样桶列
                Text {
                    Layout.preferredWidth: 140
                    text: "采样桶"
                    font.bold: true
                    font.pointSize: 14
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        // ==============================================
        // 3. 表格主体 ListView（带垂直分隔线，匹配图二）
        // ==============================================
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            clip: true

            model: ListModel {
                ListElement { 序号: "01"; time: "20240601174536"; method: "时间等比"; volume: "500"; bucket: "B" }
                ListElement { 序号: ""; time: ""; method: ""; volume: ""; bucket: "" }
                ListElement { 序号: ""; time: ""; method: ""; volume: ""; bucket: "" }
                ListElement { 序号: ""; time: ""; method: ""; volume: ""; bucket: "" }
                ListElement { 序号: ""; time: ""; method: ""; volume: ""; bucket: "" }
                ListElement { 序号: ""; time: ""; method: ""; volume: ""; bucket: "" }
            }

            delegate: Rectangle {
                height: 40
                width: parent.width
                border.color: "#757575"
                border.width: 1
                color: "white"

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 序号列
                    Text {
                        Layout.preferredWidth: 80
                        text: 序号
                        font.pointSize: 14
                        horizontalAlignment: Text.AlignHCenter
                    }
                    // 序号右侧竖线
                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#757575"
                    }

                    // 时间列
                    Text {
                        Layout.preferredWidth: 220
                        text: time
                        font.pointSize: 14
                        horizontalAlignment: Text.AlignHCenter
                    }
                    // 时间右侧竖线
                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#757575"
                    }

                    // 采样方式列
                    Text {
                        Layout.preferredWidth: 140
                        text: method
                        font.pointSize: 14
                        horizontalAlignment: Text.AlignHCenter
                    }
                    // 采样方式右侧竖线
                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#757575"
                    }

                    // 采样量列
                    Text {
                        Layout.preferredWidth: 160
                        text: volume
                        font.pointSize: 14
                        horizontalAlignment: Text.AlignHCenter
                    }
                    // 采样量右侧竖线
                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#757575"
                    }

                    // 采样桶列
                    Text {
                        Layout.preferredWidth: 140
                        text: bucket
                        font.pointSize: 14
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        // ==============================================
        // 4. 底部按钮区域
        // ==============================================
        Row {
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 20
            spacing: 40

            // 上一页
            CustomButton {
                buttonText: "上一页"
                buttonWidth: 160
                buttonHeight: 50
                fontSize: 20
            }

            // 下一页
            CustomButton {
                buttonText: "下一页"
                buttonWidth: 160
                buttonHeight: 50
                fontSize: 20
            }

            // 打印机打印
            CustomButton {
                buttonText: "打印机打印"
                buttonWidth: 220
                buttonHeight: 50
                fontSize: 20
            }
        }
    }
}
