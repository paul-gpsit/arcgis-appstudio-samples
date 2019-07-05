import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0

import "../Widgets"

Page {
    id: root

    signal addNewItem()
    signal updateExistingItem()
    signal back()
    signal next(string selectedOption)

    property var itemDetails

    footer: NavigatorFooter {
        id: navigatorFooter

        isNextEnabled: addItemRadioButton.checked || updateItemRadioButton.checked

        onBack: {
            root.back();
        }

        onNext: {
            var _selectedOption = updateItemRadioButton.checked ? "update" : "add";
            root.next(_selectedOption);
        }
    }

    ColumnLayout {
        width: parent.width - 72 * scaleFactor
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0
        clip: true

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 36 * scaleFactor
        }

        Label {
            Layout.fillWidth: true
            text: strings.addorupdatepage_title
            font {
                weight: Font.Normal
                pixelSize: 24 * scaleFactor
            }
            color: colors.black_54
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 8 * scaleFactor
        }

        Label {
            Layout.fillWidth: true
            text: strings.addorupdatepage_description
            font {
                weight: Font.Normal
                pixelSize: 14 * scaleFactor
            }
            color: colors.black_54
            wrapMode: Label.Wrap
        }

        Label {
            Layout.fillWidth: true
            text: strings.addorupdatepage_warning
            font {
                weight: Font.Normal
                pixelSize: 14 * scaleFactor
            }
            color: colors.red
            wrapMode: Label.Wrap
        }


        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 60 * scaleFactor
        }

        CustomRadioButton{
            id: addItemRadioButton
            text: strings.addorupdatepage_addnew
            backgroundColor: colors.primary_color
            fontColor: colors.white_100
            Layout.preferredWidth: Math.min(300 * scaleFactor, parent.width )
            topPadding: 9 * scaleFactor
            bottomPadding: topPadding
            rightPadding: 24 * scaleFactor
            leftPadding: rightPadding
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 10 * scaleFactor
        }

        CustomRadioButton{
            id: updateItemRadioButton
            text: strings.addorupdatepage_updateexisting
            Layout.preferredWidth: Math.min(300 * scaleFactor, parent.width )
            backgroundColor: colors.red
            fontColor: colors.white_100
            topPadding: 9 * scaleFactor
            bottomPadding: topPadding
            rightPadding: 24 * scaleFactor
            leftPadding: rightPadding
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
