import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {
    id: workModePage
    width: parent.width
    height: parent.height

    // 主容器（白色背景）
    Rectangle {
        anchors.fill: parent
        color: "white"

        // 垂直布局管理所有内容
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20  // 行间距

            // 设备序列号行
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 8

                Text {
                    text: "设备序列号："
                    font.pixelSize: 20
                    font.family: "SimSun"  // 宋体（Windows），Linux/macOS 可换 "Songti SC"
                    color: "#000000"
                }
                Text {
                    text: "123456789123345"
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
            }

            // 程序版本号行
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 8

                Text {
                    text: "程序版本号："
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
                Text {
                    text: "V1.0"
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
            }

            // 图片版本号行
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 8

                Text {
                    text: "图片版本号："
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
                Text {
                    text: "V1.0"
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
            }

            // 空行（分隔作用）
            Item {
                Layout.preferredHeight: 20
            }

            // 售后电话行
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 8

                Text {
                    text: "售后电话："
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
                Text {
                    text: "(0571) 56077301"
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
            }

            // 网址行
            Text {
                text: "WWW.ihenda.com"
                font.pixelSize: 20
                font.family: "SimSun"
                color: "#000000"
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: 76  // 和售后电话内容对齐
            }

            // 空行（分隔作用）
            Item {
                Layout.preferredHeight: 15
            }

            // 公司信息行（Logo + 文字）
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 8

                // Logo 占位（替换为实际图片路径即可）
                Rectangle {
                    width: 24
                    height: 24
                    color: "#d92121"  // 近似 Logo 红色
                    // 实际使用时替换为 Image 组件：
                    // Image {
                    //     source: "path/to/company_logo.png"
                    //     width: 24
                    //     height: 24
                    //     fillMode: Image.PreserveAspectFit
                    // }
                }

                Text {
                    text: "浙江恒达数智科技股份有限公司"
                    font.pixelSize: 20
                    font.family: "SimSun"
                    color: "#000000"
                }
            }
        }
    }
}
