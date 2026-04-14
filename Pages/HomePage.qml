import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import com.mainpage.config 1.0

Page {
    id: homePage
    width: parent.width
    height: parent.height

    Component {
        id: statusTextComp  // 状态文本样式组件
        Text {
            // 文字居中核心属性
            Layout.alignment: Qt.AlignCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            // 默认样式（可外部覆盖）
            font.pixelSize: 22
            color: "#333333"
            // 预留默认文本（可外部修改）
            text: "Text"
        }
    }

    ColumnLayout {
        anchors.fill: parent

        // 主布局：左右两栏
        RowLayout {
            Layout.fillWidth: true  // 水平占满父布局
            Layout.preferredHeight: homePage.height * 7/9  // 高度=父容器高度×3/5
            Layout.leftMargin: 50    // 左侧空隙（原30→50）
            Layout.topMargin: 20     // 顶部空隙（新增）
            Layout.rightMargin: 30
            spacing: 40

            // ========== 左侧：A桶 ==========
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                // 阴影层
                Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: 16
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: 4
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "transparent" }
                        GradientStop { position: 1.0; color: "#99cccccc" }
                    }
                }

                // A桶卡片（上层）
                Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: 16
                    color: "white"
                    border.color: "#0077ff"
                    border.width: 2
                    z: 1

                    // 标题栏（顶部圆角+底部直角）
                    Item {
                        id: titleBarA
                        width: parent.width - (parent.border.width * 2)
                        height: 50
                        anchors.horizontalCenter: parent.horizontalCenter

                        // 顶部圆角背景
                        Rectangle {
                            width: parent.width
                            height: parent.height - (parent.parent.border.width * 2)
                            anchors.top: parent.top
                            anchors.topMargin: parent.parent.border.width
                            radius: 14
                            color: "#b3d6ff"
                            antialiasing: true
                        }

                        // 底部覆盖条 → 把圆角切平
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 16
                            color: "#b3d6ff"
                        }

                        // 底部边框线（你要的那条直边框）
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: parent.parent.border.width
                            color: "#0077ff"
                        }

                        // 标题文字
                        Text {
                            text: "A 桶"
                            font.pixelSize: 28
                            color: "#0077FF"
                            anchors.centerIn: parent
                        }
                    }

                    // 数据区域
                    ColumnLayout {
                        anchors.top: titleBarA.bottom
                        anchors.topMargin: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 28
                        spacing: 20

                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "A桶状态:"; font.pixelSize: 22; color: "#333333" }
                            Loader {
                                sourceComponent: statusTextComp
                                Layout.preferredWidth: 150
                                onLoaded: {
                                    item.text = "空闲"
                                }
                            }
                        }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "采样模式:"; font.pixelSize: 22; color: "#333333" }
                            Loader {
                                sourceComponent: statusTextComp
                                Layout.preferredWidth: 150
                                onLoaded: {
                                    item.text = "触发采样"
                                }
                            }
                        }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "采样量:"; font.pixelSize: 22; color: "#333333" }
                            Loader {
                                sourceComponent: statusTextComp
                                Layout.preferredWidth: 150
                                onLoaded: {
                                    item.text = "空闲"
                                }
                            }
                        }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "采样次数:"; font.pixelSize: 22; color: "#333333" }
                            Item { Layout.fillWidth: true }
                            Text { text: "/"; font.pixelSize: 22; color: "#666666" }
                        }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "间隔时间:"; font.pixelSize: 22; color: "#333333" }
                            Item { Layout.fillWidth: true }
                            Text { text: "min"; font.pixelSize: 22; color: "#666666" }
                        }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "累计流量:"; font.pixelSize: 22; color: "#333333" }
                            Item { Layout.fillWidth: true }
                            Text { text: "/"; font.pixelSize: 22; color: "#666666" }
                            Text { text: "m³"; font.pixelSize: 22; color: "#666666"; anchors.leftMargin: 10 }
                        }
                    }
                }
            }
            // ========== 右侧：B桶 ==========
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                // 阴影层
                Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: 16
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: 4
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "transparent" }   // 左上透明
                        GradientStop { position: 1.0; color: "#99cccccc" }     // 右下浅灰阴影
                    }
                }

                // B桶卡片（上层）
                Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: 16
                    color: "white"
                    border.color: "#0077FF"
                    border.width: 2
                    z: 1

                    // 标题栏
                    Item {
                        id: titleBarB
                        width: parent.width - (parent.border.width * 2)
                        height: 50
                        anchors.horizontalCenter: parent.horizontalCenter

                        // 顶部圆角背景
                        Rectangle {
                            width: parent.width
                            height: parent.height - (parent.parent.border.width * 2)
                            anchors.top: parent.top
                            anchors.topMargin: parent.parent.border.width
                            radius: 14
                            color: "#b3d6ff"
                            antialiasing: true
                        }

                        // 底部覆盖 → 切平圆角
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 16
                            color: "#b3d6ff"
                        }

                        // 底部边框（你要的那条直线）
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: parent.parent.border.width
                            color: "#0077ff"
                        }

                        // 标题文字
                        Text {
                            text: "B 桶"
                            font.pixelSize: 28
                            color: "#0077FF"
                            anchors.centerIn: parent
                        }
                    }

                    // 数据区域
                    ColumnLayout {
                        anchors.top: titleBarB.bottom
                        anchors.topMargin: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 28
                        spacing: 20

                        RowLayout {
                            Layout.fillWidth: true;
                            Layout.preferredHeight: 10;
                            Text {
                                text: "B桶状态:";
                                font.pixelSize: 22;
                                color: "#333"
                            }
                            Item {
                                Layout.fillWidth: true
                            }
                        }
                        RowLayout { Layout.fillWidth: true; Layout.preferredHeight: 10; Text { text: "供样模式:"; font.pixelSize: 22; color: "#333" } Item { Layout.fillWidth: true } }
                        RowLayout { Layout.fillWidth: true; Layout.preferredHeight: 10; Text { text: "供样时间:"; font.pixelSize: 22; color: "#333" } Item { Layout.fillWidth: true } Text { text: "min"; font.pixelSize: 22; color: "#666" } }
                        RowLayout { Layout.fillWidth: true; Layout.preferredHeight: 10; Text { text: "留样模式:"; font.pixelSize: 22; color: "#333" } Item { Layout.fillWidth: true } }
                        RowLayout { Layout.fillWidth: true; Layout.preferredHeight: 10; Text { text: "当前留样瓶瓶号:"; font.pixelSize: 22; color: "#333" } Item { Layout.fillWidth: true } }
                        RowLayout { Layout.fillWidth: true; Layout.preferredHeight: 10; Text { text: "当前留样量:"; font.pixelSize: 22; color: "#333" } Item { Layout.fillWidth: true } Text { text: "mL"; font.pixelSize: 22; color: "#666" } }
                        RowLayout { Layout.fillWidth: true; Layout.preferredHeight: 10; Text { text: "加药量:"; font.pixelSize: 22; color: "#333" } Item { Layout.fillWidth: true } Text { text: "uL"; font.pixelSize: 22; color: "#666" } }
                        RowLayout { Layout.fillWidth: true; Layout.preferredHeight: 10; Text { text: "超标等待时间:"; font.pixelSize: 22; color: "#333" } Item { Layout.fillWidth: true } Text { text: "min"; font.pixelSize: 22; color: "#666" } }
                    }
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: homePage.height * 2/9
            Layout.bottomMargin: 10
            spacing: 20
            // 左侧
            ColumnLayout {
                Layout.fillHeight: true
                Layout.preferredWidth: homePage.width * 1/2
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: homePage.height * 1/3 * 1/2
                    Layout.leftMargin: 50
                    spacing: 250
                    CustomButton {
                        id: loginBtn
                        buttonText: MainPageConfig.userName || "登录"
                        buttonWidth: 100
                        buttonHeight: 45
                        onClicked: {
                            globalPopUps.loginVisible = true
                        }
                    }
                    CustomButton {
                        buttonText: "停止"
                        buttonWidth: 100
                        buttonHeight: 45
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: homePage.height * 1/3 * 1/2
                    Layout.leftMargin: 50
                    Text {
                        text: "报警状态:"
                        font.pixelSize: 20
                        color: "#222222"
                    }
                    Text {
                        Layout.preferredWidth: 254
                        text: "无报警"
                        font.pixelSize: 20
                        color: "#222222"
                    }
                    CustomButton {
                        buttonText: "二次供样"
                        buttonWidth: 100
                        buttonHeight: 45
                    }
                }
            }

            // 右侧
            ColumnLayout {
                Layout.fillHeight: true
                Layout.preferredWidth: homePage.width * 1/2
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: homePage.height * 1/3 * 1/2
                    Layout.leftMargin: 80
                    spacing: 130
                    CustomButton {
                        buttonText: "瓶复位"
                        buttonWidth: 100
                        buttonHeight: 45
                    }
                    CustomButton {
                        buttonText: "维护信息"
                        buttonWidth: 100
                        buttonHeight: 45
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: homePage.height * 1/3 * 1/2
                    Layout.leftMargin: 80
                    spacing: 130
                    // B桶下排按钮
                    CustomButton {
                        buttonText: "取样"
                        buttonWidth: 100
                        buttonHeight: 45
                    }
                    CustomButton {
                        buttonText: "门禁"
                        buttonWidth: 100
                        buttonHeight: 45
                    }
                }
            }
        }
    }
}
