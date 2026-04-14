import QtQuick 2.12
import QtGraphicalEffects 1.12

Item {
    id: bottleRoot
    // 🔴 精准增高Item，给瓶号、瓶子、标签留出绝对安全的空间
    width: 60
    height: 140

    property string bottleVolumeText: ""
    property string bottleMarkText: ""
    property int bottleMarkFontSize: 7
    property int bottleIndex: 0
    property int bottleState: 0
    property real waterHeight: 0.0
    property bool showLabel: true
    property bool bottleNumVisible: true

    readonly property color bottleFillColor: {
        switch(bottleState) {
        case 0: return "#e0e0e0"   // 空瓶
        case 1: return "#e3f2fd"   // 有水
        case 2: return "#ff4444"   // 异常
        case 3: return "#1976d2"   // 加药
        case 4: return "white" // 无效
        default: return "#e0e0e0"
        }
    }

    readonly property color bottleBorderColor: "#757575"
    readonly property real bottleRadius: 6
    readonly property real neckHeight: 25

    //瓶号
    Text {
        visible: bottleNumVisible
        id: bottleNum
        anchors.top: bottleRoot.top
        anchors.topMargin: 0
        anchors.horizontalCenter: bottleRoot.horizontalCenter

        text: bottleIndex + 1
        font.bold: true
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        width: bottleRoot.width
    }
    //瓶子主体
    Rectangle {
        id: bottleBody
        anchors.top: bottleRoot.top
        anchors.topMargin: 40

        anchors.bottom: bottleRoot.bottom
        anchors.bottomMargin: 35
        anchors.horizontalCenter: bottleRoot.horizontalCenter

        width: bottleRoot.width * 0.8
        height: 70
        radius: bottleRadius
        color: bottleFillColor
        border.color: bottleBorderColor
        border.width: 2
        z: 1

        Rectangle {
            x: bottleBody.width * 0.2
            y: bottleBody.height * 0.1
            width: bottleBody.width * 0.2
            height: bottleBody.height * 0.8
            radius: width/2
            color: "white"
            z: 3
        }
        Rectangle {
            x: bottleBody.width * 0.6
            y: bottleBody.height * 0.15
            width: bottleBody.width * 0.1
            height: bottleBody.height * 0.7
            radius: width/2
            color: "white"
            z: 3
        }

        // 水位层（完全保留）
        Rectangle {
            id: waterLayer
            anchors.bottom: parent.bottom
            anchors.bottomMargin: bottleBody.border.width
            anchors.left: parent.left
            anchors.leftMargin: bottleBody.border.width
            width: parent.width - (bottleBody.border.width*2)
            height: parent.height * waterHeight - bottleBody.border.width*2
            radius: bottleRadius
            color: bottleState === 1 ? "#bbdefb" : "transparent"
            z: 2
        }

        // 气泡效果（适配小瓶子，不溢出）
        Item {
            visible: bottleState === 3
            anchors.fill: parent
            z: 4
            Repeater {
                model: 6
                delegate: Rectangle {
                    property real randSize: Math.random() * 4 + 2
                    property real randOpa: Math.random() * 0.6 + 0.2
                    width: randSize
                    height: randSize
                    x: Math.random() * (bottleBody.width - 8) + 4
                    y: Math.random() * (bottleBody.height - 8) + 4
                    radius: randSize / 2
                    color: "white"
                    opacity: randOpa
                    NumberAnimation on y {
                        from: y
                        to: y - 15
                        duration: 1500 + Math.random() * 500
                        loops: Animation.Infinite
                    }
                    NumberAnimation on opacity {
                        from: opacity
                        to: 0
                        duration: 1500 + Math.random() * 500
                        loops: Animation.Infinite
                    }
                }
            }
        }
    }

    // 瓶盖（适配新高度，不遮挡瓶号）
    Rectangle {
        id: bottleCap
        width: bottleBody.width * 0.8
        height: neckHeight * 0.5
        radius: height/4
        color: "#e0e0e0"
        border.color: bottleBorderColor
        border.width: 2
        anchors.top: bottleBody.top
        anchors.topMargin: -height - 2
        anchors.horizontalCenter: bottleBody.horizontalCenter
        z: 5
        Row {
            anchors.centerIn: parent
            spacing: 3
            Rectangle { width: 3; height: 8; radius:1.5; color:"white" }
            Rectangle { width: 3; height: 8; radius:1.5; color:"white" }
        }
    }

    // 瓶颈（完全保留）
    Rectangle {
        id: bottleNeck
        width: bottleBody.width * 0.6
        height: 10
        color: "#e0e0e0"
        border.color: bottleBorderColor
        border.width: 2
        anchors.top: bottleCap.bottom
        anchors.topMargin: -3
        anchors.horizontalCenter: bottleBody.horizontalCenter
        z: 0
    }

    Column {
        visible: showLabel
        // 锚定在Item底部，瓶子正下方，绝对居中
        anchors.bottom: bottleRoot.bottom
        anchors.bottomMargin: 2
        anchors.horizontalCenter: bottleRoot.horizontalCenter
        spacing: 1
        width: bottleRoot.width

        // 容量200
        Text {
            visible: bottleNumVisible
            id: bottleVolume
            text: bottleVolumeText
            font.pointSize: 9
            color: "#333333"
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
        // 样品号240524
        Text {
            id: bottleMark
            text: bottleMarkText
            font.pointSize: bottleMarkFontSize
            color: "#555555"
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
    }

    // 点击事件（完全保留）
    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("点击了瓶子：", bottleIndex + 1)
        }
    }
}
