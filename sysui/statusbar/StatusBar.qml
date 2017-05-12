/****************************************************************************
**
** Copyright (C) 2017 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import utils 1.0
import controls 1.0
import models.statusbar 1.0
import models.settings 1.0

Pane {
    id: root
    width: Style.hspan(24)
    height: Style.vspan(2)
    signal clicked()
    signal timePressAndHold();
    signal overviewClicked();

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
        onPressAndHold: root.timePressAndHold()
    }

    RowLayout {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Style.padding
        anchors.bottomMargin: Style.padding
        spacing: Style.padding
        IndicatorTray {
            Layout.fillHeight: true
            model: StatusBarModel.indicators
        }
    }

    PageIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Style.padding
        anchors.bottomMargin: Style.padding

        currentIndex: StatusBarModel.currentPage
        count: StatusBarModel.pageIndicatorSize
    }

    RowLayout {
        spacing: Style.padding
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Style.padding
        anchors.bottomMargin: Style.padding

        Tool {
            Layout.fillHeight: true
            symbol: "fullscreen"
            onClicked: root.overviewClicked()
        }

        Weather {
            Layout.fillHeight: true
            currentTemperature: 15
            weatherIcon: "topbar_icon_rain"
        }

        DateAndTime {
            Layout.preferredWidth: Style.hspan(2)
            Layout.fillHeight: true
            timeFormat: SettingsModel.clockOption.format
            currentDate: StatusBarModel.currentDate
        }
    }
}