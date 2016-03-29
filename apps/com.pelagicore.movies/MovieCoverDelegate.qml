/****************************************************************************
**
** Copyright (C) 2016 Pelagicore AG
** Contact: http://www.qt.io/ or http://www.pelagicore.com/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL3-PELAGICORE$
** Commercial License Usage
** Licensees holding valid commercial Pelagicore Neptune IVI UI
** licenses may use this file in accordance with the commercial license
** agreement provided with the Software or, alternatively, in accordance
** with the terms contained in a written agreement between you and
** Pelagicore. For licensing terms and conditions, contact us at:
** http://www.pelagicore.com.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU General Public License version 3 requirements will be
** met: http://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import utils 1.0
import controls 1.0

UIElement {
    id: root
    hspan: 4
    vspan: 7
    signal clicked()
    property alias source: image.source
    property alias title: title.text
    property bool selected

    Rectangle {
        anchors.fill: parent
        anchors.topMargin: -Style.paddingS
        color: Style.colorGrey
        border.color: Qt.lighter(color, 1.2)
        opacity: root.selected?0.2:0.0
        Behavior on opacity { NumberAnimation {} }
    }
    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0
        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: height*0.70
            height: Style.vspan(6)
            Rectangle {
                anchors.fill: parent
                color: Style.colorWhite
                border.color: Qt.darker(color, 1.2)
            }
            Image {
                id: image
                anchors.fill: parent
                anchors.margins: Style.paddingS
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                smooth: true
            }
        }
        Label {
            id: title
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.Light
            font.pixelSize: Style.fontSizeXS
            vspan: 1
            elide: Text.ElideRight
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}