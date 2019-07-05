import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0

import "../Widgets"

Page {
    id: root

    property var itemDetails
    property var portalBItemDetails

    signal next()
    signal back()
    signal editContent();

    function getPortalBItemId(){
        if (portalBItemDetails && portalBItemDetails.hasOwnProperty("id")){
            return portalBItemDetails.id;
        }
        return undefined;
    }

    Flickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: bodyColumnLayout.height

        ColumnLayout {
            id: bodyColumnLayout
            width: Math.min(parent.width - 32 * scaleFactor, maximumScreenWidth)
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 0

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 25 * scaleFactor
            }

            Label {
                Layout.fillWidth: true
                text: strings.step_no.arg(3)
                font {
                    weight: Font.Normal
                    pixelSize: 24 * scaleFactor
                }
                color: colors.primary_color
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 8 * scaleFactor
            }

            Label {
                Layout.fillWidth: true
                text: strings.step3_description
                font {
                    weight: Font.Normal
                    pixelSize: 14 * scaleFactor
                }
                color: colors.black_54
                wrapMode: Label.Wrap
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 24 * scaleFactor
            }

            Rectangle {
                //this is the card for the details of the source app to copy
                Layout.fillWidth: true
                Layout.preferredHeight: 132 * scaleFactor

                color: colors.card_background
                border.width: 1
                border.color: colors.card_border
                radius: 2 * scaleFactor
                clip: true

                ColumnLayout {
                    width: parent.width - 32 * scaleFactor
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 0

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 16 * scaleFactor
                    }

                    Label {
                        Layout.fillWidth: true
                        text: strings.source_app
                        font {
                            weight: Font.Medium
                            pixelSize: 12 * scaleFactor
                        }
                        color: colors.black_54
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 16 * scaleFactor
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 52 * scaleFactor

                        RowLayout {
                            anchors.fill: parent
                            spacing: 0

                            Image {
                                Layout.fillHeight: true
                                Layout.preferredWidth: 78 * scaleFactor
                                source: itemDetails.thumbnail > "" && status != Image.Error ? itemDetails.thumbnail : sources.placeholder
                                fillMode: Image.PreserveAspectFit
                            }

                            Item {
                                Layout.fillHeight: true
                                Layout.preferredWidth: 16 * scaleFactor
                            }

                            Item {
                                Layout.fillHeight: true
                                Layout.fillWidth: true

                                ColumnLayout {
                                    width: parent.width
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 0

                                    Label {
                                        Layout.fillWidth: true
                                        text: itemDetails.title
                                        leftPadding: rightPadding
                                        rightPadding: 0
                                        maximumLineCount: 2
                                        wrapMode: Label.Wrap
                                        font {
                                            weight: Font.Normal
                                            pixelSize: 14 * scaleFactor
                                        }
                                        color: colors.black_87
                                        clip: true
                                        elide: Label.ElideRight
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 4 * scaleFactor
                                    }

                                    Label {
                                        Layout.fillWidth: true
                                        text: itemDetails.owner
                                        leftPadding: rightPadding
                                        rightPadding: 0
                                        font {
                                            weight: Font.Normal
                                            pixelSize: 12 * scaleFactor
                                        }
                                        color: colors.black_54
                                        clip: true
                                        elide: Label.ElideRight
                                    }

                                    Label {
                                        Layout.fillWidth: true
                                        text: itemDetails.modified
                                        leftPadding: rightPadding
                                        rightPadding: 0
                                        font {
                                            weight: Font.Normal
                                            pixelSize: 12 * scaleFactor
                                        }
                                        color: colors.black_54
                                        clip: true
                                        elide: Label.ElideRight
                                    }
                                }
                            }

                            Item {
                                Layout.fillHeight: true
                                Layout.preferredWidth: 0 * scaleFactor
                            }
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 16 * scaleFactor
            }


            Rectangle {
                //this is the card for the details of the target app to overwrite.
                //only visible if there is a target app to overwrite.
                visible: portalBItemDetails !== undefined;
                Layout.fillWidth: true
                Layout.preferredHeight: 132 * scaleFactor

                color: colors.red_background
                border.width: 1
                border.color: colors.red
                radius: 2 * scaleFactor
                clip: true

                ColumnLayout {
                    width: parent.width - 32 * scaleFactor
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 0

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 16 * scaleFactor
                    }

                    Label {
                        Layout.fillWidth: true
                        text: strings.target_app
                        font {
                            weight: Font.Medium
                            pixelSize: 12 * scaleFactor
                        }
                        color: colors.black_54
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 16 * scaleFactor
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 52 * scaleFactor

                        RowLayout {
                            anchors.fill: parent
                            spacing: 0

                            Image {
                                Layout.fillHeight: true
                                Layout.preferredWidth: 78 * scaleFactor
                                source: portalBItemDetails && portalBItemDetails.thumbnail > "" && status != Image.Error ? portalBItemDetails.thumbnail : sources.placeholder
                                fillMode: Image.PreserveAspectFit
                            }

                            Item {
                                Layout.fillHeight: true
                                Layout.preferredWidth: 16 * scaleFactor
                            }

                            Item {
                                Layout.fillHeight: true
                                Layout.fillWidth: true

                                ColumnLayout {
                                    width: parent.width
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 0

                                    Label {
                                        Layout.fillWidth: true
                                        text: portalBItemDetails ? portalBItemDetails.title : ""
                                        leftPadding: rightPadding
                                        rightPadding: 0
                                        maximumLineCount: 2
                                        wrapMode: Label.Wrap
                                        font {
                                            weight: Font.Normal
                                            pixelSize: 14 * scaleFactor
                                        }
                                        color: colors.black_87
                                        clip: true
                                        elide: Label.ElideRight
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 4 * scaleFactor
                                    }

                                    Label {
                                        Layout.fillWidth: true
                                        text: portalBItemDetails ? portalBItemDetails.owner : ""
                                        leftPadding: rightPadding
                                        rightPadding: 0
                                        font {
                                            weight: Font.Normal
                                            pixelSize: 12 * scaleFactor
                                        }
                                        color: colors.black_54
                                        clip: true
                                        elide: Label.ElideRight
                                    }

                                    Label {
                                        Layout.fillWidth: true
                                        text: portalBItemDetails ? portalBItemDetails.modified : ""
                                        leftPadding: rightPadding
                                        rightPadding: 0
                                        font {
                                            weight: Font.Normal
                                            pixelSize: 12 * scaleFactor
                                        }
                                        color: colors.black_54
                                        clip: true
                                        elide: Label.ElideRight
                                    }
                                }
                            }

                            Item {
                                Layout.fillHeight: true
                                Layout.preferredWidth: 0 * scaleFactor
                            }
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }

            Item {
                visible: portalBItemDetails !== undefined;
                Layout.fillWidth: true
                Layout.preferredHeight: 16 * scaleFactor
            }

            PortalCard {
                id: portalCard_A

                portal: portalA
                mode: 1
                editEnabled: false

                Layout.fillWidth: true
                Layout.preferredHeight: height

                onOpenSignInPage: {
                    tempStackViewItem = stackView.currentItem;
                    stackView.push(portalTypePage, {"mode": 1}, StackView.Immediate);
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 16 * scaleFactor
            }

            PortalCard {
                id: portalCard_B

                portal: portalB
                mode: 2
                editEnabled: false

                Layout.fillWidth: true
                Layout.preferredHeight: height

                onOpenSignInPage: {
                    tempStackViewItem = stackView.currentItem;
                    stackView.push(portalTypePage, {"mode": 2}, StackView.Immediate);
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 24 * scaleFactor
            }
        }

    }

    footer: NavigatorFooter {
        id: navigatorFooter

        isNextEnabled: portalCard_A.isSignedIn && portalCard_B.isSignedIn && itemDetails.id > ""
        text2: strings.confirm
        icon2.visible: false

        onBack: {
            root.back();
        }

        onNext: {
            root.next();
        }
    }
}
