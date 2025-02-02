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
import QtGraphicalEffects 1.0

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0
import Esri.ArcGISRuntime 100.2

import "controls" as Controls

App {
    id: app
    width: 414
    height: 736
    function units(value) {
        return AppFramework.displayScaleFactor * value
    }
    property real scaleFactor: AppFramework.displayScaleFactor
    property int baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)

    Page{
        anchors.fill: parent
        header: ToolBar{
            id:header
            width: parent.width
            height: 50 * scaleFactor
            Material.background: "#8f499c"
            Controls.HeaderBar{}
        }

        // sample starts here ------------------------------------------------------------------
        contentItem: Rectangle{
            anchors.top:header.bottom
            //! [display vector tiled layer]
            // Create MapView that contains a Map
            // Map view UI presentation at top
            MapView {
                id: mapView

                anchors.fill: parent

                Map {
                    Basemap {
                        // Create a WebTiledLayer with a template URL, sub domains, and copyright information
                        WebTiledLayer {
                            templateUrl: "http://{subDomain}.tile.stamen.com/terrain/{level}/{col}/{row}.png"
                            subDomains: ["a", "b", "c", "d"]
                            attribution: "Map tiles by <a href=\"http://stamen.com/\">Stamen Design</a>, " +
                                         "under <a href=\"http://creativecommons.org/licenses/by/3.0\">CC BY 3.0</a>. " +
                                         "Data by <a href=\"http://openstreetmap.org/\">OpenStreetMap</a>, " +
                                         "under <a href=\"http://creativecommons.org/licenses/by-sa/3.0\">CC BY SA</a>."
                        }
                    }

                    // Set initial viewpoint
                    ViewpointCenter {
                        Point {
                            x: -13167861
                            y: 4382202
                            spatialReference: SpatialReference.createWebMercator()
                        }
                        targetScale: 50000
                    }
                }
                BusyIndicator {
                    anchors.centerIn: parent
                    height: 48 * scaleFactor
                    width: height
                    running: true
                    Material.accent:"#8f499c"
                    visible: (mapView.drawStatus === Enums.DrawStatusInProgress)
                }
            }
        }
    }


    // sample ends here ------------------------------------------------------------------------
    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}

