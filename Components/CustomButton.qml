import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: root
    width: buttonWidth
    height: buttonHeight
    radius: buttonRadius

    property string buttonText: ""
    property int buttonWidth: 120
    property int buttonHeight: 40
    property int fontSize: 20
    readonly property real buttonRadius: 6

    property color normalColor: "#0077FF"
    property color pressedColor: "#004499"
    signal clicked()

    property bool forcePressed: false
    property bool isDown: false

    Timer {
        id: pressTimer
        interval: 140
        repeat: false
        onTriggered: forcePressed = false
    }

    Button {
        id: btn
        anchors.fill: parent
        hoverEnabled: false

        background: Rectangle {
            color: (forcePressed || isDown) ? pressedColor : normalColor
            radius: buttonRadius
            scale: (forcePressed || isDown) ? 0.96 : 1
            transformOrigin: Item.Center

            border.color: (forcePressed || isDown) ? "#ffffff" : "transparent"
            border.width: (forcePressed || isDown) ? 1 : 0

            Behavior on color { ColorAnimation { duration: 50 } }
            Behavior on scale { NumberAnimation { duration: 50 } }
            Behavior on border.width { NumberAnimation { duration: 50 } }
        }

        Text {
            anchors.centerIn: parent
            text: buttonText
            color: "white"
            font.pixelSize: fontSize
        }

        onPressed: {
            mainWindow.beep()
            isDown = true
            forcePressed = true
            pressTimer.start()
        }

        onReleased: {
            isDown = false
            forcePressed = true
            pressTimer.restart()
        }

        onClicked: root.clicked()
    }
}
