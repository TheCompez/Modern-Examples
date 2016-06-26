import QtQuick 2.7
import QtQuick.Controls 2.0
import QtWebEngine 1.3

import Interface.Nanosoft 1.0
import QtQuick.Layouts 1.0

Item {
    id: column

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
    <script type="text/javascript">
      google.charts.load(\'current\', {\'packages\':[\'bar\']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          [\'Year\', \'Sales\', \'Expenses\', \'Profit\'],
          [\'2014\', 1000, 400, 200],
          [\'2015\', 1170, 460, 250],
          [\'2016\', 660, 1120, 300],
          [\'2017\', 1030, 540, 350]
        ]);

        var options = {
          chart: {
            title: \'Company Performance\',
            subtitle: \'Sales, Expenses, and Profit: 2014-2017\',
          }
        };

        var chart = new google.charts.Bar(document.getElementById(\'columnchart_material\'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 960px; height: 560px;"></div>
  </body>
</html>')

        }
    }




}
