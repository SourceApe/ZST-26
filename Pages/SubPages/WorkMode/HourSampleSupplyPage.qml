import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"
import com.hoursamplesupplypage.config 1.0

// 整点供样多选页面（用 Page 替代 Dialog）
Page {
    id: hourSelectPage
    width: parent.width
    height: parent.height

    // 页面内部变量
    property var selectedHours: []
    property int advanceMinutes: 0

    property var hourList: [
        1,  2,  3,  4,  5,  6,
        7,  8,  9,  10, 11, 12,
        13, 14, 15, 16, 17, 18,
        19, 20, 21, 22, 23, 24
    ]

    Component.onCompleted: {
        selectedHours = HourSampleSupplyPageConfig.selectedHours
        advanceMinutes = HourSampleSupplyPageConfig.advanceMinutes
    }
    onVisibleChanged: {
        if(visible){
            selectedHours = HourSampleSupplyPageConfig.selectedHours
            advanceInput.inputText = HourSampleSupplyPageConfig.advanceMinutes
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // 4行6列 小时选择区
        GridLayout {
            Layout.fillWidth: parent.width
            Layout.preferredHeight: 400
            Layout.alignment: Qt.AlignHCenter
            rows: 4
            columns: 6
            rowSpacing: 15
            columnSpacing: 15

            Repeater {
                model: hourList
                Button {
                    text: modelData + "点"
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 70
                    font.pixelSize: 24

                    // 选中样式
                    background: Rectangle {
                        color: selectedHours.indexOf(modelData) !== -1 ? "#2196F3" : "white"
                        border.color: "#2196F3"
                        border.width: 1
                        radius: 4
                    }

                    onClicked: {
                        var idx = selectedHours.indexOf(modelData)
                        var newArr = selectedHours.slice()

                        if (idx !== -1) {
                            newArr.splice(idx, 1)
                        } else {
                            newArr.push(modelData)
                        }

                        selectedHours = newArr
                        mainWindow.beep()
                    }
                }
            }
        }

        RowLayout {
            Layout.preferredHeight: 200
            Layout.leftMargin: 80
            spacing: 10

            LabelInputField {
                id: advanceInput
                fontSize: 24
                labelText: "提前供样时间:"
                unitText: "min"
                labelWidth: 160
                inputWidth: 200
                inputHeight: 40
            }

            CustomButton {
                buttonText: "保存"
                fontSize: 24
                Layout.leftMargin: 90
                Layout.preferredWidth: 150
                Layout.preferredHeight: 50

                onClicked: {
                    HourSampleSupplyPageConfig.selectedHours = selectedHours
                    HourSampleSupplyPageConfig.advanceMinutes = advanceInput.inputText

                    HourSampleSupplyPageConfig.saveAllConfig()
                    console.log("✅ 整点供样已保存：", HourSampleSupplyPageConfig.selectedHours, HourSampleSupplyPageConfig.advanceMinutes)
                }
            }
        }
    }
}
