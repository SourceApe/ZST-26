import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"

Page {
    width: parent.width
    height: parent.height
    title: "仪表供样记录查询"

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
            InputFieldLabel { unitText: "年" }
            InputFieldLabel { inputWidth: 45; unitText: "月" }
            InputFieldLabel { inputWidth: 45; unitText: "日  —  " }
            InputFieldLabel { unitText: "年" }
            InputFieldLabel { inputWidth: 45; unitText: "月" }
            InputFieldLabel { inputWidth: 45; unitText: "日" }
            Item { Layout.fillWidth: true }
            CustomButton { buttonWidth: 90; buttonText: "查询" }
        }

        // 2. 表格表头（固定宽度，不滑动）
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

                Text { Layout.preferredWidth: 80; text: "序号"; font.bold: true; font.pointSize: 14; color: "white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height: parent.height; color: "#757575" }

                Text { Layout.preferredWidth: 220; text: "时间"; font.bold: true; font.pointSize: 14; color: "white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height: parent.height; color: "#757575" }

                Text { Layout.preferredWidth: 120; text: "代号"; font.bold: true; font.pointSize: 14; color: "white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height: parent.height; color: "#757575" }

                Text { Layout.fillWidth: true; text: "信息"; font.bold: true; font.pointSize: 14; color: "white"; horizontalAlignment: Text.AlignHCenter }
            }
        }

        // 3. 列表内容（只上下滑动，不左右滑动）
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            clip: true

            model: ListModel {
                ListElement { 序号:"01"; time:"20240501154637"; code:"A01"; info:"仪表供样启动成功" }
                ListElement { 序号:"02"; time:"20240501160000"; code:"A02"; info:"仪表供样停止" }
                ListElement { 序号:""; time:""; code:""; info:"" }
                ListElement { 序号:""; time:""; code:""; info:"" }
                ListElement { 序号:""; time:""; code:""; info:"" }
                ListElement { 序号:""; time:""; code:""; info:"" }
            }

            delegate: Rectangle {
                height: 40
                width: parent.width
                border.color: "#757575"
                border.width: 1
                color: "white"

                RowLayout {
                    anchors.fill: parent; spacing:0

                    Text { Layout.preferredWidth:80; text:序号; font.pointSize:14; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:220; text:time; font.pointSize:14; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:120; text:code; font.pointSize:14; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.fillWidth: true; text:info; font.pointSize:14; horizontalAlignment: Text.AlignHCenter }
                }
            }
        }

        // 4. 底部按钮
        Row {
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 20
            spacing: 40

            CustomButton { buttonText:"上一页"; buttonWidth:160; buttonHeight:50; fontSize:20 }
            CustomButton { buttonText:"下一页"; buttonWidth:160; buttonHeight:50; fontSize:20 }
            CustomButton { buttonText:"打印机打印"; buttonWidth:220; buttonHeight:50; fontSize:20 }
        }
    }
}
