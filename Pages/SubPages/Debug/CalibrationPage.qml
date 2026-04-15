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

    // ====================== 全局加载（不变） ======================
    function loadConfigToUI() {
        pump1FactorInput.inputText = CalibrationPageConfig.pump1Factor
        pump2FactorInput.inputText = CalibrationPageConfig.pump2Factor
        pump3FactorInput.inputText = CalibrationPageConfig.pump3Factor
        pump4FactorInput.inputText = CalibrationPageConfig.pump4Factor

        samplePump200mlInput.inputText = CalibrationPageConfig.samplePump200ml
        samplePump500mlInput.inputText = CalibrationPageConfig.samplePump500ml
        samplePipePulseInput.inputText = CalibrationPageConfig.samplePipePulse

        retainPump200mlInput.inputText = CalibrationPageConfig.retainPump200ml
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
                    onClicked: {
                        CalibrationPageConfig.pump1Factor = pump1FactorInput.inputText
                        CalibrationPageConfig.savePump1Factor()
                        console.log("✅ 加药泵1系数已保存")
                    }
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
                    onClicked: {
                        CalibrationPageConfig.pump2Factor = pump2FactorInput.inputText
                        CalibrationPageConfig.savePump2Factor()
                        console.log("✅ 加药泵2系数已保存")
                    }
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
                    onClicked: {
                        CalibrationPageConfig.pump3Factor = pump3FactorInput.inputText
                        CalibrationPageConfig.savePump3Factor()
                        console.log("✅ 加药泵3系数已保存")
                    }
                }
            }
        }

        // 加药泵4校准
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
                text: "加药泵4校准"
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
                    id: pump4FactorInput
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
                    onClicked: {
                        CalibrationPageConfig.pump4Factor = pump4FactorInput.inputText
                        CalibrationPageConfig.savePump4Factor()
                        console.log("✅ 加药泵4系数已保存")
                    }
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
                    onClicked: {
                        CalibrationPageConfig.fridgeRealTemp = fridgeRealInput.inputText
                        CalibrationPageConfig.fridgeCalibTemp = fridgeCalibInput.inputText
                        CalibrationPageConfig.saveFridgeCalib()
                        console.log("✅ 冰箱温度校准已保存")
                    }
                }
                CustomButton {
                    buttonWidth: 140
                    buttonText: "4-20mA校准"
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
                    onClicked: {
                        CalibrationPageConfig.samplePipePulse = samplePipePulseInput.inputText
                        CalibrationPageConfig.saveSamplePipePulse()
                        console.log("✅ 采样进水管路脉冲已保存")
                    }
                }
            }
        }

        // 采样泵校准
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
                text: "采样泵校准"
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
                    LabelInputField { id: samplePump200mlInput; labelText: "200mL:"; labelWidth: 110 }
                    CustomButton { Layout.leftMargin: 85; buttonWidth: 100; buttonText: "运行" }
                    CustomButton {
                        buttonWidth: 100
                        buttonText: "校准"
                        onClicked: {
                            CalibrationPageConfig.samplePump200ml = samplePump200mlInput.inputText
                            CalibrationPageConfig.saveSamplePump200ml()
                            console.log("✅ 采样泵 200mL 校准已保存")
                        }
                    }
                }
                RowLayout {
                    spacing: 30
                    LabelInputField { id: samplePump500mlInput; labelText: "500mL:"; labelWidth: 110 }
                    CustomButton { Layout.leftMargin: 85; buttonWidth: 100; buttonText: "运行" }
                    CustomButton {
                        buttonWidth: 100
                        buttonText: "校准"
                        onClicked: {
                            CalibrationPageConfig.samplePump500ml = samplePump500mlInput.inputText
                            CalibrationPageConfig.saveSamplePump500ml()
                            console.log("✅ 采样泵500mL已保存")
                        }
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

                LabelInputField { id: retainPipePulseInput; labelText: "校准脉冲数:"; labelWidth: 110 }
                CustomButton { Layout.leftMargin: 85; buttonWidth: 100; buttonText: "运行" }
                CustomButton { buttonWidth: 100; buttonText: "停止" }
                CustomButton {
                    buttonWidth: 100
                    buttonText: "校准"
                    onClicked: {
                        CalibrationPageConfig.retainPipePulse = retainPipePulseInput.inputText
                        CalibrationPageConfig.saveRetainPipePulse()
                        console.log("✅ 留样进水管路脉冲已保存")
                    }
                }
            }
        }

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
                    LabelInputField { id: retainPump200mlInput; labelText: "200mL:"; labelWidth: 110 }
                    CustomButton { Layout.leftMargin: 85; buttonWidth: 100; buttonText: "运行" }
                    CustomButton {
                        buttonWidth: 100
                        buttonText: "校准"
                        onClicked: {
                            CalibrationPageConfig.retainPump200ml = retainPump200mlInput.inputText
                            CalibrationPageConfig.saveRetainPump200ml()
                            console.log("✅ 留样泵200mL已保存")
                        }
                    }
                }
                RowLayout {
                    spacing: 30
                    LabelInputField { id: retainPump500mlInput; labelText: "500mL:"; labelWidth: 110 }
                    CustomButton { Layout.leftMargin: 85; buttonWidth: 100; buttonText: "运行" }
                    CustomButton {
                        buttonWidth: 100
                        buttonText: "校准"
                        onClicked: {
                            CalibrationPageConfig.retainPump500ml = retainPump500mlInput.inputText
                            CalibrationPageConfig.saveRetainPump500ml()
                            console.log("✅ 留样泵500mL已保存")
                        }
                    }
                }
            }
        }

        CustomButton {
            Layout.alignment: Qt.AlignHCenter
            buttonText: "上一页"
            onClicked: currentPage = 1
        }
    }
}
