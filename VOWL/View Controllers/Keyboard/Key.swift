//
//  Key.swift
//  VOWL
//
//  Created by Daniel Clelland on 16/11/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import UIKit

class Key {
    var pitch: Int
    var path: UIBezierPath
    
    init(withPitch pitch: Int, path: UIBezierPath) {
        self.pitch = pitch
        self.path = path
    }
    
    var name: String {
        return noteName + octaveName
    }
    
    var frequency: Float {
        return pow(2.0, (Float(pitch) - 69.0) / 12.0) * 440.0
    }
    
    // MARK: Private getters
    
    private var noteName: String {
        switch pitch % 12 {
        case 0: return "C"
        case 1: return "C#"
        case 2: return "D"
        case 3: return "D#"
        case 4: return "E"
        case 5: return "F"
        case 6: return "F#"
        case 7: return "G"
        case 8: return "G#"
        case 9: return "A"
        case 10: return "A#"
        case 11: return "B"
        default: return ""
        }
    }
    
    private var octaveName: String {
        return String(pitch / 12 - 1)
    }
}
