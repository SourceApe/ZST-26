import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    id: root
    // 外部可配置属性
    property string labelText: ""
    property var comboModel: []
    property int currentIndex: 0
    property alias comboId: comboBox

    // 样式
    property int labelWidth: 50
    property int comboWidth: 150
    property int comboHeight: 35
    property int fontSize: 20

    // 标签
    Label {
        text: labelText
        font.pixelSize: fontSize
        Layout.preferredWidth: labelWidth
        color: "black"
        visible: labelText !== ""
    }

    ComboBox {
        id: comboBox
        Layout.preferredWidth: comboWidth
        Layout.preferredHeight: comboHeight
        font.pixelSize: fontSize
        model: comboModel
        currentIndex: root.currentIndex
        onCurrentIndexChanged: root.currentIndex = currentIndex

        background: Rectangle {
            color: comboBox.enabled ? "white" : "#f0f0f0"
            border.color: comboBox.enabled ? "#2196F3" : "#cccccc"
            border.width: 1
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    mainWindow.beep()
                    mouse.accepted = false
                }
            }
        }

        delegate: ItemDelegate {
            width: parent.width
            height: comboBox.height

            property bool isActive: pressed || hovered || (comboBox.currentIndex === index)

            background: Rectangle {
                color: isActive ? "#3498db" : "#2c3e50"
            }

            contentItem: Text {
                text: modelData
                font.pixelSize: comboBox.font.pixelSize
                color: "white"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                x: 8
            }

            onClicked: {
                mainWindow.beep()
            }
        }
    }
}
