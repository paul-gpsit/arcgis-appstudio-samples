import QtQuick 2.9
import QtQuick.Controls 2.2

RadioButton {
    id: control

    property color backgroundColor: "white"
    property color fontColor: colors.primary_color
    font.bold: true

    background: Rectangle{
        color: control.backgroundColor
    }

    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        y: parent.height / 2 - height / 2
        anchors.right: parent.right
        anchors.rightMargin: control.rightPadding
        radius: 13
        border.color: control.down ? Qt.darker(colors.primary_color) : colors.primary_color;

        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            radius: 7
            color: control.down ? Qt.darker(colors.primary_color) : colors.primary_color;
            visible: control.checked
        }
    }

    contentItem: Item{
        implicitWidth: Math.min(textLabel.paintedWidth, (control.indicator.width + control.leftPadding))
        Text {
            id: textLabel
            text: control.text
            font: control.font
            elide: Text.ElideRight
            anchors{
                left: parent.left
                right: parent.right
                rightMargin: control.indicator.width + 10
                bottom: parent.bottom
                top: parent.top
            }

            opacity: enabled ? 1.0 : 0.3
            color: control.down ? Qt.darker(control.fontColor) : control.fontColor;
            verticalAlignment: Text.AlignVCenter
        }
    }
}
