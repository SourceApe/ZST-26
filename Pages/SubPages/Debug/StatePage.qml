import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../../Components"

Page {
    id: root
    title: qsTr("设备状态")

    ColumnLayout {
        anchors.fill: parent
        // 第1行：3个状态
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter

            StatusItem {
                statusName: "转盘原点"
                isActive: true  // 示例：当前激活
            }
            StatusItem {
                statusName: "采样液位"
                isActive: false
            }
            StatusItem {
                statusName: "升降杆上限位"
                isActive: true
            }
        }

        // 第2行：3个状态
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter

            StatusItem {
                statusName: "转盘选瓶"
                isActive: false
            }
            StatusItem {
                statusName: "留样液位"
                isActive: true
            }
            StatusItem {
                statusName: "升降杆下限位"
                isActive: false
            }
        }
    }
}
