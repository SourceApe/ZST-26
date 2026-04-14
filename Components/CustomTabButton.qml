import QtQuick 2.12
import QtQuick.Controls 2.12

TabButton {
    id: root
    width: topTabBar.width / 6 - 1
    height: topTabBar.height - 10
    anchors.verticalCenter: parent.verticalCenter
    property int tabIndex: 0

    onPressed: mainWindow.beep()

    background: Rectangle {
        anchors.fill: parent
        anchors.margins: 5
        radius: 8
        color: topTabBar.currentIndex === root.tabIndex ? "white" : "#B3D6FF"
    }
    contentItem: Text {
        text: root.text
        font.pixelSize: 20
        color: "#0077FF"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
