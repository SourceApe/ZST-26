import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"

Page {
    width: parent.width
    height: parent.height
    title: "留样记录查询"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 0

        // 1. 顶部查询栏
        RowLayout {
            Layout.fillWidth: true
            Text { text: "日期索引:"; font.pointSize: 18 }
            InputFieldLabel { unitText: "年" }
            InputFieldLabel { inputWidth: 45; unitText: "月" }
            InputFieldLabel { inputWidth: 45; unitText: "日  —  " }
            InputFieldLabel { unitText: "年" }
            InputFieldLabel { inputWidth: 45; unitText: "月" }
            InputFieldLabel { inputWidth: 45; unitText: "日" }
            Item { Layout.fillWidth: true }
            CustomButton { buttonWidth: 90; buttonText: "查询" }
        }

        // 2. 表头（自适应宽度，不滑动）
        Rectangle {
            Layout.fillWidth: true
            Layout.topMargin: 10
            height: 40
            color: "#0077FF"
            border.color: "#757575"
            border.width: 1

            RowLayout {
                anchors.fill: parent; spacing:0
                Text { Layout.preferredWidth: 60; text:"序号"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height:parent.height; color:"#757575" }

                Text { Layout.preferredWidth: 160; text:"时间"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height:parent.height; color:"#757575" }

                Text { Layout.preferredWidth: 60; text:"供样"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height:parent.height; color:"#757575" }

                Text { Layout.preferredWidth: 100; text:"留样方式"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height:parent.height; color:"#757575" }

                Text { Layout.preferredWidth: 80; text:"瓶号"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height:parent.height; color:"#757575" }

                Text { Layout.preferredWidth: 100; text:"留样量"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height:parent.height; color:"#757575" }

                Text { Layout.preferredWidth: 100; text:"加药类型"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
                Rectangle { width:1; height:parent.height; color:"#757575" }

                Text { Layout.fillWidth: true; text:"加药量"; font.bold:true; font.pointSize:13; color:"white"; horizontalAlignment: Text.AlignHCenter }
            }
        }

        // 3. 列表（只上下滑动，不左右滑动，一屏放下）
        ListView {
            id: listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            clip: true

            // 关闭左右滑动，只保留上下滑动
            flickableDirection: Flickable.VerticalFlick

            model: ListModel {
                ListElement { 序号:"01"; time:"20240501154637"; supply:"是"; method:"同步留样"; bottleNo:"11"; volume:"200"; drugType:"盐酸"; drugVolume:"0.1" }
                ListElement { 序号:"02"; time:"20240501160000"; supply:"否"; method:"手动留样"; bottleNo:"12"; volume:"200"; drugType:"硫酸"; drugVolume:"0.2" }
                ListElement { 序号:"03"; time:"20240501161000"; supply:"是"; method:"同步留样"; bottleNo:"13"; volume:"200"; drugType:"盐酸"; drugVolume:"0.1" }
                ListElement { 序号:"04"; time:"20240501162000"; supply:"否"; method:"手动留样"; bottleNo:"14"; volume:"200"; drugType:"硫酸"; drugVolume:"0.2" }
                ListElement { 序号:"05"; time:"20240501163000"; supply:"是"; method:"同步留样"; bottleNo:"15"; volume:"200"; drugType:"盐酸"; drugVolume:"0.1" }
                ListElement { 序号:"06"; time:"20240501164000"; supply:"否"; method:"手动留样"; bottleNo:"16"; volume:"200"; drugType:"硫酸"; drugVolume:"0.2" }
                ListElement { 序号:"07"; time:"20240501164000"; supply:"否"; method:"手动留样"; bottleNo:"16"; volume:"200"; drugType:"硫酸"; drugVolume:"0.2" }
                ListElement { 序号:"08"; time:"20240501164000"; supply:"否"; method:"手动留样"; bottleNo:"16"; volume:"200"; drugType:"硫酸"; drugVolume:"0.2" }
                ListElement { 序号:"09"; time:"20240501164000"; supply:"否"; method:"手动留样"; bottleNo:"16"; volume:"200"; drugType:"硫酸"; drugVolume:"0.2" }
            }

            delegate: Rectangle {
                height: 40
                width: parent.width  // 直接占满屏幕
                border.color: "#757575"
                border.width: 1
                color: "white"

                RowLayout {
                    anchors.fill: parent; spacing:0
                    Text { Layout.preferredWidth:60; text:序号; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:160; text:time; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:60; text:supply; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:100; text:method; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:80; text:bottleNo; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:100; text:volume; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.preferredWidth:100; text:drugType; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
                    Rectangle { width:1; height:parent.height; color:"#757575" }

                    Text { Layout.fillWidth: true; text:drugVolume; font.pointSize:13; horizontalAlignment: Text.AlignHCenter }
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
