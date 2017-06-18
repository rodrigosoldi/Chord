//
//  ChordsController.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 07/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

enum StringToPlay {
    case DontPlay
    case Bass
    case Play

}

class ChordsController {
    
    func drawNote(fromText text: String) -> ([(Int, Int)], (Int, Int)?, (String, Int)?, [StringToPlay]?)? {
        
        guard let note = note(byName: text) else {
            return nil
        }

        guard let posicao = note.posicaoPadrao else {
            return nil
        }

        
        // Cada posicao P1, P2, P3 ... 
        // Corresponde à corda a ser 'tocada'
        
        // Cada valor de P1, P2, P3...
        // Corresponde a qual casa deve ser tocada
        
        let notes = [posicao.p1, posicao.p2, posicao.p3, posicao.p4, posicao.p5, posicao.p6]
        var newNotes = notes
            let balance = needsBalance(notes: newNotes)
        if balance.0 {
           newNotes = balanceNotes(notes: newNotes, minorNote: balance.1)
        }
        
        var notesToGo = [(Int, Int)]()
        
        for (index, element) in newNotes.enumerated() {
            var string = 0
            let newElement = element?.replacingOccurrences(of: "p", with: "")
            if newElement != "X" {
                string = Int(newElement!)!
            }
            
            if string != 0 {
                notesToGo.append((string, 6 - index))
            }
            
        }
        
        return (notesToGo, detectPestana(notes: newNotes), balance.0 == true ? balanceHouseToPlay(notes: notes, minorNote: balance.1) : nil, stringsToPlay(notes: newNotes))
    }
    
    
    /// Identifica e retorna onde a pestana deve ser colocada (casa a ser colocada, em qual corda ela comeca)
    func detectPestana(notes: [String?]) -> (Int, Int)? {
        for (index, element) in notes.enumerated() {
            if let element = element {
                if (element.contains("p")) {
                    let indexH = element.index((element.startIndex), offsetBy: 1)
                    let strHouse  = element.substring(to: indexH)
                    
                    guard let house = Int(strHouse) else {
                        return nil
                    }
                    
                    return (house, 6 - index)
                }
            }
        }
        
        return nil
    }
    
    
    /// Encontra a casa que deve ser iniciado o acorde e a partir de qual corda
    ///
    func balanceHouseToPlay(notes: [String?], minorNote: Int) -> (String, Int)? {
        
        let minorNoteStr = String(minorNote)
        
        for element in notes {
            
            if let element = element {
                if element.contains("X") || element == "0" {
                    continue
                }
                
                let newElement = element.replacingOccurrences(of: "p", with: "")
                if newElement != minorNoteStr {
                    continue
                }
                
                if let noteWithoutP = Int(newElement) {
                    let value = noteWithoutP - minorNote + 1
                    return (String(minorNote), value)
                }
            }
        }
        
        return nil
    }
    
    /// Verifica se é necessario balancear as notas, para que possam ser exibidas no braço do violao
    ///
    /// - Returns: BOOL que diz se eh necessario, Int com a menor nota encontrada, Int com a maior nota encontrada
    func needsBalance(notes: [String?]) -> (Bool, Int, Int) {
        
        var maiorNote = 0
        var minorNote = 50
        
        // Find minor note
        for note in notes {
            
            if note == "X" {
                continue
            }
            
            if let n = Int((note?.replacingOccurrences(of: "p", with: ""))!) {
                
                if minorNote >= n {
                    minorNote = n
                }
                
                if maiorNote < n {
                    maiorNote = n
                }
            }
            
        }
        
        return (maiorNote > 5, minorNote, maiorNote)
    }
    
    
    /// Altera o array de notas para caber no braco do violao
    ///
    func balanceNotes(notes: [String?], minorNote: Int) -> [String] {
        var newNotes = [String]()
        for note in notes {
            if let note = note {
                if note == "X" || note == "0" {
                    newNotes.append(note)
                    continue
                }
                
                if let noteWithoutP = Int(note.replacingOccurrences(of: "p", with: "")) {
                    let value = noteWithoutP - minorNote + 1
                    
                    var valueString = "\(value)"
                    if note.contains("p") {
                        valueString = "\(value)p"
                    }
                    
                    newNotes.append(valueString)
                }
            }
        }
        return newNotes
    }
    
    
    /// Retorna um array de Enum com as cordas que devem ser tocadas
    ///
    func stringsToPlay(notes: [String?]) -> [StringToPlay] {
        
        var stringsToPlayArray = [StringToPlay]()
        var foundBass = false
        
        for note in notes {
            if let note = note {
                if note == "X" {
                    stringsToPlayArray.append(StringToPlay.DontPlay)
                } else if !foundBass {
                    foundBass = true
                    stringsToPlayArray.append(StringToPlay.Bass)
                } else {
                    stringsToPlayArray.append(StringToPlay.Play)
                }
            }
        }
        
        return stringsToPlayArray
    }
    
    func note(byName name: String) -> Nota? {
        return DatabaseNotes().note(byName: name.replacingOccurrences(of: "°", with: "º"))
    }
    
}
