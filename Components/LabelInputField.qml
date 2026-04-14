import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    // ===== 外部可改的全局属性 =====
    property string labelText: ""
    property string unitText: ""
    property bool isNumber: true

    // 自定义宽高
    property int labelWidth: 100       // 标签默认宽度
    property int inputWidth: 150       // 输入框默认宽度
    property int inputHeight: 33       // 输入框默认高度
    property int fontSize: 20          // 默认字体大小

    // ✅ 对外接口：控制输入框文字对齐（left / center / right）
    property string inputAlign: "center"

    property alias inputText: inputField.text
    property alias inputControl: inputField  // 暴露输入框本体，方便绑键盘

    // 标签
    Label {
        text: labelText
        font.pixelSize: fontSize
        Layout.preferredWidth: labelWidth
        color: "black"
        visible: labelText !== ""
    }

    // 输入框
    TextField {
        id: inputField
        Layout.preferredWidth: inputWidth
        Layout.preferredHeight: inputHeight
        font.pixelSize: fontSize
        placeholderText: ""
        inputMethodHints: isNumber ? Qt.ImhDigitsOnly : Qt.ImhNone

        // ✅ 根据对外接口自动设置输入框文字对齐
        horizontalAlignment: {
            if (parent.inputAlign === "left") return Qt.AlignLeft
            if (parent.inputAlign === "right") return Qt.AlignRight
            return Qt.AlignHCenter // 默认居中
        }

        background: Rectangle {
            border.color: "#2196F3"
            border.width: 1
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onPressed: mainWindow.beep()
            onClicked: mainWindow.showNumKeyboard(inputField)
        }
    }

    // 单位
    Label {
        text: unitText
        font.pixelSize: fontSize
        color: "black"
        visible: unitText !== ""
    }
}
