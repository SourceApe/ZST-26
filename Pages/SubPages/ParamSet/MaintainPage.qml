import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.maintainpage.config 1.0

Page {
    id: curingAgentPage
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }

    // ====================== 保存 ======================
    function saveAllToConfig() {
        MaintainPageConfig.ch1Total = ch1TotalInput.inputText;
        MaintainPageConfig.ch1AlarmLeft = ch1AlarmLeftInput.inputText;
        MaintainPageConfig.ch1Expire = ch1ExpireInput.inputText;

        MaintainPageConfig.ch2Total = ch2TotalInput.inputText;
        MaintainPageConfig.ch2AlarmLeft = ch2AlarmLeftInput.inputText;
        MaintainPageConfig.ch2Expire = ch2ExpireInput.inputText;

        MaintainPageConfig.ch3Total = ch3TotalInput.inputText;
        MaintainPageConfig.ch3AlarmLeft = ch3AlarmLeftInput.inputText;
        MaintainPageConfig.ch3Expire = ch3ExpireInput.inputText;

        MaintainPageConfig.samplePumpLife = samplePumpLifeInput.inputText;
        MaintainPageConfig.retainPumpLife = retainPumpLifeInput.inputText;

        MaintainPageConfig.saveAllConfig();
    }

    // ====================== 加载（切页自动恢复） ======================
    function loadConfigToUI() {
        ch1TotalInput.inputText = MaintainPageConfig.ch1Total;
        ch1AlarmLeftInput.inputText = MaintainPageConfig.ch1AlarmLeft;
        ch1ExpireInput.inputText = MaintainPageConfig.ch1Expire;

        ch2TotalInput.inputText = MaintainPageConfig.ch2Total;
        ch2AlarmLeftInput.inputText = MaintainPageConfig.ch2AlarmLeft;
        ch2ExpireInput.inputText = MaintainPageConfig.ch2Expire;

        ch3TotalInput.inputText = MaintainPageConfig.ch3Total;
        ch3AlarmLeftInput.inputText = MaintainPageConfig.ch3AlarmLeft;
        ch3ExpireInput.inputText = MaintainPageConfig.ch3Expire;

        samplePumpLifeInput.inputText = MaintainPageConfig.samplePumpLife;
        retainPumpLifeInput.inputText = MaintainPageConfig.retainPumpLife;
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
        anchors.leftMargin: 30
        anchors.topMargin: 20
        spacing: 10

        Label {
            text: qsTr("通道1固化剂:")
            font.pixelSize: 24
        }
        RowLayout {
            spacing: 60
            LabelInputField {
                id: ch1TotalInput
                labelText: qsTr("总量:")
                unitText: qsTr("mL")
                labelWidth: 50
                inputWidth: 120
            }
            LabelInputField {
                id: ch1AlarmLeftInput
                labelText: qsTr("报警剩余量:")
                unitText: qsTr("mL")
                labelWidth: 110
                inputWidth: 120
            }
            LabelInputField {
                id: ch1ExpireInput
                labelText: qsTr("保质期:")
                unitText: qsTr("天")
                labelWidth: 70
                inputWidth: 120
            }
        }

        Label {
            Layout.topMargin: 10
            text: qsTr("通道2固化剂:")
            font.pixelSize: 24
        }
        RowLayout {
            spacing: 60
            LabelInputField {
                id: ch2TotalInput
                labelText: qsTr("总量:")
                unitText: qsTr("mL")
                labelWidth: 50
                inputWidth: 120
            }
            LabelInputField {
                id: ch2AlarmLeftInput
                labelText: qsTr("报警剩余量:")
                unitText: qsTr("mL")
                labelWidth: 110
                inputWidth: 120
            }
            LabelInputField {
                id: ch2ExpireInput
                labelText: qsTr("保质期:")
                unitText: qsTr("天")
                labelWidth: 70
                inputWidth: 120
            }
        }

        Label {
            Layout.topMargin: 10
            text: qsTr("通道3固化剂:")
            font.pixelSize: 24
        }
        RowLayout {
            spacing: 60
            LabelInputField {
                id: ch3TotalInput
                labelText: qsTr("总量:")
                unitText: qsTr("mL")
                labelWidth: 50
                inputWidth: 120
            }
            LabelInputField {
                id: ch3AlarmLeftInput
                labelText: qsTr("报警剩余量:")
                unitText: qsTr("mL")
                labelWidth: 110
                inputWidth: 120
            }
            LabelInputField {
                id: ch3ExpireInput
                labelText: qsTr("保质期:")
                unitText: qsTr("天")
                labelWidth: 70
                inputWidth: 120
            }
        }

        ColumnLayout {
            spacing: 15
            Layout.topMargin: 10
            LabelInputField {
                id: samplePumpLifeInput
                labelText: qsTr("采样泵泵管寿命:")
                unitText: qsTr("天")
                labelWidth: 150
                inputWidth: 120
            }
            LabelInputField {
                id: retainPumpLifeInput
                labelText: qsTr("留样泵泵管寿命:")
                unitText: qsTr("天")
                labelWidth: 150
                inputWidth: 120
            }
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.alignment: Qt.AlignRight
            CustomButton {
                Layout.rightMargin: 40
                Layout.bottomMargin: 20
                buttonText: "保存"
                onClicked: saveAllToConfig()
            }
        }
    }
}
