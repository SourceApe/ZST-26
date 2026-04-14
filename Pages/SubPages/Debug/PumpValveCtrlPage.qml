import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"

Page {
    id: root
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }
    title: "手动阀/泵控制"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 50

        // ====================== 第一部分：阀门/设备按钮（4行3列）======================
        ColumnLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            // 第1行
            RowLayout {
                Layout.fillWidth: true
                spacing: 125
                CustomButton { buttonText: "进样阀"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "供样阀"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "瞬样阀"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
            }

            // 第2行
            RowLayout {
                Layout.fillWidth: true
                spacing: 125

                CustomButton { buttonText: "留样阀"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "回流阀"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "排样阀"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
            }

            // 第3行
            RowLayout {
                Layout.fillWidth: true
                spacing: 125

                CustomButton { buttonText: "A桶排空"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "B桶排空"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "外接泵"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
            }

            // 第4行
            RowLayout {
                Layout.fillWidth: true
                spacing: 125

                CustomButton { buttonText: "A桶搅拌"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "B桶搅拌"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "冰箱";    buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
            }
        }

        // ====================== 第二部分：采样泵/留样泵控制 ======================
        ColumnLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            // 采样泵行
            RowLayout {
                Layout.fillWidth: true
                spacing: 30
                Label {
                    text: "采样泵："
                    font.pixelSize: 20
                    Layout.preferredWidth: 160
                }
                CustomButton { buttonText: "正转"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "反转"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "停止"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
            }

            // 留样泵行
            RowLayout {
                Layout.fillWidth: true
                spacing: 30
                Label {
                    text: "留样泵："
                    font.pixelSize: 20
                    Layout.preferredWidth: 160
                }
                CustomButton { buttonText: "正转"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "反转"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "停止"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
            }
            RowLayout {
                Layout.fillWidth: true
                spacing: 30
                Item{
                    width: 160
                    height: 40
                    Label {
                        text: "指定瓶号:"
                        font.pixelSize: 20
                        anchors.verticalCenter: bottleNum.verticalCenter
                    }
                    InputFieldLabel {
                        id: bottleNum
                        anchors.left: parent.left
                        anchors.leftMargin:100
                        inputWidth: 60
                        inputHeight: 40
                    }
                }

                CustomButton {
                    buttonText: "执行";
                    buttonWidth: 110;
                    buttonHeight: 40;
                    fontSize: 20
                }
                CustomButton { buttonText: "进一瓶"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
                CustomButton { buttonText: "瓶复位"; buttonWidth: 110; buttonHeight: 40; fontSize: 20 }
            }
        }

        Item { Layout.fillHeight: true }
    }
}
