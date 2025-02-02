/* Copyright 2017 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

import ArcGIS.AppFramework 1.0

import "controls" as Controls

App {
    id: app
    width: 480
    height: 800

    Material.accent: "#8f499c"

    property real scaleFactor: AppFramework.displayScaleFactor
    property int baseFontSize : app.info.propertyValue("baseFontSize", units(15)) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)

    Page {
        anchors.fill: parent

        header: ToolBar{
            id: header

            width: parent.width
            height: units(50)

            Material.background: "#8f499c"
            Controls.HeaderBar {
            }
        }

        Controls.BarcodeScanView {
            anchors.fill: parent
        }
    }

    Controls.DescriptionPage{
        id: descPage
        visible: false
    }

    function units(value) {
        return AppFramework.displayScaleFactor * value
    }

}
