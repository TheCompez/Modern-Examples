import QtQuick 2.7
import QtQuick.Controls 2.0
import QtWebEngine 1.3

import Interface.Nanosoft 1.0
import QtQuick.Layouts 1.0

Item {
    id: item1
    width: 960
    height: 640

    WebEngineView { id:webView; anchors.fill: parent;


        settings.autoLoadImages : true
        settings.errorPageEnabled : true
        settings.hyperlinkAuditingEnabled : true
        settings.javascriptCanAccessClipboard : true
        settings.javascriptCanOpenWindows : true
        settings.javascriptEnabled : true
        settings.linksIncludedInFocusChain : true
        settings.localContentCanAccessFileUrls : true
        settings.localContentCanAccessRemoteUrls : true
        settings.localStorageEnabled : true
        settings.pluginsEnabled : true
        settings.spatialNavigationEnabled : true



        onLoadProgressChanged: {

                    if (webView.loadProgress === 100) {
                        animation.visible = false
                        progressContainer.visible = false

                    }

                    else {
                        animation.visible = true
                        progressContainer.visible = true

                    }


        }

    }

    Map {id:map;}

    Rectangle {
        id: rectangle1
        y: 312
        height: 168
        color: "#ffffff"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        GroupBox {
            id: groupBox1
            x: 21
            y: 15
            width: 888
            height: 138
            anchors.horizontalCenterOffset: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("Map mode")

            Button {
                id: button1
                x: 760
                y: 52
                text: qsTr("Day")
                onClicked: {


                    webView.loadHtml('<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById(\'map\'), {
          center: {lat: ' + map.lat(cx.text) +  ', lng: ' + map.lng(cy.text) + '},
          zoom: '+  map.zoom(zoom.currentIndex) + '
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=' + map.key(apikey.text) + '&callback=initMap"
    async defer></script>
  </body>
</html>')

                }
            }

            Button {
                id: button2
                x: 760
                y: 5
                text: qsTr("Night")
                onClicked: {

                    webView.loadHtml('<!DOCTYPE html>
<html>
  <head>
    <title>Simple styled maps</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      function initMap() {
        var customMapType = new google.maps.StyledMapType([
            {
              stylers: [
                {hue: \'#890000\'},
                {visibility: \'simplified\'},
                {gamma: 0.5},
                {weight: 0.5}
              ]
            },
            {
              elementType: \'labels\',
              stylers: [{visibility: \'off\'}]
            },
            {
              featureType: \'water\',
              stylers: [{color: \'#890000\'}]
            }
          ], {
            name: \'Custom Style\'
        });
        var customMapTypeId = \'custom_style\';

        var map = new google.maps.Map(document.getElementById(\'map\'), {
          zoom: '+  map.zoom(zoom.currentIndex) + ',
          center: {lat: ' + map.lat(cx.text) +  ', lng: ' + map.lng(cy.text) + '},
          mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
          }
        });

        map.mapTypes.set(customMapTypeId, customMapType);
        map.setMapTypeId(customMapTypeId);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=' + map.key(apikey.text) + '&callback=initMap">
    </script>
  </body>
</html>')

                }
            }

            TextField {
                id: apikey
                x: 114
                y: -1
                width: 325
                height: 40
                text: qsTr("")
                placeholderText: "Enter your Google Developer api key!"
            }

            Label {
                id: label1
                x: 21
                y: 13
                text: qsTr("Enter you api key:")
            }

            Label {
                id: label2
                x: 41
                y: 59
                text: qsTr("Coordinate X:")
            }

            TextField {
                id: cx
                x: 114
                y: 45
                width: 123
                height: 40
                text: qsTr("33.3710522")
            }

            Label {
                id: label3
                x: 243
                y: 59
                text: qsTr("Coordinate Y:")
            }

            TextField {
                id: cy
                x: 316
                y: 45
                width: 123
                height: 40
                text: qsTr("50.5767876")
            }

            Label {
                id: label4
                x: 452
                y: 13
                text: qsTr("Zoom:")
            }

            ComboBox {
                id: zoom
                x: 497
                y: -1
               model: [ "1", "2", "3", "4", "5", "6", "7", "8" ]
               currentIndex: 6
            }
        }
    }

    Rectangle {

        id:progressContainer
        anchors.centerIn: parent
        anchors.fill: parent
        visible: false

        AnimatedImage { id: animation; x: 560; y: 320; width: 64; height: 64;
            visible: false; currentFrame: 60; source: "qrc:/loading.gif"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

        }


    }


}




