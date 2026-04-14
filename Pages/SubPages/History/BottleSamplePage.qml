import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"

Page {
    width: parent.width
    height: parent.height

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        spacing: 10

        // 第一行 12 个瓶子
        Row {
            Layout.fillWidth: true
            spacing: 10
            Repeater {
                model: 12
                BottleItem {
                    bottleIndex: index
                    bottleState: 1
                    waterHeight: 0.5
                }
            }
        }

        // 第二行 12 个瓶子
        Row {
            Layout.fillWidth: true
            spacing: 10
            Repeater {
                model: 12
                BottleItem {
                    bottleIndex: index + 12
                    bottleState: 3
                    waterHeight: 0.5
                }
            }
        }
        Item { Layout.fillHeight: true; Layout.fillWidth: true }
        Row {
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 20
            spacing: 50
            Repeater {
                model: 5
                BottleItem {
                    bottleMarkText: {
                        switch(index){
                            case 0: return "空瓶";
                            case 1: return "有水瓶";
                            case 2: return "异常瓶";
                            case 3: return "加药瓶";
                            case 4: return "无效瓶";
                            default: return "";
                        }
                    }
                    bottleNumVisible: false
                    bottleState: index
                    waterHeight: 1.0
                    bottleMarkFontSize: 18
                }
            }
        }
    }
}
