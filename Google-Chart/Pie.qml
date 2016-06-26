import QtQuick 2.7
import QtQuick.Controls 2.0
import QtWebEngine 1.3

import Interface.Nanosoft 1.0
import QtQuick.Layouts 1.0

Item {
    id: pie

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
google.charts.load(\'current\', {\'packages\':[\'corechart\']});
google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          [\'Task\', \'Hours per Day\'],
          [\'Work\',     11],
          [\'Eat\',      2],
          [\'Commute\',  2],
          [\'Watch TV\', 2],
          [\'Sleep\',    7]
        ]);

        var options = {
          title: \'My Daily Activities\'
        };

        var chart = new google.visualization.PieChart(document.getElementById(\'piechart\'));

        chart.draw(data, options);
      }
</script>
</head>
<body>
<div id="piechart" style="width: 960px; height: 560px;"></div>
</body>
</html>')

        }
    }




}
