import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.analogchannelpage.config 1.0

Page {
    id: root
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }

    // ====================== 保存参数到配置 ======================
    function saveAllToConfig() {
        // 采样
        AnalogChannelPageConfig.sampleTriggerLower = sampleTriggerInput.inputText;

        // 供样
        AnalogChannelPageConfig.supplyRange = supplyRangeInput.inputText;
        AnalogChannelPageConfig.supplyTriggerValue = supplyTriggerInput.inputText;
        AnalogChannelPageConfig.supplyMeterData = supplyMeterInput.inputText;

        // COD
        AnalogChannelPageConfig.codRange = codRangeInput.inputText;
        AnalogChannelPageConfig.codOverLimit = codOverLimitInput.inputText;
        AnalogChannelPageConfig.codMeterData = codMeterInput.inputText;

        // NH3
        AnalogChannelPageConfig.nh3Range = nh3RangeInput.inputText;
        AnalogChannelPageConfig.nh3OverLimit = nh3OverLimitInput.inputText;
        AnalogChannelPageConfig.nh3MeterData = nh3MeterInput.inputText;

        // TP
        AnalogChannelPageConfig.tpRange = tpRangeInput.inputText;
        AnalogChannelPageConfig.tpOverLimit = tpOverLimitInput.inputText;
        AnalogChannelPageConfig.tpMeterData = tpMeterInput.inputText;

        // TN
        AnalogChannelPageConfig.tnRange = tnRangeInput.inputText;
        AnalogChannelPageConfig.tnOverLimit = tnOverLimitInput.inputText;
        AnalogChannelPageConfig.tnMeterData = tnMeterInput.inputText;

        // 保存到文件
        AnalogChannelPageConfig.saveAllConfig();
    }

    // ====================== 加载配置到UI ======================
    function loadConfigToUI() {
        sampleTriggerInput.inputText = AnalogChannelPageConfig.sampleTriggerLower;

        supplyRangeInput.inputText = AnalogChannelPageConfig.supplyRange;
        supplyTriggerInput.inputText = AnalogChannelPageConfig.supplyTriggerValue;
        supplyMeterInput.inputText = AnalogChannelPageConfig.supplyMeterData;

        codRangeInput.inputText = AnalogChannelPageConfig.codRange;
        codOverLimitInput.inputText = AnalogChannelPageConfig.codOverLimit;
        codMeterInput.inputText = AnalogChannelPageConfig.codMeterData;

        nh3RangeInput.inputText = AnalogChannelPageConfig.nh3Range;
        nh3OverLimitInput.inputText = AnalogChannelPageConfig.nh3OverLimit;
        nh3MeterInput.inputText = AnalogChannelPageConfig.nh3MeterData;

        tpRangeInput.inputText = AnalogChannelPageConfig.tpRange;
        tpOverLimitInput.inputText = AnalogChannelPageConfig.tpOverLimit;
        tpMeterInput.inputText = AnalogChannelPageConfig.tpMeterData;

        tnRangeInput.inputText = AnalogChannelPageConfig.tnRange;
        tnOverLimitInput.inputText = AnalogChannelPageConfig.tnOverLimit;
        tnMeterInput.inputText = AnalogChannelPageConfig.tnMeterData;
    }

    // 页面加载完成自动读取配置
    Component.onCompleted: {
        loadConfigToUI();
    }

    onVisibleChanged: {
        if(visible){
            loadConfigToUI();
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 25

        RowLayout{
            Layout.fillWidth: true
            Item {
                Layout.fillWidth: true
                Layout.rightMargin: 20
                height: 80

                Rectangle {
                    anchors.fill: parent
                    border.color: "#0077FF"
                    border.width: 2
                    radius: 6
                    color: "transparent"
                }

                Label {
                    text: "外部触发模式4-20mA采样"
                    font.pixelSize: 22
                    color: "#0077FF"
                    background: Rectangle { color: "white" }
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -12
                    leftPadding: 8
                    rightPadding: 8
                }

                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    spacing: 20
                    LabelInputField {
                        id: sampleTriggerInput
                        labelText: "外部触发        4-20mA触发下限:"
                        unitText: "mA"
                        labelWidth: 280
                    }
                }
            }

            CustomButton {
                buttonText: "保存"
                buttonHeight: 50
                onClicked: saveAllToConfig()
            }
        }

        Item {
            Layout.fillWidth: true
            height: 80

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
                color: "transparent"
            }

            Label {
                text: "外部触发模式4-20mA供样"
                font.pixelSize: 22
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: -12
                leftPadding: 8
                rightPadding: 8
            }

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 30
                spacing: 30
                LabelInputField {
                    id: supplyRangeInput
                    labelText: "量程:    0-"
                    labelWidth: 80
                    inputWidth: 130
                }
                LabelInputField {
                    id: supplyTriggerInput
                    labelText: "供样触发值:";
                    unitText:"mA"
                    labelWidth: 110
                    inputWidth: 130
                }
                LabelInputField {
                    id: supplyMeterInput
                    labelText: "仪表数据:"
                    labelWidth: 90
                    inputWidth: 130
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                anchors.fill: parent
                border.color: "#0077FF"
                border.width: 2
                radius: 6
                color: "transparent"
            }

            Label {
                text: "外部触发模式4-20mA留样（超标留样）"
                font.pixelSize: 22
                color: "#0077FF"
                background: Rectangle { color: "white" }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: -12
                leftPadding: 8
                rightPadding: 8
            }

            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 30
                spacing: 18

                RowLayout {
                    spacing: 25
                    LabelInputField {
                        id: codRangeInput
                        labelText:"COD 量程:  0-";
                        unitText:"mg/L"
                        labelWidth: 115
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: codOverLimitInput
                        labelText:"超标值:";
                        unitText:"mg/L"
                        labelWidth: 70
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: codMeterInput
                        labelText:"仪表数据:";
                        unitText:"mg/L"
                        labelWidth: 90
                        inputWidth: 100
                    }
                }
                RowLayout {
                    spacing: 25
                    LabelInputField {
                        id: nh3RangeInput
                        labelText:"NH3 量程:  0-";
                        unitText:"mg/L"
                        labelWidth: 115
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: nh3OverLimitInput
                        labelText:"超标值:";
                        unitText:"mg/L"
                        labelWidth: 70
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: nh3MeterInput
                        labelText:"仪表数据:";
                        unitText:"mg/L"
                        labelWidth: 90
                        inputWidth: 100
                    }
                }
                RowLayout {
                    spacing: 25
                    LabelInputField {
                        id: tpRangeInput
                        Layout.leftMargin: 2
                        labelText:"TP    量程:  0-";
                        unitText:"mg/L"
                        labelWidth: 113
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: tpOverLimitInput
                        labelText:"超标值:";
                        unitText:"mg/L"
                        labelWidth: 70
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: tpMeterInput
                        labelText:"仪表数据:";
                        unitText:"mg/L"
                        labelWidth: 90
                        inputWidth: 100
                    }
                }
                RowLayout {
                    spacing: 25
                    LabelInputField {
                        id: tnRangeInput
                        labelText:"TN    量程:  0-";
                        unitText:"mg/L"
                        labelWidth: 115
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: tnOverLimitInput
                        labelText:"超标值:";
                        unitText:"mg/L"
                        labelWidth: 70
                        inputWidth: 100
                    }
                    LabelInputField {
                        id: tnMeterInput
                        labelText:"仪表数据:";
                        unitText:"mg/L"
                        labelWidth: 90
                        inputWidth: 100
                    }
                }
            }
        }
    }
}
