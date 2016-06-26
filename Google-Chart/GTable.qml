import QtQuick 2.7
import QtQuick.Controls 2.0
import QtWebEngine 1.3

import Interface.Nanosoft 1.0
import QtQuick.Layouts 1.0

Item {
    id: table

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
google.charts.load(\'current\', {\'packages\':[\'table\']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn(\'string\', \'Name\');
        data.addColumn(\'number\', \'Salary\');
        data.addColumn(\'boolean\',\'Full Time Employee\');
        data.addRows([
          [\'Mike\',  {v: 10000, f: \'$10,000\'}, true],
          [\'Jim\',   {v:8000,   f: \'$8,000\'},  false],
          [\'Alice\', {v: 12500, f: \'$12,500\'}, true],
          [\'Bob\',   {v: 7000,  f: \'$7,000\'},  true]
        ]);

        var table = new google.visualization.Table(document.getElementById(\'table_div\'));

        table.draw(data, {showRowNumber: true, width: \'100%\', height: \'100%\'});
      }

</script>
</head>
<body>
<div id="table_div" style="width: 960px; height: 200px;"></div>
</body>
</html>')

        }
    }




}
