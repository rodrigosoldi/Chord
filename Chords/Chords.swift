//
//  Chords.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 27/02/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

class Chords : AnyObject {
    
    internal var letters : [String] = []
    
    func isChord(word : String) -> Bool {
        return verifyIsChord(word)
    }
    
    func isChord(from sentence: String) -> Bool {
        let sentenceWithoutNewLines = sentence.replacingOccurrences(of: "\n", with: " ")
        let words = sentenceWithoutNewLines.components(separatedBy: " ")
        for word in words {
            if !isChord(word: word) {
                return false
            }
        }
        
        return words.count > 0
    }
    
    func chords(from text: String, noRepeat: Bool = false) -> [String] {
        var chords = [String]()
        let textWithoutNewLines = text.replacingOccurrences(of: "\n", with: " ")
        let words = textWithoutNewLines.components(separatedBy: " ")
        for word in words {
            if isChord(word: word) {
                chords.append(word)
            }
        }
        
        if noRepeat {
            return Array(Set(chords))
        }
        
        return chords
    }
    
}

