import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.pumpvalvepage.config 1.0

Page {
    id: sampleParamPage
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }

    property int currentPage: 0

    // ====================== 只保存 第一页 ======================
    function savePage1ToConfig() {
        PumpValvePageConfig.sampleCleanTimes = cleanTimesInput.inputText;
        PumpValvePageConfig.sampleCleanVol = cleanVolInput.inputText;
        PumpValvePageConfig.sampleStirTime = stirTimeInput.inputText;
        PumpValvePageConfig.sampleEmptyTime = emptyTimeInput.inputText;
        PumpValvePageConfig.samplePipeEmptyTime = pipeEmptyInput.inputText;
        PumpValvePageConfig.sampleTimeout = sampleTimeoutInput.inputText;
        PumpValvePageConfig.extPumpPreTime = extPumpInput.inputText;

        PumpValvePageConfig.retainTimeout = retainTimeoutInput.inputText;
        PumpValvePageConfig.retainPipeEmptyTime = retainPipeEmptyInput.inputText;
        PumpValvePageConfig.tableRotateTimeout = tableRotateInput.inputText;

        PumpValvePageConfig.calibYear = yearInput.inputText;
        PumpValvePageConfig.calibMonth = monthInput.inputText;
        PumpValvePageConfig.calibDay = dayInput.inputText;
        PumpValvePageConfig.calibHour = hourInput.inputText;
        PumpValvePageConfig.calibMinute = minuteInput.inputText;
        PumpValvePageConfig.calibSecond = secondInput.inputText;

        PumpValvePageConfig.saveAllConfig();
        console.log("✅ 第1页参数已保存");
    }

    // ====================== 只保存 第二页 ======================
    function savePage2ToConfig() {
        PumpValvePageConfig.samplePumpSpeed = samplePumpInput.inputText;
        PumpValvePageConfig.retainPumpSpeed = retainPumpInput.inputText;
        PumpValvePageConfig.sampleBottleVol = sampleBottleVolInput.inputText;
        PumpValvePageConfig.retainBottleVol = retainBottleVolInput.inputText;
        PumpValvePageConfig.retainBottleCount = retainBottleCountInput.inputText;
        PumpValvePageConfig.flowMeterRange = flowRangeInput.inputText;
        PumpValvePageConfig.pulseFlowMeter = pulseFlowInput.inputText;

        PumpValvePageConfig.saveAllConfig();
        console.log("✅ 第2页参数已保存");
    }

    // ====================== 加载配置（不变） ======================
    function loadConfigToUI() {
        cleanTimesInput.inputText = PumpValvePageConfig.sampleCleanTimes;
        cleanVolInput.inputText = PumpValvePageConfig.sampleCleanVol;
        stirTimeInput.inputText = PumpValvePageConfig.sampleStirTime;
        emptyTimeInput.inputText = PumpValvePageConfig.sampleEmptyTime;
        pipeEmptyInput.inputText = PumpValvePageConfig.samplePipeEmptyTime;
        sampleTimeoutInput.inputText = PumpValvePageConfig.sampleTimeout;
        extPumpInput.inputText = PumpValvePageConfig.extPumpPreTime;

        retainTimeoutInput.inputText = PumpValvePageConfig.retainTimeout;
        retainPipeEmptyInput.inputText = PumpValvePageConfig.retainPipeEmptyTime;
        tableRotateInput.inputText = PumpValvePageConfig.tableRotateTimeout;

        yearInput.inputText = PumpValvePageConfig.calibYear;
        monthInput.inputText = PumpValvePageConfig.calibMonth;
        dayInput.inputText = PumpValvePageConfig.calibDay;
        hourInput.inputText = PumpValvePageConfig.calibHour;
        minuteInput.inputText = PumpValvePageConfig.calibMinute;
        secondInput.inputText = PumpValvePageConfig.calibSecond;

        samplePumpInput.inputText = PumpValvePageConfig.samplePumpSpeed;
        retainPumpInput.inputText = PumpValvePageConfig.retainPumpSpeed;
        sampleBottleVolInput.inputText = PumpValvePageConfig.sampleBottleVol;
        retainBottleVolInput.inputText = PumpValvePageConfig.retainBottleVol;
        retainBottleCountInput.inputText = PumpValvePageConfig.retainBottleCount;
        flowRangeInput.inputText = PumpValvePageConfig.flowMeterRange;
        pulseFlowInput.inputText = PumpValvePageConfig.pulseFlowMeter;
    }

    Component.onCompleted: {
        loadConfigToUI();
        console.log("✅ 泵阀参数加载完成");
    }
    onVisibleChanged: {
        if(visible) loadConfigToUI();
    }

    StackLayout {
        anchors.fill: parent
        anchors.topMargin: 20
        anchors.leftMargin: 40
        currentIndex: currentPage

        // ====================== 第一页 ======================
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 10

            Label {
                text: "采样参数"
                font.pixelSize: 24
                color: "#0077FF"
            }
            RowLayout {
                spacing: 40
                LabelInputField { id: cleanTimesInput; labelText: "采样桶清洗次数:"; labelWidth: 190 }
                LabelInputField { id: cleanVolInput; Layout.leftMargin: 15; labelText: "采样桶清洗体积:"; unitText: "mL"; labelWidth: 170 }
            }
            RowLayout {
                spacing: 40
                LabelInputField { id: stirTimeInput; labelText: "采样搅拌时间:"; unitText: "s"; labelWidth: 190 }
                LabelInputField { id: emptyTimeInput; labelText: "采样桶排空时间:"; unitText: "s"; labelWidth: 170 }
            }
            RowLayout {
                spacing: 40
                LabelInputField { id: pipeEmptyInput; labelText: "采样管路排空时间:"; unitText: "s"; labelWidth: 190 }
                LabelInputField { id: sampleTimeoutInput; labelText: "采样超时时间:"; unitText: "s"; labelWidth: 170 }
            }
            RowLayout {
                spacing: 40
                LabelInputField { id: extPumpInput; labelText: "外接泵提前开始时间:"; unitText: "s"; labelWidth: 190 }
                Item { Layout.fillWidth: true }
            }

            Label {
                text: "留样参数"
                font.pixelSize: 24
                color: "#0077FF"
                Layout.topMargin: 10
            }
            RowLayout {
                spacing: 40
                LabelInputField { id: retainTimeoutInput; labelText: "留样超时时间:"; unitText: "s"; labelWidth: 190 }
                LabelInputField { id: retainPipeEmptyInput; labelText: "留样管路排空时间:"; unitText: "s"; labelWidth: 170 }
            }
            RowLayout {
                spacing: 40
                LabelInputField { id: tableRotateInput; labelText: "转盘转动超时时间:"; unitText: "s"; labelWidth: 190 }
                Item { Layout.fillWidth: true }
            }

            Item { Layout.fillHeight: true }

            RowLayout {
                Layout.topMargin: 10
                spacing: 8
                Text { text: qsTr("时间校准:"); font.pointSize: 15 }
                LabelInputField { id: yearInput; unitText: "年"; inputWidth:85; }
                LabelInputField { id: monthInput; unitText: "月"; inputWidth:55; }
                LabelInputField { id: dayInput; unitText: "日"; inputWidth:55; }
                LabelInputField { id: hourInput; unitText: "时"; inputWidth:55; }
                LabelInputField { id: minuteInput; unitText: "分"; inputWidth:55; }
                LabelInputField { id: secondInput; unitText: "秒"; inputWidth:55; }
                Item { Layout.fillWidth: true }
                CustomButton {
                    Layout.rightMargin: 20
                    buttonText: "校准"
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.bottomMargin: 10
                Item {Layout.fillWidth: true }
                CustomButton {
                    buttonText: "下一页"
                    onClicked: currentPage = 1
                }
                Item {Layout.fillWidth: true }
                CustomButton {
                    Layout.rightMargin: 20
                    buttonText: "保存"
                    onClicked: savePage1ToConfig()  // 👈 只保存第一页
                }
            }
        }

        // ====================== 第二页 ======================
        ColumnLayout {
            Layout.preferredWidth: parent.width
            Layout.fillWidth: true
            Layout.fillHeight: true
            width: parent.width
            spacing: 10

            LabelInputField { id: samplePumpInput; labelText: "采样泵转速:"; unitText:"PSC/S"; labelWidth: 110; }
            LabelInputField { id: retainPumpInput; labelText: "留样泵转速:"; unitText:"PSC/S"; labelWidth: 110; }
            LabelInputField { id: sampleBottleVolInput; labelText: "采样桶容积:"; unitText:"mL"; labelWidth: 110; }
            LabelInputField { id: retainBottleVolInput; labelText: "留样瓶容积:"; unitText:"mL"; labelWidth: 110; }
            LabelInputField { id: retainBottleCountInput; labelText: "留样瓶瓶数:";  labelWidth: 110; }

            Label {
                text: "流量计选择:"
                font.pixelSize: 22
                Layout.topMargin: 20
            }

            LabelInputField { id: flowRangeInput; labelText: "4-20mA流量计 量程:  0-"; unitText:"吨/小时"; labelWidth:210 }
            LabelInputField { id: pulseFlowInput; labelText: "脉冲流量计"; unitText:"吨/次";  labelWidth: 110 }

            Item { Layout.fillHeight: true }

            RowLayout {
                Layout.bottomMargin: 10
                Item { Layout.fillWidth: true }
                CustomButton {
                    buttonText: "上一页"
                    onClicked: currentPage = 0
                }
                Item { Layout.fillWidth: true }
                CustomButton {
                    Layout.rightMargin: 20
                    buttonText: "保存"
                    onClicked: savePage2ToConfig()  // 👈 只保存第二页
                }
            }
        }
    }
}
