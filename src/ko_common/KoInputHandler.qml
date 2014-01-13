import QtQuick 2.0
import Sailfish.Silica 1.0
import com.jolla.keyboard 1.0
import name.peremen.libhangul 1.0
import ".."
import "../.."

import "keymaps.js" as Keymaps


InputHandler { 
    Component.onCompleted: init()
    
    function init() {
      //hangul_ic.selectKeyboard("2")
    }
    
    HangulInputContext {
      id: hangul_ic
    }
    
    function handleKeyClick() {
        var handled = false
        keyboard.expandedPaste = false

        if (pressedKey.key === Qt.Key_Backspace) {
            // If backspace is not handled by libhangul, forward to default handler
            handled = hangul_ic.backspace()
            if (handled) {
                updateString()
                if (hangul_ic.isEmpty()) {
                    // Needs workaround: setting empty preedit string does not invalidate it
                    MInputMethodQuick.sendCommit("")
                }                    
            }
        } else if (pressedKey.key === Qt.Key_Space || pressedKey.key === Qt.Key_Return) {
            // Send both commit and preedit string 
            flush()
            if (keyboard.shiftState !== ShiftState.LockedShift) {
                keyboard.shiftState = ShiftState.NoShift
            }
        } else if (pressedKey.text.length !== 0) {
            if (!Keymaps.ko_2set_qwerty_map.hasOwnProperty(pressedKey.text)) {
                flush()
                return false
            }
            handled = hangul_ic.process(Keymaps.ko_2set_qwerty_map[pressedKey.text].charCodeAt(0))
            updateString()
            // No case in Hangul: always reset shift status
            if (keyboard.shiftState !== ShiftState.LockedShift) {
                keyboard.shiftState = ShiftState.NoShift
            }
        }
        return handled
    }
    
    function flush() {
        var cstr = ""
        cstr = hangul_ic.flush()
        if (cstr.length > 0) {
            MInputMethodQuick.sendCommit(cstr)
        }
    }
    
    function updateString() {
        var cstr = ""
        var pstr = ""
        cstr = hangul_ic.getCommitString()
        pstr = hangul_ic.getPreeditString()
        
        if (cstr.length > 0) {
            MInputMethodQuick.sendCommit(cstr)
        }
        
        if (pstr.length > 0) {
            MInputMethodQuick.sendPreedit(pstr)
        }
    }
     
    function reset() {
        hangul_ic.reset()
    }
    
}
