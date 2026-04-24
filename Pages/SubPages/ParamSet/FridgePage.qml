import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.fridgepage.config 1.0

Page {
    id: fridgeParamPage
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }

    // ====================== 【保存】点击保存 ======================
    function saveAllToConfig() {
        FridgePageConfig.setTemp = setTempInput.inputText;
        FridgePageConfig.tempOverHighAlarm = tempOverHighAlarmInput.inputText;
        FridgePageConfig.tempOverLowAlarm = tempOverLowAlarmInput.inputText;
        FridgePageConfig.overLimitDelayAlarm = overLimitDelayAlarmInput.inputText;
        FridgePageConfig.defrostTime = defrostTimeInput.inputText;

        FridgePageConfig.saveAllConfig();
    }

    // ====================== 【加载】打开/切回页面自动恢复 ======================
    function loadConfigToUI() {
        setTempInput.inputText = FridgePageConfig.setTemp;
        tempOverHighAlarmInput.inputText = FridgePageConfig.tempOverHighAlarm;
        tempOverLowAlarmInput.inputText = FridgePageConfig.tempOverLowAlarm;
        overLimitDelayAlarmInput.inputText = FridgePageConfig.overLimitDelayAlarm;
        defrostTimeInput.inputText = FridgePageConfig.defrostTime;
    }

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
        anchors.leftMargin: 40
        anchors.topMargin: 20
        spacing: 20

        // 1. 设置温度
        LabelInputField {
            id: setTempInput
            labelText: qsTr("设置温度")
            unitText: qsTr("°C")
            labelWidth: 160
            inputWidth: 100
        }

        // 2. 温度超上限报警
        LabelInputField {
            id: tempOverHighAlarmInput
            labelText: qsTr("温度超上限报警")
            unitText: qsTr("°C")
            labelWidth: 160
            inputWidth: 100
        }

        // 3. 温度超下限报警
        LabelInputField {
            id: tempOverLowAlarmInput
            labelText: qsTr("温度超下限报警")
            unitText: qsTr("°C")
            labelWidth: 160
            inputWidth: 100
        }

        // 4. 超限延时报警时间
        LabelInputField {
            id: overLimitDelayAlarmInput
            labelText: qsTr("超限延时报警时间")
            unitText: qsTr("Min")
            labelWidth: 160
            inputWidth: 100
        }

        // 5. 除霜时间
        LabelInputField {
            id: defrostTimeInput
            labelText: qsTr("除霜时间")
            unitText: qsTr("Min")
            labelWidth: 160
            inputWidth: 100
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.alignment: Qt.AlignRight

            CustomButton {
                Layout.rightMargin: 40
                Layout.bottomMargin: 20
                buttonText: "保存"
            }
        }
    }
}
