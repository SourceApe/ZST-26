import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.communicationpage.config 1.0

Page {
    id: commSettingPage
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }

    // ====================== 保存 ======================
    function saveAllToConfig() {
        CommunicationPageConfig.rs485Addr = rs485AddrInput.inputText;
        CommunicationPageConfig.rs485BaudIndex = rs485BaudBox.currentIndex;
        CommunicationPageConfig.rs485ProtoIndex = rs485ProtoBox.currentIndex;

        CommunicationPageConfig.rs232BaudIndex = rs232BaudBox.currentIndex;
        CommunicationPageConfig.rs232ProtoIndex = rs232ProtoBox.currentIndex;

        CommunicationPageConfig.saveAllConfig();
        console.log("✅ 通讯参数已保存");
    }

    // ====================== 加载（切换页面自动恢复） ======================
    function loadConfigToUI() {
        rs485AddrInput.inputText = CommunicationPageConfig.rs485Addr;
        rs485BaudBox.currentIndex = CommunicationPageConfig.rs485BaudIndex;
        rs485ProtoBox.currentIndex = CommunicationPageConfig.rs485ProtoIndex;

        rs232BaudBox.currentIndex = CommunicationPageConfig.rs232BaudIndex;
        rs232ProtoBox.currentIndex = CommunicationPageConfig.rs232ProtoIndex;
    }

    Component.onCompleted: {
        loadConfigToUI();
        console.log("✅ 通讯配置已加载");
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
        spacing: 20

        Label {
            text: qsTr("RS485 通讯设置")
            font.pixelSize: 24
        }

        RowLayout {
            spacing: 20

            // 设备地址
            LabelInputField {
                id: rs485AddrInput
                labelText: qsTr("设备地址")
                labelWidth: 80
                inputWidth: 180
            }

            Item { Layout.fillWidth: true }
        }

        RowLayout {
            spacing: 20
            LabelComboBox {
                id: rs485BaudBox
                labelText: qsTr("波特率")
                comboModel: ["9600", "19200", "38400", "57600", "115200"]
                labelWidth: 80
                comboWidth: 180
            }
            LabelComboBox {
                id: rs485ProtoBox
                labelText: qsTr("协议选择")
                comboModel: ["Modbus-RTU", "自定义1", "自定义2"]
                labelWidth: 80
                comboWidth: 180
            }
        }

        Label {
            text: qsTr("RS232 通讯设置")
            font.pixelSize: 24
            Layout.topMargin: 10
        }

        RowLayout {
            spacing: 20
            LabelComboBox {
                id: rs232BaudBox
                labelText: qsTr("波特率")
                comboModel: ["9600", "19200", "38400", "57600", "115200"]
                labelWidth: 80
                comboWidth: 180
            }
            LabelComboBox {
                id: rs232ProtoBox
                labelText: qsTr("协议选择")
                comboModel: ["Modbus-RTU", "自定义1", "自定义2"]
                labelWidth: 80
                comboWidth: 180
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
