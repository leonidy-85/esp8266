import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem

import Ubuntu.Components.Popups 1.3


Page {
    id: pageWiki
    title: i18n.tr("Wiki")


    Column {
        id: column


        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
        }
//        Image {
//            id: image1
//            anchors.horizontalCenter: parent.horizontalCenter
//            width: 200
//            height: 150
//            source: "esp.jpg"
//        }



        Text { text: "Помимо WI-FI модуля ESP8266 потребуеться "; font.family: "Helvetica"; font.pointSize: 10;color: "#7c7af3"}
        Text { text: "мосфет(можно снять со старой материнки"; font.family: "Helvetica"; font.pointSize: 10;color: "#7c7af3"}
        Text { text: "если модуль не имеет програматора то потребуеться еще usb to ttl"; font.family: "Helvetica"; font.pointSize: 10;color: "#7c7af3"}
        Text { text: "преобразователь, прошивку для esp можно скачать тут 'link'" ;font.family: "Helvetica"; font.pointSize: 10;color: "#7c7af3"}
        Text { text: "пронивка написана в среде arduino"; font.family: "Helvetica"; font.pointSize: 10;color: "#7c7af3"}



//        Button {
//            text: "Site"
//            width: 300
//            anchors.horizontalCenter: parent.horizontalCenter
//            onClicked: {
//                Qt.openUrlExternally("https://www.paypal.com/")
//            }
//        }

    }



}

