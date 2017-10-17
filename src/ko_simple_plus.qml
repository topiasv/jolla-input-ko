/*
    This is an extension to Dotdanbae
    Copyright (C) 2017- Topias Vainio <toxip@disroot.org>.  All rights reserved

    This file is part of Dotdanbae.
    Copyright (C) 2014- Shinjo Park <me@peremen.name>. All rights reserved.

    Dotdanbae is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Dotdanbae is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dotdanbae. If not, see <http://www.gnu.org/licenses/>.

    This file contains code from Jolla, original copyright notice is following.
 */
/*
 * Copyright (C) 2012-2013 Jolla ltd and/or its subsidiary(-ies). All rights reserved.
 *
 * Contact: Pekka Vuorela <pekka.vuorela@jollamobile.com>
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list
 * of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * Neither the name of Jolla Ltd nor the names of its contributors may be
 * used to endorse or promote products derived from this software without specific
 * prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

import QtQuick 2.0
import Sailfish.Silica 1.0 as Silica
import com.jolla.keyboard 1.0
import ".."
import "ko_common"

KeyboardLayout {
    id: main

    type: "custom"
    Component.onCompleted: {
        keyboard.autocaps = false
    }

    height: portraitMode == false ? geometry.keyHeightLandscape * 4
                     :  geometry.keyHeightPortrait * 4
    width: portraitMode == false ? geometry.keyboardWidthLandscape
                     : geometry.keyboardWidthPortrait

    Connections {
        target: keyboard
        // needed to make the extra symbol buttons to appear and disappear
        onInSymViewChanged: updateSizes()
    }

    KeyboardRow {
        KoTenKey { widthDiv: 7; caption: "ㅣ"; captionShifted: "ㅐ"; symView: "("; symView2: "{" }
        KoTenKey { widthDiv: 7; caption: "ㅏ"; captionShifted: "ㅑ"; symView: ")"; symView2: "}" }
        KoTenKey { widthDiv: 7; caption: "ㅓ"; captionShifted: "ㅕ"; symView: "/"; symView2: "\\" }
        KoTenKey { widthDiv: 7; caption: "ㅗ"; captionShifted: "ㅛ"; symView: "1"; symView2: "$" }
        KoTenKey { widthDiv: 7; caption: "ㅜ"; captionShifted: "ㅠ"; symView: "2"; symView2: "£" }
        KoTenKey { widthDiv: 7; caption: "ㅡ"; captionShifted: "ㅔ"; symView: "3"; symView2: "€" }
        ShiftKey {
            implicitWidth: main.width / 7
            separator: SeparatorState.VisibleSeparator
            active: keyboard.inSymView
        }
        KoPasteKey {
            popupAnchor: 1
            implicitWidth: main.width / 7
            active: !keyboard.inSymView
        }
    }

    KeyboardRow {
        separateButtonSizes: true

        KoTenKey { widthDiv: 7; caption: "ㄱ"; captionShifted: "ㄲ"; symView: "<"; symView2: "["; accents:"ㄲ"; }
        KoTenKey { widthDiv: 7; caption: "ㅋ"; captionShifted: "4"; symView: ">"; symView2: "]" }
        KoTenKey { widthDiv: 7; caption: "ㄴ"; captionShifted: "❤️"; symView: "@"; symView2: "%" }
        KoTenKey { widthDiv: 7; caption: "ㄹ"; captionShifted: "5"; symView: "4"; symView2: "₩" }
        KoTenKey { widthDiv: 7; caption: "ㄷ"; captionShifted: "ㄸ"; symView: "5"; symView2: "¥"; accents:"ㄸ"; }
        KoTenKey { widthDiv: 7; caption: "ㅌ"; captionShifted: "6"; symView: "6"; symView2: "₹" }
        KoTenKey { widthDiv: 7; caption: "?!"; captionShifted: "#"; symView: ":"; symView2: ";" }
    }

    KeyboardRow {
        separateButtonSizes: true

        KoTenKey { widthDiv: 7; caption: "ㅂ"; captionShifted: "ㅃ"; symView: "#"; symView2: "^"; accents: 'ㅃ' }
        KoTenKey { widthDiv: 7; caption: "ㅍ"; captionShifted: "7"; symView: "+"; symView2: "=" }
        KoTenKey { widthDiv: 7; caption: "ㅅ"; captionShifted: "ㅆ"; symView: "-"; symView2: "_"; accents: 'ㅆ' }
        KoTenKey { widthDiv: 7; caption: "ㅎ"; captionShifted: "8"; symView: "7"; symView2: "*" }
        KoTenKey { widthDiv: 7; caption: "ㅈ"; captionShifted: "ㅉ"; symView: "8"; symView2: "|"; accents:'ㅉ' }
        KoTenKey { widthDiv: 7; caption: "ㅊ"; captionShifted: "9"; symView: "9"; symView2: "`" }
        BackspaceKey {
            implicitWidth: main.width / 7
            height: geometry.keyHeightPortrait
        }
    }

    KeyboardRow {
        SymbolKey {
            caption: keyboard.inSymView ? "가" : "#" // symbols/hangul
            implicitWidth: main.width / 7
            separator: SeparatorState.VisibleSeparator
        }
        KoTenKey { widthDiv: 7; caption: ",."; captionShifted: "*"; symView: "~"; symView2: "&" }
        KoTenKey { widthDiv: 7; caption: "ㅇ"; captionShifted: "~"; symView: "\""; symView2: "\'" }
        KoTenKey { widthDiv: 7; caption: "ㅁ"; captionShifted: "0"; symView: "0"; symView2: "§" }
        SpacebarKey {
            separator: SeparatorState.VisibleSeparator
        }
        EnterKey {
            implicitWidth: main.width / 7
        }
    }
}
