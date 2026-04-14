import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.calibrationpage.config 1.0

Page {
    id: root
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }
    title: "校准设置"

    property int currentPage: 1

    // ====================== 全局保存（两页共用） ======================
    function saveAllToConfig() {
        CalibrationPageConfig.pump1Factor = pump1FactorInput.inputText
        CalibrationPageConfig.pump2Factor = pump2FactorInput.inputText
        CalibrationPageConfig.pump3Factor = pump3FactorInput.inputText

        CalibrationPageConfig.samplePump500ml = samplePump500mlInput.inputText
        CalibrationPageConfig.samplePipePulse = samplePipePulseInput.inputText

        CalibrationPageConfig.retainPump10ml = retainPump10mlInput.inputText
        CalibrationPageConfig.retainPump500ml = retainPump500mlInput.inputText
        CalibrationPageConfig.retainPipePulse = retainPipePulseInput.inputText

        CalibrationPageConfig.fridgeRealTemp = fridgeRealInput.inputText
        CalibrationPageConfig.fridgeCalibTemp = fridgeCalibInput.inputText

        CalibrationPageConfig.saveAllConfig()
        console.log("✅ 校准参数已保存")
    }

    // ====================== 全局加载（切页自动恢复） ======================
    function loadConfigToUI() {
        pump1FactorInput.inputText = CalibrationPageConfig.pump1Factor
        pump2FactorInput.inputText = CalibrationPageConfig.pump2Factor
        pump3FactorInput.inputText = CalibrationPageConfig.pump3Factor

        samplePump500mlInput.inputText = CalibrationPageConfig.samplePump500ml
        samplePipePulseInput.inputText = CalibrationPageConfig.samplePipePulse

        retainPump10mlInput.inputText = CalibrationPageConfig.retainPump10ml
        retainPump500mlInput.inputText = CalibrationPageConfig.retainPump500ml
        retainPipePulseInput.inputText = CalibrationPageConfig.retainPipePulse

        fridgeRealInput.inputText = CalibrationPageConfig.fridgeRealTemp
        fridgeCalibInput.inputText = CalibrationPageConfig.fridgeCalibTemp
    }

    Component.onCompleted: {
        loadConfigToUI()
        console.log("✅ 校准配置已加载")
    }

    onVisibleChanged: {
        if(visible)
            loadConfigToUI()
    }

    // ===================== 第 1 页 =====================
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15
        visible: currentPage === 1

        // 加药泵1校准
        Item {
            Layout.fillWidth: true
            height: 60

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }
            Label {
                text: "加药泵1校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30

                LabelInputField {
                    id: pump1FactorInput
                    labelText: "校准系数:"
                    unitText: "mL"
                    labelWidth: 110
                }
                CustomButton {
                    Layout.leftMargin: 50
                    buttonWidth: 100
                    buttonText: "运行"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "校准"
                }
            }
        }

        // 加药泵2校准
        Item {
            Layout.fillWidth: true
            height: 60

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }

            Label {
                text: "加药泵2校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30

                LabelInputField {
                    id: pump2FactorInput
                    labelText: "校准系数:"
                    unitText: "mL"
                    labelWidth: 110
                }
                CustomButton {
                    Layout.leftMargin: 50
                    buttonWidth: 100
                    buttonText: "运行"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "校准"
                }
            }
        }

        // 加药泵3校准
        Item {
            Layout.fillWidth: true
            height: 60

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }

            Label {
                text: "加药泵3校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30

                LabelInputField {
                    id: pump3FactorInput
                    labelText: "校准系数:"
                    unitText: "mL"
                    labelWidth: 110
                }
                CustomButton {
                    Layout.leftMargin: 50
                    buttonWidth: 100
                    buttonText: "运行"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "校准"
                }
            }
        }

        // 采样泵校准
        Item {
            Layout.fillWidth: true
            height: 60

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }

            Label {
                text: "采样泵校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30

                LabelInputField {
                    id: samplePump500mlInput
                    labelText: "500mL:"
                    labelWidth: 110
                }
                CustomButton {
                    Layout.leftMargin: 85
                    buttonWidth: 100
                    buttonText: "运行"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "校准"
                }
            }
        }

        // 采样进水管路校准
        Item {
            Layout.fillWidth: true
            height: 60

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }

            Label {
                text: "采样进水管路校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30

                LabelInputField {
                    id: samplePipePulseInput
                    labelText: "校准脉冲数:"
                    labelWidth: 110
                }
                CustomButton {
                    Layout.leftMargin: 85
                    buttonWidth: 100
                    buttonText: "运行"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "停止"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "校准"
                }
            }
        }

        Item { Layout.fillHeight: true }

        CustomButton {
            Layout.alignment: Qt.AlignHCenter
            buttonText: "下一页"
            onClicked: currentPage = 2
        }
    }

    // ===================== 第 2 页 =====================
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15
        visible: currentPage === 2

        // 留样泵校准
        Item {
            Layout.fillWidth: true
            height: 110

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }

            Label {
                text: "留样泵校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            ColumnLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 10

                RowLayout {
                    spacing: 30
                    LabelInputField {
                        id: retainPump10mlInput
                        labelText: "10mL:"
                        labelWidth: 110
                    }
                    CustomButton {
                        Layout.leftMargin: 85
                        buttonWidth: 100
                        buttonText: "运行"
                    }
                    CustomButton {
                        buttonWidth: 100
                        buttonText: "校准"
                    }
                }

                RowLayout {
                    spacing: 30
                    LabelInputField {
                        id: retainPump500mlInput
                        labelText: "500mL:"
                        labelWidth: 110
                    }
                    CustomButton {
                        Layout.leftMargin: 85
                        buttonWidth: 100
                        buttonText: "运行"
                    }
                    CustomButton {
                        buttonWidth: 100
                        buttonText: "校准"
                    }
                }
            }
        }

        // 留样进水管路校准
        Item {
            Layout.fillWidth: true
            height: 60

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }

            Label {
                text: "留样进水管路校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30

                LabelInputField {
                    id: retainPipePulseInput
                    labelText: "校准脉冲数:"
                    labelWidth: 110
                }
                CustomButton {
                    Layout.leftMargin: 85
                    buttonWidth: 100
                    buttonText: "运行"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "停止"
                }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "校准"
                }
            }
        }

        // 冰箱温度校准
        Item {
            Layout.fillWidth: true
            height: 60

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
            }

            Label {
                text: "冰箱温度校准"
                font.pixelSize: 18
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: -8
            }

            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30

                LabelInputField {
                    id: fridgeRealInput
                    labelText: "实际值:"
                    unitText: "℃"
                    labelWidth: 70
                    inputWidth: 80
                }
                LabelInputField {
                    id: fridgeCalibInput
                    labelText: "校准值:"
                    unitText: "℃"
                    labelWidth: 70
                    inputWidth: 80
                }
                CustomButton {
                    Layout.leftMargin: 30
                    buttonWidth: 100
                    buttonText: "校准"
                }
                CustomButton {
                    buttonWidth: 140
                    buttonText: "4-20mA校准"
                }
            }
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Item { Layout.fillWidth: true }
            CustomButton {
                Layout.leftMargin: 165
                buttonText: "上一页"
                onClicked: currentPage = 1
            }
            Item { Layout.fillWidth: true }
            CustomButton {
                Layout.rightMargin: 40
                buttonText: "保存"
                onClicked: saveAllToConfig()
            }
        }
    }
}
