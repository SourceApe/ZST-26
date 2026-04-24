import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "."
import com.mainpage.config 1.0

Item {
    id: popUpsRoot
    anchors.fill: parent
    z: 999
    visible: true

    property alias loginVisible: globalLoginDialog.visible
    property alias warningVisible: warningDialog.visible
    property alias saveSuccessVisible: saveSuccessDialog.visible
    property alias timeSetVisible: timeSetDialog.visible   // 新增！时间弹窗

    signal loginSuccess()
    signal warningClosed()
    signal saveSuccessClosed()
    signal timeSetClosed()                                 // 新增！关闭信号

    // ==========================================================================
    // 登录弹窗
    // ==========================================================================
    Item {
        id: globalLoginDialog
        anchors.fill: parent
        visible: false
        onVisibleChanged: pwdInput.text = ""

        // 很浅的半透明黑（无动画）
        Rectangle {
            anchors.fill: parent
            color: "#55000000"
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            preventStealing: true
        }

        Rectangle {
            width: 420
            height: 260
            anchors.centerIn: parent
            color: "#ffffff"
            radius: 12
            border.color: "#0077FF"
            border.width: 2

            scale: visible ? 1 : 0.8
            Behavior on scale {
                NumberAnimation { duration: 220; easing.type: Easing.OutQuad }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "用户登录"
                    font.pixelSize: 28
                    color: "#0077FF"
                }

                RowLayout {
                    Layout.topMargin: 30
                    Layout.alignment: Qt.AlignHCenter
                    Text { text: "密 码:"; font.pixelSize: 26 }
                    TextField {
                        id: pwdInput
                        width: 240
                        height: 50
                        font.pixelSize: 26
                        echoMode: TextInput.Password
                        MouseArea {
                            anchors.fill: parent
                            onPressed: mainWindow.beep()
                            onClicked: mainWindow.showNumKeyboard(pwdInput)
                        }
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 60
                    CustomButton {
                        buttonText: "取消"
                        buttonWidth: 120
                        buttonHeight: 50
                        fontSize: 26
                        onClicked: globalLoginDialog.visible = false
                    }
                    CustomButton {
                        buttonText: "登录"
                        buttonWidth: 120
                        buttonHeight: 50
                        fontSize: 26
                        onClicked: {
                            if (MainPageConfig.checkOperatorPwd(pwdInput.text)) {
                                MainPageConfig.userLevel = 1
                                MainPageConfig.userName = "操作员"
                            } else if (MainPageConfig.checkAdminPwd(pwdInput.text)) {
                                MainPageConfig.userLevel = 2
                                MainPageConfig.userName = "管理员"
                            } else {
                                MainPageConfig.userLevel = 0
                                MainPageConfig.userName = "访客"
                            }
                            globalLoginDialog.visible = false
                            loginSuccess()
                        }
                    }
                }
            }
        }
    }

    // ==========================================================================
    // 权限不足
    // ==========================================================================
    Item {
        id: warningDialog
        anchors.fill: parent
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#22000000"
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            preventStealing: true
        }

        Rectangle {
            width: 420
            height: 260
            anchors.centerIn: parent
            color: "white"
            radius: 12
            border.color: "#0077FF"
            border.width: 2

            scale: visible ? 1 : 0.8
            Behavior on scale {
                NumberAnimation { duration: 220; easing.type: Easing.OutQuad }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "⚠ 权限不足"
                    font.pixelSize: 28
                    color: "#ff2222"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "无权限访问此功能，请重新登录"
                    font.pixelSize: 22
                    color: "#555555"
                }
                Item { Layout.fillHeight: true }
                CustomButton {
                    Layout.alignment: Qt.AlignHCenter
                    buttonText: "确定"
                    buttonWidth: 110
                    buttonHeight: 45
                    fontSize: 22
                    onClicked: {
                        warningDialog.visible = false
                        warningClosed()
                    }
                }
            }
        }
    }

    // ==========================================================================
    // 保存成功
    // ==========================================================================
    Item {
        id: saveSuccessDialog
        anchors.fill: parent
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#22000000"
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            preventStealing: true
        }

        Rectangle {
            width: 400
            height: 240
            anchors.centerIn: parent
            color: "white"
            radius: 12
            border.color: "#009955"
            border.width: 2

            scale: visible ? 1 : 0.8
            Behavior on scale {
                NumberAnimation { duration: 220; easing.type: Easing.OutQuad }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "\u2713 保存成功"
                    font.pixelSize: 28
                    color: "#009955"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "参数已成功保存"
                    font.pixelSize: 22
                    color: "#555555"
                }
                Item { Layout.fillHeight: true }
                CustomButton {
                    Layout.alignment: Qt.AlignHCenter
                    buttonText: "确定"
                    buttonWidth: 110
                    buttonHeight: 45
                    fontSize: 22
                    onClicked: {
                        saveSuccessDialog.visible = false
                        saveSuccessClosed()
                    }
                }
            }
        }
    }

    // ==========================================================================
    // 系统时间设置弹窗
    // ==========================================================================
    Item {
        id: timeSetDialog
        anchors.fill: parent
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#33000000"
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            preventStealing: true
        }

        Rectangle {
            id: dialogRoot
            width: 900
            height: 520
            anchors.centerIn: parent
            color: "white"
            radius: 12
            border.color: "#0077FF"
            border.width: 2

            scale: visible ? 1 : 0.99
            Behavior on scale { NumberAnimation { duration: 220; easing.type: Easing.OutQuad } }

            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 20
                anchors.leftMargin: 40
                anchors.bottomMargin: 20
                anchors.rightMargin: 40

                // ==================== 标题 ====================
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "系统时间设置"
                    font.pixelSize: 25
                    color: "#0077FF"
                }

                RowLayout{
                    Layout.fillWidth: true
                    Layout.topMargin: 20

                    // 左侧日历区域
                    ColumnLayout {
                        // 固定宽度，不再依赖 calendarGrid
                        Layout.preferredWidth: 460

                        // ==================== 年份月份选择 ====================
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            // === 左箭头：上一年 ===
                            CustomButton {
                                buttonText: "<"
                                buttonWidth: 40; buttonHeight: 36; fontSize: 18
                                onClicked: {
                                    dialogRoot.curYear--
                                    dialogRoot.updateCalendar()
                                }
                            }

                            // === 显示当前年份 ===
                            Text {
                                text: dialogRoot.curYear + " 年"
                                font.pixelSize: 22
                                color: "#333"
                                width: 120
                                horizontalAlignment: Text.AlignHCenter
                            }

                            // === 右箭头：下一年 ===
                            CustomButton {
                                buttonText: ">"
                                buttonWidth: 40; buttonHeight: 36; fontSize: 18
                                onClicked: {
                                    dialogRoot.curYear++
                                    dialogRoot.updateCalendar()
                                }
                            }

                            // === 月份选择下拉框（1-12月） ===
                            ComboBox {
                                id: monthCombo
                                Layout.leftMargin: 140
                                width: 120
                                height: 36
                                font.pixelSize: 20
                                model: [
                                    "1月", "2月", "3月", "4月",
                                    "5月", "6月", "7月", "8月",
                                    "9月", "10月", "11月", "12月"
                                ]
                                onCurrentIndexChanged: {
                                    dialogRoot.curMonth = currentIndex
                                    dialogRoot.updateCalendar()
                                }
                            }
                        }

                        // ==================== 日历网格（固定尺寸，避免 null） ====================
                        GridLayout {
                            id: calendarGrid
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 10
                            columns: 7
                            columnSpacing: 2
                            rowSpacing: 2
                            width: 460
                            height: 280

                            // 星期表头
                            Repeater {
                                model: ["日","一","二","三","四","五","六"]
                                Rectangle {
                                    width: 65; height: 40
                                    color: "#f0f0f0"
                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData
                                        font.pixelSize: 16
                                        color: "#666"
                                    }
                                }
                            }

                            // 日期格子（6行×7列）
                            Repeater {
                                id: dayRepeater
                                model: 42
                                Rectangle {
                                    width: 65; height: 40
                                    color: {
                                        if (isSelected) return "#0077ff"
                                        if (isOtherMonth) return "#f8f8f8"
                                        if (isToday) return "#b6d9ff"
                                        return "white"
                                    }
                                    border.color: isSelected ? "#0055cc" : "#eee"
                                    border.width: 1

                                    Text {
                                        anchors.centerIn: parent
                                        text: dayText
                                        font.pixelSize: 18
                                        color: {
                                            if (isSelected) return "white"
                                            if (isOtherMonth) return "#ccc"
                                            return "#333"
                                        }
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            if (!isOtherMonth) {
                                                dialogRoot.selDay = dayNum
                                                dialogRoot.updateCalendar()
                                            }
                                        }
                                    }

                                    property int dayNum: 0
                                    property bool isOtherMonth: false
                                    property bool isToday: false
                                    property bool isSelected: false
                                    property string dayText: ""
                                }
                            }
                        }
                    }

                    Item { Layout.fillWidth: true }

                    // ==================== 时分秒滚轮 ====================
                    RowLayout {
                        Layout.alignment: Qt.AlignVCenter
                        Layout.topMargin: 15
                        spacing: 12

                        Tumbler {
                            id: hourTumbler
                            width: 80; height: 100
                            model: 24
                            delegate: Rectangle {
                                width: parent.width; height: 30
                                color: index === hourTumbler.currentIndex ? "#E6F2FF" : "transparent"
                                Text {
                                    text: index
                                    anchors.centerIn: parent
                                    property int d: Math.abs(index - hourTumbler.currentIndex)
                                    font.pixelSize: Math.max(16, 28 - d*3)
                                    opacity: Math.max(0.2, 1 - d*0.4)
                                    color: index === hourTumbler.currentIndex ? "#0077FF" : "#000000"
                                }
                            }
                        }
                        Text { text: "时"; font.pixelSize: 20; color: "#333" }

                        Tumbler {
                            id: minTumbler
                            width: 80; height: 100
                            model: 60
                            delegate: Rectangle {
                                width: parent.width; height: 30
                                color: index === minTumbler.currentIndex ? "#E6F2FF" : "transparent"
                                Text {
                                    text: index
                                    anchors.centerIn: parent
                                    property int d: Math.abs(index - minTumbler.currentIndex)
                                    font.pixelSize: Math.max(16, 28 - d*3)
                                    opacity: Math.max(0.2, 1 - d*0.4)
                                    color: index === minTumbler.currentIndex ? "#0077FF" : "#000000"
                                }
                            }
                        }
                        Text { text: "分"; font.pixelSize: 20; color: "#333" }

                        Tumbler {
                            id: secTumbler
                            width: 80; height: 100
                            model: 60
                            delegate: Rectangle {
                                width: parent.width; height: 30
                                color: index === secTumbler.currentIndex ? "#E6F2FF" : "transparent"
                                Text {
                                    text: index
                                    anchors.centerIn: parent
                                    property int d: Math.abs(index - secTumbler.currentIndex)
                                    font.pixelSize: Math.max(16, 28 - d*3)
                                    opacity: Math.max(0.2, 1 - d*0.4)
                                    color: index === secTumbler.currentIndex ? "#0077FF" : "#000000"
                                }
                            }
                        }
                        Text { text: "秒"; font.pixelSize: 20; color: "#333" }
                    }
                }

                Item { Layout.fillHeight: true }

                // ==================== 确定 / 取消 ====================
                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 40

                    CustomButton {
                        buttonText: "取消"
                        buttonWidth: 160; buttonHeight: 45;
                        onClicked: {
                            timeSetDialog.visible = false
                            timeSetClosed()
                        }
                    }

                    CustomButton {
                        buttonText: "确定设置"
                        buttonWidth: 160; buttonHeight: 45;
                        onClicked: {
                            MainPageConfig.setSystemDateTime(
                                dialogRoot.curYear,
                                dialogRoot.curMonth + 1,
                                dialogRoot.selDay,
                                hourTumbler.currentIndex,
                                minTumbler.currentIndex,
                                secTumbler.currentIndex
                            );
                            timeSetDialog.visible = false
                            timeSetClosed()
                        }
                    }
                }
            }

            // ==================== 日历逻辑 ====================
            property var now: new Date()
            property int curYear: now.getFullYear()
            property int curMonth: now.getMonth()
            property int selDay: now.getDate()

            function getDaysInMonth(y, m) {
                if (m === 1) { // 2月
                    if ((y % 4 === 0 && y % 100 !== 0) || (y % 400 === 0)) return 29
                    else return 28
                }
                if ([3,5,8,10].includes(m)) return 30
                return 31
            }

            function updateCalendar() {
                // 增加空指针判断，避免访问 null 项
                if (!dayRepeater) return;

                var firstDay = new Date(dialogRoot.curYear, dialogRoot.curMonth, 1)
                var startWeek = firstDay.getDay()
                var days = dialogRoot.getDaysInMonth(dialogRoot.curYear, dialogRoot.curMonth)
                var prevMonthDays = dialogRoot.getDaysInMonth(dialogRoot.curYear, dialogRoot.curMonth - 1)

                for (var i = 0; i < 42; i++) {
                    var item = dayRepeater.itemAt(i)
                    if (!item) continue; // 跳过 null 项，防止报错

                    var dayNum = i - startWeek + 1
                    item.isOtherMonth = false
                    item.isToday = false
                    item.isSelected = false

                    if (dayNum < 1) {
                        item.dayNum = prevMonthDays + dayNum
                        item.isOtherMonth = true
                        item.dayText = "" + item.dayNum
                    } else if (dayNum > days) {
                        item.dayNum = dayNum - days
                        item.isOtherMonth = true
                        item.dayText = "" + item.dayNum
                    } else {
                        item.dayNum = dayNum
                        item.dayText = "" + dayNum

                        if (dialogRoot.curYear === dialogRoot.now.getFullYear() &&
                                dialogRoot.curMonth === dialogRoot.now.getMonth() &&
                                dayNum === dialogRoot.now.getDate()) {
                            item.isToday = true
                        }
                        if (dayNum === dialogRoot.selDay) {
                            item.isSelected = true
                        }
                    }
                }
            }

            onVisibleChanged: {
                if (visible) {
                    dialogRoot.now = new Date()
                    dialogRoot.curYear = dialogRoot.now.getFullYear()
                    dialogRoot.curMonth = dialogRoot.now.getMonth()
                    dialogRoot.selDay = dialogRoot.now.getDate()
                    monthCombo.currentIndex = dialogRoot.curMonth
                    hourTumbler.currentIndex = dialogRoot.now.getHours()
                    minTumbler.currentIndex = dialogRoot.now.getMinutes()
                    secTumbler.currentIndex = dialogRoot.now.getSeconds()
                    dialogRoot.updateCalendar()
                }
            }

            // 延迟初始化，避免组件未创建就调用
            Component.onCompleted: {
                dialogRoot.updateCalendar()
            }
        }
    }
}
