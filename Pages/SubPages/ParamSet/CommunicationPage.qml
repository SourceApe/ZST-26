import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.communicationpage.config 1.0

Page {
    id: root
    width: parent.width
    height: parent.height
    background: Rectangle { color: "#f5f5f5" }

    property var baudBoxes: []
    property var modeBoxes: []
    property var masterSlaveBoxes: []
    property var addressInputs: []

    // 统一刷新所有已创建控件（切换页面用）
    function refreshAllItems() {
        CommunicationPageConfig.loadAllConfig();
        let cfg = CommunicationPageConfig.comConfig;

        for (let i = 0; i < 6; i++) {
            let item = cfg[i];
            if (baudBoxes[i]) {
                let idx = baudBoxes[i].comboModel.indexOf(item.baud);
                if (idx >= 0) baudBoxes[i].currentIndex = idx;
            }
            if (modeBoxes[i]) {
                modeBoxes[i].currentIndex = item.modeIndex;
            }
            if (masterSlaveBoxes[i]) {
                masterSlaveBoxes[i].currentIndex = item.masterSlaveIndex;
            }
            if (addressInputs[i]) {
                addressInputs[i].text = item.address;
            }
        }
    }

    // 单条配置获取（给刚创建的控件用）
    function getComItem(index) {
        let cfg = CommunicationPageConfig.comConfig;
        return cfg[index] || { baud: "9600", modeIndex:0, masterSlaveIndex:0, address:"1" };
    }

    // ====================== 页面生命周期 ======================
    Component.onCompleted: {
        refreshAllItems();
    }

    onVisibleChanged: {
        if (visible) {
            refreshAllItems(); // 切换页面 → 恢复数据
        }
    }

    // ====================== 保存 ======================
    function saveAllToConfig() {
        var newConfig = []
        for (var i = 0; i < 6; i++) {
            newConfig.push({
                baud: baudBoxes[i] ? baudBoxes[i].comboModel[baudBoxes[i].currentIndex] : "9600",

                modeIndex: modeBoxes[i] ? modeBoxes[i].currentIndex : 0,
                masterSlaveIndex: masterSlaveBoxes[i] ? masterSlaveBoxes[i].currentIndex : 0,
                address: addressInputs[i] ? addressInputs[i].text : "1"
            })
        }
        CommunicationPageConfig.comConfig = newConfig
        CommunicationPageConfig.saveAllConfig()
        globalPopUps.saveSuccessVisible = true
    }

    // ====================== 布局 ======================
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 12

        Item {
            Layout.fillWidth: true
            height: 50
            Text {
                text: "通讯设置"
                font.pixelSize: 26
                anchors.centerIn: parent
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 12

            model: 6
            delegate: Rectangle {
                width: parent.width
                height: 110
                color: "white"
                radius: 6
                property int idx: index

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 8

                    Text { text: "串口 " + (idx + 1); font.pixelSize: 18 }

                    Row { spacing: 8; width: parent.width

                        // 波特率
                        LabelComboBox {
                            labelText: "波特率:"
                            comboModel: ["1200","2400","4800","9600","19200","38400","57600","115200"]
                            labelWidth: 60; comboWidth:115; fontSize:18
                            Component.onCompleted: {
                                root.baudBoxes[idx] = this
                                let item = root.getComItem(idx)
                                let index = comboModel.indexOf(item.baud)
                                if(index >=0) currentIndex = index
                            }
                        }

                        // 通讯模式
                        LabelComboBox {
                            id: modeBox
                            labelText: "通讯模式:"
                            comboModel: ["普通串口","Modbus"]
                            labelWidth:80; comboWidth:125; fontSize:18
                            Component.onCompleted: {
                                root.modeBoxes[idx] = this
                                currentIndex = root.getComItem(idx).modeIndex
                            }
                        }

                        // 主机/从机
                        LabelComboBox {
                            enabled: modeBox.currentIndex === 1
                            comboModel: ["主机","从机"]
                            comboWidth:100; fontSize:18
                            Component.onCompleted: {
                                root.masterSlaveBoxes[idx] = this
                                currentIndex = root.getComItem(idx).masterSlaveIndex
                            }
                        }

                        // 地址
                        TextField {
                            id: slaveAddressTextField
                            enabled: modeBox.currentIndex === 1
                            placeholderText: "地址"
                            width: 80; height: 35
                            Component.onCompleted: {
                                root.addressInputs[idx] = this
                                text = root.getComItem(idx).address
                            }
                            MouseArea {
                                anchors.fill: parent
                                onPressed: mainWindow.beep()
                                onClicked: mainWindow.showNumKeyboard(slaveAddressTextField)
                            }
                        }
                    }
                }
            }
        }

        CustomButton {
            buttonText: "保存"
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin:10; Layout.bottomMargin:10
            onClicked: saveAllToConfig()
        }
    }
}
