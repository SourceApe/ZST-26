import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.chemicaladdpage.config 1.0

Page {
    id: root
    width: parent.width
    height: parent.height
    background: Rectangle { color: "white" }

    // ✅ 用数组缓存所有控件，彻底绕开ID问题
    property var channelBoxes: []
    property var ratioInputs: []

    onVisibleChanged: {
        if (visible) {
            syncFromConfigToUI();
        }
    }

    function syncFromConfigToUI() {
        let ch = ChemicalAddPageConfig.channelList
        let ra = ChemicalAddPageConfig.ratioList

        // ✅ 直接给缓存的控件赋值，100%刷新，零卡顿
        for(let i=0; i<24; i++){
            if(channelBoxes[i]) channelBoxes[i].currentIndex = ch[i] || 0
            if(ratioInputs[i]) ratioInputs[i].inputText = ra[i] || "1000"
        }

        topCh1.currentIndex = ChemicalAddPageConfig.globalChannel1
        topCh2.currentIndex = ChemicalAddPageConfig.globalChannel2
        topCh3.currentIndex = ChemicalAddPageConfig.globalChannel3
        topCh4.currentIndex = ChemicalAddPageConfig.globalChannel4
    }

    function saveAllToConfig() {
        var chList = []
        var raList = []
        for(var i=0; i<24; i++){
            chList.push(channelBoxes[i] ? channelBoxes[i].currentIndex : 0)
            raList.push(ratioInputs[i] ? ratioInputs[i].inputText : "1000")
        }

        ChemicalAddPageConfig.channelList = chList
        ChemicalAddPageConfig.ratioList = raList
        ChemicalAddPageConfig.globalChannel1 = topCh1.currentIndex
        ChemicalAddPageConfig.globalChannel2 = topCh2.currentIndex
        ChemicalAddPageConfig.globalChannel3 = topCh3.currentIndex
        ChemicalAddPageConfig.globalChannel4 = topCh4.currentIndex
        ChemicalAddPageConfig.saveAllConfig()
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.topMargin: 10
        spacing: 10

        RowLayout {
            spacing: 10
            LabelComboBox { id: topCh1; labelText: qsTr("加药通道1"); comboModel: ["硫酸","盐酸","硝酸","氢氧化钠"]; fontSize:17; labelWidth:75; comboWidth:120; comboHeight:30 }
            LabelComboBox { id: topCh2; labelText: qsTr("加药通道2"); comboModel: ["硫酸","盐酸","硝酸","氢氧化钠"]; fontSize:17; labelWidth:75; comboWidth:120; comboHeight:30 }
            LabelComboBox { id: topCh3; labelText: qsTr("加药通道3"); comboModel: ["硫酸","盐酸","硝酸","氢氧化钠"]; fontSize:17; labelWidth:75; comboWidth:120; comboHeight:30 }
            LabelComboBox { id: topCh4; labelText: qsTr("加药通道4"); comboModel: ["硫酸","盐酸","硝酸","氢氧化钠"]; fontSize:17; labelWidth:75; comboWidth:120; comboHeight:30 }
        }

        RowLayout {
            spacing: 30
            Text { text: qsTr("留样瓶号"); font.pixelSize:18 }
            Text { text: qsTr("加药通道"); font.pixelSize:18 }
            Text { text: qsTr("加药比例"); font.pixelSize:18; Layout.leftMargin:14 }
            Text { text: qsTr("留样瓶号"); font.pixelSize:18; Layout.leftMargin:25 }
            Text { text: qsTr("加药通道"); font.pixelSize:18 }
            Text { text: qsTr("加药比例"); font.pixelSize:18; Layout.leftMargin:14 }
        }

        RowLayout {
            Layout.fillWidth:true; Layout.fillHeight:true

            // 左侧 1~12 号瓶
            ColumnLayout {
                spacing:5
                Repeater {
                    model: 12
                    delegate: RowLayout {
                        spacing:5
                        property int idx: index
                        LabelComboBox {
                            Layout.leftMargin:30; fontSize:18
                            labelText: idx + 1
                            comboModel: ["不加药","通道1","通道2","通道3", "通道4"]
                            comboWidth:105; comboHeight:28
                            // ✅ 组件创建时，自动加入数组缓存
                            Component.onCompleted: {
                                root.channelBoxes[idx] = this
                            }
                        }
                        LabelInputField {
                            labelText:"1:"; fontSize:18; labelWidth:15; inputWidth:80; inputHeight:28
                            // ✅ 组件创建时，自动加入数组缓存
                            Component.onCompleted: {
                                root.ratioInputs[idx] = this
                            }
                        }
                    }
                }
            }

            // 右侧 13~24 号瓶
            ColumnLayout {
                Layout.leftMargin: 45
                spacing:5
                Repeater {
                    model: 12
                    delegate: RowLayout {
                        spacing:5
                        property int idx: 12 + index
                        LabelComboBox {
                            Layout.leftMargin:26; fontSize:18
                            labelText: idx + 1
                            comboModel: ["不加药","通道1","通道2","通道3", "通道4"]
                            labelWidth:55; comboWidth:105; comboHeight:28
                            // ✅ 组件创建时，自动加入数组缓存
                            Component.onCompleted: {
                                root.channelBoxes[idx] = this
                            }
                        }
                        LabelInputField {
                            labelText:"1:"; fontSize:18; labelWidth:15; inputWidth:80; inputHeight:28
                            // ✅ 组件创建时，自动加入数组缓存
                            Component.onCompleted: {
                                root.ratioInputs[idx] = this
                            }
                        }
                    }
                }
            }
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Item { Layout.fillHeight: true }
                RowLayout {
                    Layout.fillWidth: true
                    Item { Layout.fillWidth: true }
                    CustomButton {
                        Layout.rightMargin: 40
                        Layout.bottomMargin: 10
                        buttonText: qsTr("保存");
                        onClicked: saveAllToConfig()
                    }
                }
            }

        }
        Item { Layout.fillHeight: true }
    }
}
