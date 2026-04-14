import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

// 通用状态项：指示灯 + 状态文字
Item {
    id: root
    width: 280
    height: 40

    // 对外属性：状态名称、是否激活（当前状态）
    property string statusName: ""
    property bool isActive: false

    // 指示灯颜色：激活=绿色，未激活=灰色
    readonly property color indicatorColor: isActive ? "#2ECC71" : "#BDC3C7"

    RowLayout {
        anchors.centerIn: parent
        spacing: 12

        // 状态指示灯（圆形）
        Rectangle {
            width: 16
            height: 16
            radius: 8
            color: indicatorColor
            border.color: Qt.darker(indicatorColor, 1.2)
            border.width: 1
        }

        // 状态文字
        Label {
            text: root.statusName
            font.pixelSize: 20
            font.family: "Microsoft YaHei"
            color: "#333333"
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
