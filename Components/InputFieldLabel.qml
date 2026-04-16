import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    // ===== 外部可改的全局属性 =====
    property string unitText: ""
    property string inputText: ""

    // 自定义宽高
    property int inputWidth: 80       // 输入框默认宽度
    property int inputHeight: 35      // 输入框默认高度
    property int fontSize: 20          // 默认字体大小

    property alias inputText: inputField.text

    TextField {
        id: inputField
        Layout.preferredWidth: inputWidth
        Layout.preferredHeight: inputHeight
        font.pixelSize: fontSize
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        background: Rectangle {
            color: "#104F98"
            border.width: 0
        }
        MouseArea {
            anchors.fill: parent
            onPressed: mainWindow.beep()
            onClicked: mainWindow.showNumKeyboard(inputField)
        }
    }
    //单位
    Label {
        text: unitText;
        font.pixelSize: fontSize;
        color: "black"
        visible: unitText != ""
    }
}
