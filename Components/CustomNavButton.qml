import QtQuick 2.12
import QtQuick.Controls 2.12

// 自定义导航按钮组件（独立文件）
Rectangle {
    // 1. 自定义属性（对外暴露，供调用时赋值）
    property bool isSelected: false
    property string text: ""
    property int btnHeight: 50

    // 2. 自定义信号（对外暴露，供调用时绑定点击逻辑）
    signal clicked()

    // 组件固定宽度（适配左侧导航栏）
    width: parent.width
    height: btnHeight
    // 选中态背景色：选中时加深，未选中透明
    color: isSelected ? "#104F98" : "transparent"
    border.color: "transparent"

    Rectangle {
        // 竖条位置：紧贴左侧，高度与按钮一致
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 8  // 竖条宽度（可微调为10px）
        // 竖条颜色：浅蓝色（匹配参考图），仅选中时显示
        color: "#B3D6FF"
        visible: parent.isSelected  // 选中态才显示
    }
    // 按钮文字
    Text {
        anchors.centerIn: parent
        text: parent.text
        color: "white"
        font.pixelSize: 18
    }

    // 点击交互（触发自定义clicked信号）
    MouseArea {
        anchors.fill: parent
        onPressed: mainWindow.beep()
        // 点击时向外发送信号
        onClicked: {
            parent.clicked()
        }
    }
}
