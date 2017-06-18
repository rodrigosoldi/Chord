//
//  ChordsExtension.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 05/03/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

extension Chords {
    
    internal func verifyIsChord(_ word: String) -> Bool {
        if let _ = validateWord(word) {
            
            if consumeNote() {
                if consume("º") || consume("°") {
                    return diminuteFlow()
                } else if consume("d") {
                    return dimFlow()
                } else if consume("s") {
                    return susFlow()
                } else if consume("#") || consume("b") {
                    return accidentFlow()
                } else if consume("m") {
                    if peek("a") {
                        return majFlow()
                    } else {
                        return minorFlow()
                    }
                } else if consumeNumber() {
                    return numberFlow()
                } else if consume("/") {
                    return lowFlow()
                } else if consume("a") {
                    return addFlow()
                }
                
                return letters.count <= 0
            }
        }
        
        return false
    }
    
    private func lowFlow() -> Bool {
        
        if consumeNote() {
            let _ = consume("#") || consume("b")
            return letters.count <= 0
        }
        
        return false
    }
    
    private func addFlow() -> Bool {
        
        if consume("d") {
            if consume("d") {
                let _ = consume("4") || consume("9")
                if consume("/") {
                    if consumeNote() {
                        return letters.count <= 0
                    }
                    return false
                }
                
                return letters.count <= 0
            }
        }
        
        return false
    }
    
    private func majFlow() -> Bool {
        if consume("a") {
            if consume("j") {
                let _ = consumeNumber()
                
                if consume("/") {
                    if consumeNote() {
                        return letters.count <= 0
                    }
                    return false
                }
                
                return letters.count <= 0
            }
        }
        
        return false
    }
    
    private func accidentFlow() -> Bool {
        if consume("/") {
            return lowFlow()
        } else if consume("º") || consume("°") {
            return diminuteFlow()
        } else if consume("d") {
            return dimFlow()
        } else if consume("s") {
            return susFlow()
        } else if consume("m") {
            return minorFlow()
        } else if consumeNumber() {
            return numberFlow()
        }
        
        return letters.count <= 0
    }
    
    private func minorFlow() -> Bool {
        if consumeNumber() {
            if consume("-") {
                if consume("/") {
                    if consumeNumber() {
                        return letters.count <= 0
                    }
                    
                    return lowFlow()
                }
            } else if consume("+") {
                if consume("/") {
                    if consumeNumber() {
                        return letters.count <= 0
                    }
                    
                    return lowFlow()
                }
            } else if consume("/") {
                
                if consume("b") || consume("#") {
                    if consumeNumber() {
                        return letters.count <= 0
                    } else {
                        return false
                    }
                } else {
                    if consumeNumber() {
                        let _ = consume("-") || consume("+")
                        return letters.count <= 0
                    } else {
                        return lowFlow()
                    }
                }
            } else if consume("M") {
                return letters.count <= 0
            } else if consume("m") {
                return letters.count <= 0
            } else if consume("(") {
                return parenthesesNumberFlow()
            }
        } else if consume("/") {
            return lowFlow()
        }
        
        return letters.count <= 0
    }
    
    private func numberFlow() -> Bool {
        if consume("(") {
            return parenthesesNumberFlow()
        } else if consume("/") {
            if consumeNumber() {
                if consume("m") || consume("#") {
                    if consume("/") {
                        if consumeNumber() {
                            let _ = consume("m") || consume("#")
                            return letters.count <= 0
                        }
                    } else {
                        return letters.count <= 0
                    }
                } else if consume("/") {
                    if consumeNumber() {
                        let _ = consume("m") || consume("#")
                        return letters.count <= 0
                    }
                    return false
                } else if consume("-") || consume("+") {
                    return letters.count <= 0
                }
                return letters.count <= 0
            } else if consume("b") || consume("#") {
                if consumeNumber() {
                    return letters.count <= 0
                }
                
                return false
            } else {
                return lowFlow()
            }
        } else {
            
            if consume("s") {
                return susFlow()
            } else if consume("m") {
                if consume("/") {
                    return lowFlow()
                }
                
                return letters.count <= 0
            } else if consume("M") {
                if consume("/") {
                    return lowFlow()
                } else if consume("(") {
                    if consumeNumber() {
                        if consume(")") {
                            if consume("/") {
                                return consumeNote()
                            }
                            
                            return letters.count <= 0
                        }
                    }
                    
                    return false
                }
                
                return letters.count <= 0
            } else if consume("+") {
                
                if consume("/") {
                    if consumeNote() {
                        return letters.count <= 0
                    }
                    
                    return false
                }
                
                return letters.count <= 0
            }
        }
        
        return letters.count <= 0
    }
    
    private func parenthesesNumberFlow() -> Bool {
        if consumeNumber() {
            if consume("-") || consume("+") {
                if consume(")") {
                    return letters.count <= 0
                }
            } else if consume("/") {
                if consumeNumber() {
                    if consume("-") || consume("+") {
                        if consume(")") {
                            return letters.count <= 0
                        }
                    }
                }
            }
            
            if consume(")") {
                if consume("/") {
                    if consumeNote() {
                        return letters.count <= 0
                    }
                    return false
                }
                
                return letters.count <= 0
            }
        } else if consume("#") {
            if consumeNumber() {
                if consume(")") {
                    if consume("/") {
                        if consumeNote() {
                            return letters.count <= 0
                        }
                        return false
                    }
                    
                    return letters.count <= 0
                }
            }
        } else if consume("b") {
            if consumeNumber() {
                if consume(")") {
                    if consume("/") {
                        if consumeNote() {
                            return letters.count <= 0
                        }
                        return false
                    }
                    
                    return letters.count <= 0
                }
            }
        }
        
        return false
    }
    
    private func diminuteFlow() -> Bool {
        let _ = consumeNumber()
        
        if consume("/") {
            if consumeNote() {
                return letters.count <= 0
            }
            return false
        }
        
        return letters.count <= 0
    }
    
    private func dimFlow() -> Bool {
        if consume("i") {
            if consume("m") {
                let _ = consume("7")
                return letters.count <= 0
            }
        }
        
        return false
    }
    
    private func susFlow() -> Bool {
        if consume("u") {
            if consume("s") {
                let _ = consume("2") || consume("4")
                
                if consume("/") {
                    if consumeNote() {
                        return letters.count <= 0
                    }
                    return false
                }
                
                return letters.count <= 0
            }
        }
        
        return false
    }
    
    private func validateWord(_ word: String) -> [String]? {
        if word.characters.count <= 0 {
            return nil
        }
        
        if word == "" {
            return nil
        }
        
        if word.trimmingCharacters(in: .whitespaces) == "" {
            return nil
        }
        
        var letters = [String]()
        for letter in word.characters {
            letters.append(String(letter))
        }
        
        self.letters = letters
        
        return letters
    }
    
    private func consume(_ letterConsume: String) -> Bool {
        if let first = letters.first {
            if first == letterConsume {
                letters.remove(at: 0)
                return true
            }
        }
        
        return false
    }
    
    private func consumeNote() -> Bool {
        let possibleLetters = ["A", "B", "C", "D", "E", "F", "G"]
        if let first = letters.first {
            for letter in possibleLetters {
                if first == letter {
                    letters.removeFirst()
                    
                    let peekSus = peek("#")
                    if (peekSus && (letter == "B" || letter == "E")) {
                        return false
                    }
                    
                    let peekBemol = peek("b")
                    if (peekBemol && (letter == "C" || letter == "F")) {
                        return false
                    }
                    
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    private func consumeNumber() -> Bool {
        
        if let letter = letters.first {
            for number in ["1", "4", "5", "6", "7", "8", "9"] {
                if letter == number {
                    if letter == "1" {
                        if peekNumber() {
                            letters.removeFirst()
                            if let letter = letters.first {
                                for number in ["1", "2", "3", "5"] {
                                    if letter == number {
                                        letters.removeFirst()
                                        return true
                                    }
                                }
                            }
                        }
                        
                        return false
                    } else {
                        letters.removeFirst()
                    }
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    private func peek(_ letterPeek: String) -> Bool {
        if let first = letters.first {
            if first == letterPeek {
                return true
            }
        }
        
        return false
    }
    
    private func peekNumber() -> Bool {
        if letters.count >= 2 {
            let letter = letters[1]
            for number in ["1", "2", "3", "5"] {
                if letter == number {
                    return true
                }
            }
        }
        
        return false
    }

}
