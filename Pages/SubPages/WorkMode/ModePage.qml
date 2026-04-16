import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.modepage.config 1.0
import com.application.config 1.0

Page {
    width: parent.width
    height: parent.height

    // ====================== 【保存】点击保存按钮执行 ======================
    function saveAllToConfig() {
        // 采样模式
        ModePageConfig.sampleModeIndex = sampleModeBox.currentIndex;

        // 定量模式
        ModePageConfig.fixedSampleVol = fixedSampleVolInput.inputText;
        ModePageConfig.fixedRetainBottleNum = fixedRetainBottleNumInput.inputText;
        ModePageConfig.fixedRetainVol = fixedRetainVolInput.inputText;

        // 时间等比
        ModePageConfig.timeRatioSampleVol = timeRatioSampleVolInput.inputText;
        ModePageConfig.timeRatioInterval = timeRatioIntervalInput.inputText;
        ModePageConfig.timeRatioSampleCount = timeRatioSampleCountInput.inputText;

        // 流量等比
        ModePageConfig.flowRatioSampleVol = flowRatioSampleVolInput.inputText;
        ModePageConfig.flowRatioSampleCount = flowRatioSampleCountInput.inputText;
        ModePageConfig.flowRatioTotalFlow = flowRatioTotalFlowInput.inputText;

        // 流量跟踪
        ModePageConfig.flowTrackSampleRatio = flowTrackSampleRatioInput.inputText;
        ModePageConfig.flowTrackInterval = flowTrackIntervalInput.inputText;
        ModePageConfig.flowTrackSampleCount = flowTrackSampleCountInput.inputText;

        // 外部触发
        ModePageConfig.extTriggerSampleVol = extTriggerSampleVolInput.inputText;
        ModePageConfig.extTriggerInterval = extTriggerIntervalInput.inputText;
        ModePageConfig.extTriggerSampleCount = extTriggerSampleCountInput.inputText;

        // 供样模式
        ModePageConfig.supplyModeIndex = sampleSupplyModeBox.currentIndex;
        ModePageConfig.supplyTime = supplyTimeInput.inputText;
        ModePageConfig.supplyLowerLimit = supplyLowerLimitInput.inputText;

        // 留样模式
        ModePageConfig.retainModeIndex = retainModeBox.currentIndex;
        ModePageConfig.retainModeRetainVol = retainModeRetainVolInput.inputText;
        ModePageConfig.parallelSample = parallelSampleInput.inputText;
        ModePageConfig.overWaitTime = overWaitTimeInput.inputText;

        // 定时
        ModePageConfig.scheduleYear = scheduleYearInput.inputText;
        ModePageConfig.scheduleMonth = scheduleMonthInput.inputText;
        ModePageConfig.scheduleDay = scheduleDayInput.inputText;
        ModePageConfig.scheduleHour = scheduleHourInput.inputText;
        ModePageConfig.scheduleMinute = scheduleMinuteInput.inputText;

        // 保存配置
        ModePageConfig.saveAllConfig();
        console.log("✅ 所有参数已保存");
        globalPopUps.saveSuccessVisible = true;
    }

    // ====================== 【加载】页面打开自动执行 ======================
    function loadConfigToUI() {
        sampleModeBox.currentIndex = ModePageConfig.sampleModeIndex;

        fixedSampleVolInput.inputText = ModePageConfig.fixedSampleVol;
        fixedRetainBottleNumInput.inputText = ModePageConfig.fixedRetainBottleNum;
        fixedRetainVolInput.inputText = ModePageConfig.fixedRetainVol;

        timeRatioSampleVolInput.inputText = ModePageConfig.timeRatioSampleVol;
        timeRatioIntervalInput.inputText = ModePageConfig.timeRatioInterval;
        timeRatioSampleCountInput.inputText = ModePageConfig.timeRatioSampleCount;

        flowRatioSampleVolInput.inputText = ModePageConfig.flowRatioSampleVol;
        flowRatioSampleCountInput.inputText = ModePageConfig.flowRatioSampleCount;
        flowRatioTotalFlowInput.inputText = ModePageConfig.flowRatioTotalFlow;

        flowTrackSampleRatioInput.inputText = ModePageConfig.flowTrackSampleRatio;
        flowTrackIntervalInput.inputText = ModePageConfig.flowTrackInterval;
        flowTrackSampleCountInput.inputText = ModePageConfig.flowTrackSampleCount;

        extTriggerSampleVolInput.inputText = ModePageConfig.extTriggerSampleVol;
        extTriggerIntervalInput.inputText = ModePageConfig.extTriggerInterval;
        extTriggerSampleCountInput.inputText = ModePageConfig.extTriggerSampleCount;

        sampleSupplyModeBox.currentIndex = ModePageConfig.supplyModeIndex;
        supplyTimeInput.inputText = ModePageConfig.supplyTime;
        supplyLowerLimitInput.inputText = ModePageConfig.supplyLowerLimit;

        retainModeBox.currentIndex = ModePageConfig.retainModeIndex;
        retainModeRetainVolInput.inputText = ModePageConfig.retainModeRetainVol;
        parallelSampleInput.inputText = ModePageConfig.parallelSample;
        overWaitTimeInput.inputText = ModePageConfig.overWaitTime;

        scheduleYearInput.inputText = ModePageConfig.scheduleYear;
        scheduleMonthInput.inputText = ModePageConfig.scheduleMonth;
        scheduleDayInput.inputText = ModePageConfig.scheduleDay;
        scheduleHourInput.inputText = ModePageConfig.scheduleHour;
        scheduleMinuteInput.inputText = ModePageConfig.scheduleMinute;
    }

    // 页面打开 → 自动加载
    Component.onCompleted: {
        loadConfigToUI();
        console.log("✅ 配置已加载");
    }
    onVisibleChanged: {
        if(visible){
            loadConfigToUI();
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.topMargin: 10
        spacing: 10
        RowLayout {
            Layout.fillWidth: parent.width
            Layout.preferredHeight: parent.height * 1/3
            Layout.rightMargin: 10
            spacing: 10
            //采样模式
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 16
                border.color: "#0077FF"
                border.width: 3
                ColumnLayout {
                    id:tempColumnLayout
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    spacing: 18
                    LabelComboBox {
                        id: sampleModeBox
                        labelText: qsTr("采样模式:")
                        comboModel: ["定量", "时间等比", "流量等比", "流量跟踪", "外部触发"]
                        labelWidth: 110
                    }
                    //定量
                    LabelInputField {
                        id: fixedSampleVolInput
                        visible: sampleModeBox.currentIndex === 0
                        labelText: "采  样  量:"
                        unitText: "mL"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: fixedRetainBottleNumInput
                        visible: sampleModeBox.currentIndex === 0
                        labelText: "留样瓶号:"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: fixedRetainVolInput
                        visible: sampleModeBox.currentIndex === 0
                        labelText: "留  样  量:"
                        unitText: "mL/次"
                        labelWidth: 110
                    }
                    //时间等比
                    LabelInputField {
                        id: timeRatioSampleVolInput
                        visible: sampleModeBox.currentIndex === 1
                        labelText: "采  样  量:"
                        unitText: "mL/次"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: timeRatioIntervalInput
                        visible: sampleModeBox.currentIndex === 1
                        labelText: "间隔时间:"
                        unitText: "min"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: timeRatioSampleCountInput
                        visible: sampleModeBox.currentIndex === 1
                        labelText: "采样次数:"
                        labelWidth: 110
                    }
                    //流量等比
                    LabelInputField {
                        id: flowRatioSampleVolInput
                        visible: sampleModeBox.currentIndex === 2
                        labelText: "采  样  量:"
                        unitText: "mL/次"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: flowRatioSampleCountInput
                        visible: sampleModeBox.currentIndex === 2
                        labelText: "采样次数:"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: flowRatioTotalFlowInput
                        visible: sampleModeBox.currentIndex === 2
                        labelText: "累计流量:"
                        unitText: "m³/次"
                        labelWidth: 110
                    }
                    //流量跟踪
                    LabelInputField {
                        id: flowTrackSampleRatioInput
                        visible: sampleModeBox.currentIndex === 3
                        labelText: "采样比例:        1:"
                        labelWidth: 140
                        inputWidth: 110
                    }
                    LabelInputField {
                        id: flowTrackIntervalInput
                        visible: sampleModeBox.currentIndex === 3
                        labelText: "间隔时间:"
                        unitText: "min"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: flowTrackSampleCountInput
                        visible: sampleModeBox.currentIndex === 3
                        labelText: "采样次数:"
                        labelWidth: 110
                    }
                    //外部触发
                    LabelInputField {
                        id: extTriggerSampleVolInput
                        visible: sampleModeBox.currentIndex === 4
                        labelText: "采  样  量:"
                        unitText: "mL/次"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: extTriggerIntervalInput
                        visible: sampleModeBox.currentIndex === 4
                        labelText: "间隔时间:"
                        unitText: "min"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: extTriggerSampleCountInput
                        visible: sampleModeBox.currentIndex === 4
                        labelText: "采样次数:"
                        labelWidth: 110
                    }

                }
            }
            Rectangle {
                visible: sampleModeBox.currentIndex === 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            Rectangle {
                visible: sampleModeBox.currentIndex !== 0
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 16
                border.color: "#0077FF"
                border.width: 3
                ColumnLayout {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    spacing: 18
                    // 供样模式下拉框
                    LabelComboBox {
                        id: sampleSupplyModeBox
                        labelText: qsTr("供样模式:")
                        comboModel: ["立即供样", "整点供样", "外部触发"]
                        labelWidth: 110
                        // 监听选项变化
                        onCurrentIndexChanged: {
                            if (currentIndex === 1) {
                                console.log("整点供样被选中！")
                            }
                        }
                    }

                    LabelInputField {
                        id: supplyTimeInput
                        labelText: "供样时间:"
                        unitText: "min"
                        labelWidth: 110
                    }
                    LabelInputField {
                        id: supplyLowerLimitInput
                        labelText: "供样下限:"
                        unitText: "mL"
                        labelWidth: 110
                    }
                }
            }

        }
        // 留样模式
        RowLayout {
            visible: sampleModeBox.currentIndex !== 0
            Layout.fillWidth: parent.width
            Layout.preferredHeight: parent.height * 1/6
            Layout.rightMargin: 10
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 16
                border.color: "#0077FF"
                border.width: 3
                RowLayout{
                    anchors.fill: parent
                    spacing: 30
                    ColumnLayout {
                        Layout.preferredWidth: 400
                        Layout.fillHeight: parent
                        Layout.leftMargin: 20
                        spacing: 18
                        LabelComboBox {
                            id: retainModeBox
                            labelText: qsTr("留样模式:")
                            comboModel: ["同步留样", "超标留样"]
                            labelWidth: 110
                        }
                        LabelInputField {
                            id: retainModeRetainVolInput
                            labelText: "留  样  量:"
                            unitText: "mL/次"
                            labelWidth: 110
                        }
                    }

                    ColumnLayout {
                        Layout.preferredWidth: 400
                        Layout.fillHeight: parent
                        spacing: 18

                        LabelInputField {
                            id: parallelSampleInput
                            labelText: "平  行  样:"
                            unitText: "瓶"
                            labelWidth: 110
                        }
                        LabelInputField {
                            id: overWaitTimeInput
                            visible: retainModeBox.currentIndex === 1
                            labelText: "超标等待:"
                            unitText: "min"
                            labelWidth: 110
                        }
                        Item {
                            visible: retainModeBox.currentIndex !== 1
                            Layout.preferredHeight: 33
                        }
                    }
                }
            }
        }
        RowLayout {
            visible: sampleModeBox.currentIndex === 0
            Layout.fillWidth: parent.width
            Layout.preferredHeight: parent.height * 1/6
        }
        // 定时启动时间
        RowLayout {
            Label {
                text: qsTr("定时启动时间:")
                font.pixelSize: 22
                Layout.preferredWidth: 140
                color: "black"
            }
            InputFieldLabel {
                id: scheduleYearInput
                inputWidth: 120
                unitText: "年"
            }
            InputFieldLabel {
                id: scheduleMonthInput
                unitText: "月"
            }
            InputFieldLabel {
                id: scheduleDayInput
                unitText: "日"
            }
            InputFieldLabel {
                id: scheduleHourInput
                unitText: "时"
            }
            InputFieldLabel {
                id: scheduleMinuteInput
                unitText: "分"
            }
        }

        // 按钮区域
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 60
            Layout.topMargin: 10
            Layout.bottomMargin: 10

            Item { Layout.fillWidth: true }
            CustomButton {
                buttonText: "立即启动"
                onClicked: {
                    loadConfigToUI();
                    ApplicationConfig.startRun();
                }
            }
            CustomButton {
                buttonText: "定时启动"
                onClicked: {
                    loadConfigToUI();
                    ApplicationConfig.startSchedule();
                }
            }
            Item { Layout.fillWidth: true }
            CustomButton {
                Layout.rightMargin: 10
                buttonText: "保存"
                onClicked: saveAllToConfig()
            }
        }
    }
}
