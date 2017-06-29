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
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

import utils 1.0

ItemDelegate {
    id: root
    implicitWidth: Style.hspan(16)
    implicitHeight: Style.vspan(2)

    property alias icon: icon.name
    property alias hasChildren: childIndicator.visible
    checkable: true

    background: Item {
        implicitWidth: Style.hspan(16)
        implicitHeight: Style.vspan(2)
    }

    contentItem: Control {
        implicitWidth: Style.hspan(16)
        implicitHeight: Style.vspan(2)
        RowLayout {
            height: parent.height
            spacing: 0

            Symbol {
                id: icon
                Layout.preferredWidth: Style.hspan(2)
                Layout.fillHeight: true
                opacity: 0.4
            }

            Label {
                id: titleLabel
                Layout.preferredWidth: Style.hspan(8)
                Layout.fillHeight: true
                text: root.text
                elide: Text.ElideRight
            }

            Switch {
                id: switchControl
                Layout.preferredWidth: Style.hspan(3)
                Layout.fillHeight: true
                visible: root.checkable
                checked: root.checked
                onClicked: {
                    root.checked != root.checked
                }
            }

            Spacer {
                Layout.preferredWidth: Style.hspan(3)
                Layout.fillHeight: true
                visible: !root.checkable
            }

            Icon {
                id: childIndicator
                Layout.preferredWidth: Style.hspan(2)
                Layout.fillHeight: true
                source: Style.icon("cloud_arrow")
            }
        }
        HDiv {
            anchors.verticalCenter: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
//            _tracer_color: 'transparent'
        }
    }

    Tracer {
    }

}
