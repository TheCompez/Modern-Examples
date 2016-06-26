import QtQuick 2.7
import QtQuick.Controls 2.0
import QtWebEngine 1.3

import Interface.Nanosoft 1.0
import QtQuick.Layouts 1.0

Item {
    id: histogram

    WebEngineView {
        id:webView;
        anchors.fill: parent;
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

    Chart {id:chart;}

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

    Button {
        id: button1
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        text: qsTr("Run")

        onClicked: {


            webView.loadHtml('<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          [\'Dinosaur\', \'Length\'],
          [\'Acrocanthosaurus (top-spined lizard)\', 12.2],
          [\'Albertosaurus (Alberta lizard)\', 9.1],
          [\'Allosaurus (other lizard)\', 12.2],
          [\'Apatosaurus (deceptive lizard)\', 22.9],
          [\'Archaeopteryx (ancient wing)\', 0.9],
          [\'Argentinosaurus (Argentina lizard)\', 36.6],
          [\'Baryonyx (heavy claws)\', 9.1],
          [\'Brachiosaurus (arm lizard)\', 30.5],
          [\'Ceratosaurus (horned lizard)\', 6.1],
          [\'Coelophysis (hollow form)\', 2.7],
          [\'Compsognathus (elegant jaw)\', 0.9],
          [\'Deinonychus (terrible claw)\', 2.7],
          [\'Diplodocus (double beam)\', 27.1],
          [\'Dromicelomimus (emu mimic)\', 3.4],
          [\'Gallimimus (fowl mimic)\', 5.5],
          [\'Mamenchisaurus (Mamenchi lizard)\', 21.0],
          [\'Megalosaurus (big lizard)\', 7.9],
          [\'Microvenator (small hunter)\', 1.2],
          [\'Ornithomimus (bird mimic)\', 4.6],
          [\'Oviraptor (egg robber)\', 1.5],
          [\'Plateosaurus (flat lizard)\', 7.9],
          [\'Sauronithoides (narrow-clawed lizard)\', 2.0],
          [\'Seismosaurus (tremor lizard)\', 45.7],
          [\'Spinosaurus (spiny lizard)\', 12.2],
          [\'Supersaurus (super lizard)\', 30.5],
          [\'Tyrannosaurus (tyrant lizard)\', 15.2],
          [\'Ultrasaurus (ultra lizard)\', 30.5],
          [\'Velociraptor (swift robber)\', 1.8]]);

        var options = {
          title: \'Lengths of dinosaurs, in meters\',
          legend: { position: \'none\' },
        };

        var chart = new google.visualization.Histogram(document.getElementById(\'chart_div\'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
  </body>
</html>')

        }
    }




}
