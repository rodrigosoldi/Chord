//
//  ViewNote.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 01/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

@IBDesignable
class ViewNote: UIView {
    
    @IBInspectable var color : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var labelHouseToPlay: UILabel?
    
    func clearNote() {
        if let sublayers = self.layer.sublayers {
            for layer in sublayers {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    func drawNotes(_ notes: [(Int, Int)], pestana: (Int, Int)? = nil, houseHidden: Int? = nil, letterHouseToPlay: String? = nil, houseToPLay: Int? = nil, stringsToPlay: [(StringToPlay)]? = nil) -> ViewNote {
        
        for note in notes {
            
            if note.0 == houseHidden {
                continue
            }
            
            let path = drawNote(house: note.0, string: note.1)
            let l = layer(fromNote: path)
            self.layer.addSublayer(l)
        }
        
        if let pestana = pestana {
            let path = drawPestana(house: pestana.0, string: pestana.1)
            let l = layerPestana(fromNote: path)
            self.layer.addSublayer(l)
        }
        
        if let letterHouseToPlay = letterHouseToPlay, let houseHToPlay = houseToPLay {
            draw(houseToPlay: letterHouseToPlay, house: houseHToPlay)
        }
        
        if let stringsToPlay = stringsToPlay {
            drawStringToPlay(strings: stringsToPlay)
        }
        
        return self
    }
    
    func drawNotesInLayers(_ notes: [(Int, Int)]) -> [CAShapeLayer] {
        
        var layers = [CAShapeLayer]()
        for note in notes {
            let path = drawNote(house: note.0, string: note.1)
            let l = layer(fromNote: path)
            layers.append(l)
        }
        
        return layers
    }
    
    func drawNote(house: Int, string: Int) -> UIBezierPath {
        return circle(house: house, string: string)
    }
    
    func drawPestana(house houveH: Int, string stringV: Int) -> UIBezierPath {
        return drawPestana(self.frame.size, house: houveH, string: stringV)
    }
    
    private func drawPestana(_ size: CGSize, house houveH: Int, string stringV: Int) -> UIBezierPath {
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let y = house(houveH)
        let x = string(stringV)
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * x - (widthSlice / 2.5), y: heightSlice * y))
        bezier.addLine(to: CGPoint(x: widthSlice * 11, y: heightSlice * y))
        bezier.lineWidth = 10.0
        
        return bezier
    }
    
    private func drawStringToPlay(strings: [(StringToPlay)]) {
        
        for (index, element) in strings.enumerated() {
            let string = 6 - index
            
            switch element {
            case .DontPlay:
                let xd = x(string: string)
                let l = layerPestana(fromNote: xd, lineWidth: 2.0)
                self.layer.addSublayer(l)
                break
            case .Bass:
                let c = circle(house: 6, string: string)
                let l = layer(fromNote: c)
                self.layer.addSublayer(l)
                break
                
            case .Play:
                let c = circle(house: 6, string: string)
                let l = layerStroke(fromNote: c)
                self.layer.addSublayer(l)
                break
            }
        }
        
    }
    
    func draw(houseToPlay: String, house houseH: Int) {
        let widthSlice = self.frame.size.width / 12
        let heightSlice = self.frame.size.height / 10
        
        let frame = CGRect(x: widthSlice / 4, y: heightSlice * house(houseH) - (heightSlice / 3.5), width: widthSlice * 1.5, height: heightSlice / 2)
        self.labelHouseToPlay = UILabel(frame: frame)
        self.labelHouseToPlay?.text = houseToPlay
        self.labelHouseToPlay?.textColor = color
        self.labelHouseToPlay?.font = UIFont.boldSystemFont(ofSize: heightSlice / 2)
        
        if let label = self.labelHouseToPlay {
            self.addSubview(label)
        }
        
    }
    
    private func layer(fromNote path: UIBezierPath) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = color.cgColor
        layer.strokeColor = color.cgColor
        
        return layer
    }
    
    private func layerStroke(fromNote path: (UIBezierPath)) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = color.cgColor
        layer.fillColor = UIColor.clear.cgColor
        
        return layer
    }
    
    private func layerPestana(fromNote path: UIBezierPath, lineWidth: CGFloat = 10.0) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = color.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = lineWidth
        
        return layer
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let firstHLine = firstHorizontalLine()
        let secondHLine = secondHorizontalLine()
        let thirdHLine = thirdHorizontalLine()
        let fourthHLine = fourthHorizontalLine()
        let fivethHLine = fivethHorizontalLine()
        
        let firstVLine = firstVerticalLine()
        let secondVLine = secondVerticalLine()
        let thirdVLine = thirdVerticalLine()
        let fourthVLine = fourthVerticalLine()
        let fivethVLine = fivethVerticalLine()
        let sixthVLine = sixthVerticalLine()
        
        color.setStroke()
        
        firstHLine.stroke()
        secondHLine.stroke()
        thirdHLine.stroke()
        fourthHLine.stroke()
        fivethHLine.stroke()
        
        firstVLine.stroke()
        secondVLine.stroke()
        thirdVLine.stroke()
        fourthVLine.stroke()
        fivethVLine.stroke()
        sixthVLine.stroke()
        
//        // Tests
//
//        let pestana = drawPestana(house: 2, string: 6)
//        pestana.stroke()
//        let circ = circle(house: 6, string: 5)
//        let l = layer(fromNote: circ)
//        self.layer.addSublayer(l)
//        
//        let circ2 = circle(house: 6, string: 4)
//        let l2 = layerStroke(fromNote: circ2)
//        self.layer.addSublayer(l2)
//        
//        let xd = x(string: 6)
//        let la = layerPestana(fromNote: xd, lineWidth: 2.0)
//        self.layer.addSublayer(la)
    }

}

extension ViewNote {
    
    func house(_ value: Int) -> CGFloat {
        
        var houseValue = 0.0
        
        if value == 1 {
            houseValue = 1.75
        } else if value == 2 {
            houseValue = 3.25
        } else if value == 3 {
            houseValue = 4.75
        } else if value == 4 {
            houseValue = 6.25
        } else if value == 5 {
            houseValue = 7.75
        } else if value == 6 {
            houseValue = 9.25
        }
        
        return CGFloat(houseValue)
    }
    
    func string(_ value: Int) -> CGFloat {
        var stringValue = 0.0
        
        if value == 6 {
            stringValue = 2.0
        } else if value == 5 {
            stringValue = 3.5
        } else if value == 4 {
            stringValue = 5.0
        } else if value == 3 {
            stringValue = 6.5
        } else if value == 2 {
            stringValue = 8.0
        } else if value == 1 {
            stringValue = 9.5
        }
        
        return CGFloat(stringValue)
    }
    
}

extension ViewNote {
    
    func circle(house houveV: Int, string stringV: Int) -> UIBezierPath {
        return circle(size: self.frame.size, house: houveV, string: stringV)
    }
    
    func circle(size: CGSize, house houveV: Int, string stringV: Int) -> UIBezierPath {
        
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let pointC = CGPoint(x: widthSlice * string(stringV), y: heightSlice * house(houveV))
        
        let bezier = UIBezierPath()
        bezier.addArc(withCenter: pointC, radius: widthSlice / 1.6, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        return bezier
    }
    
    func x(string stringV: Int) -> UIBezierPath {
        return x(size: self.frame.size, string: stringV)
    }
    
    func x(size: CGSize, string stringV: Int) -> UIBezierPath {
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let slice = UIDevice.current.userInterfaceIdiom == .phone ? CGFloat(130) : CGFloat(200)
        let divSlice = CGFloat(2)
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * string(stringV) - (widthSlice / divSlice), y: heightSlice * house(6) - (heightSlice / 3)))
        bezier.addLine(to: CGPoint(x: widthSlice * string(stringV) + (widthSlice / divSlice), y: heightSlice * (house(6) + (heightSlice / slice))))
        
        let bezier2 = UIBezierPath()
        bezier2.move(to: CGPoint(x: widthSlice * string(stringV) + (widthSlice / divSlice), y: heightSlice * house(6) - (heightSlice / 3)))
        bezier2.addLine(to: CGPoint(x: widthSlice * string(stringV) - (widthSlice / divSlice), y: heightSlice * (house(6) + (heightSlice / slice))))
        
        bezier.append(bezier2)
        
        return bezier
    }
    
}

extension ViewNote {
    
    func firstHorizontalLine() -> UIBezierPath {
        return firstHorizontalLine(self.frame.size)
    }
    
    func secondHorizontalLine() -> UIBezierPath {
        return secondHorizontalLine(self.frame.size)
    }
    
    func thirdHorizontalLine() -> UIBezierPath {
        return thirdHorizontalLine(self.frame.size)
    }
    
    func fourthHorizontalLine() -> UIBezierPath {
        return fourthHorizontalLine(self.frame.size)
    }
    
    func fivethHorizontalLine() -> UIBezierPath {
        return fivethHorizontalLine(self.frame.size)
    }
    
    func firstHorizontalLine(_ size: CGSize) -> UIBezierPath {
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 2, y: heightSlice))
        bezier.addLine(to: CGPoint(x: widthSlice * 9 + (widthSlice / 2), y: heightSlice))
        bezier.lineWidth = 6.0
        
        return bezier
    }
    
    func secondHorizontalLine(_ size: CGSize) -> UIBezierPath {
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 2, y: heightSlice * 2.5))
        bezier.addLine(to: CGPoint(x: widthSlice * 9 + (widthSlice / 2), y: heightSlice * 2.5))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func thirdHorizontalLine(_ size: CGSize) -> UIBezierPath {
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 2, y: heightSlice * 4))
        bezier.addLine(to: CGPoint(x: widthSlice * 9 + (widthSlice / 2), y: heightSlice * 4))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func fourthHorizontalLine(_ size: CGSize) -> UIBezierPath {
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 2, y: heightSlice * 5.5))
        bezier.addLine(to: CGPoint(x: widthSlice * 9 + (widthSlice / 2), y: heightSlice * 5.5))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func fivethHorizontalLine(_ size: CGSize) -> UIBezierPath {
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 2, y: heightSlice * 7))
        bezier.addLine(to: CGPoint(x: widthSlice * 9 + (widthSlice / 2), y: heightSlice * 7))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
}

extension ViewNote {
    
    func firstVerticalLine() -> UIBezierPath {
        return firstVerticalLine(self.frame.size)
    }
    
    func secondVerticalLine() -> UIBezierPath {
        return secondVerticalLine(self.frame.size)
    }
    
    func thirdVerticalLine() -> UIBezierPath {
        return thirdVerticalLine(self.frame.size)
    }
    
    func fourthVerticalLine() -> UIBezierPath {
        return fourthVerticalLine(self.frame.size)
    }
    
    func fivethVerticalLine() -> UIBezierPath {
        return fivethVerticalLine(self.frame.size)
    }
    
    func sixthVerticalLine() -> UIBezierPath {
        return sixthVerticalLine(self.frame.size)
    }
    
    func firstVerticalLine(_ size: CGSize) -> UIBezierPath {
        
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 2 + 1, y: heightSlice))
        bezier.addLine(to: CGPoint(x: widthSlice * 2 + 1, y: heightSlice * 8))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func secondVerticalLine(_ size: CGSize) -> UIBezierPath {
        
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 3.5 + 1, y: heightSlice))
        bezier.addLine(to: CGPoint(x: widthSlice * 3.5 + 1, y: heightSlice * 8))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func thirdVerticalLine(_ size: CGSize) -> UIBezierPath {
        
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 5 + 1, y: heightSlice))
        bezier.addLine(to: CGPoint(x: widthSlice * 5 + 1, y: heightSlice * 8))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func fourthVerticalLine(_ size: CGSize) -> UIBezierPath {
        
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 6.5 + 1, y: heightSlice))
        bezier.addLine(to: CGPoint(x: widthSlice * 6.5 + 1, y: heightSlice * 8))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func fivethVerticalLine(_ size: CGSize) -> UIBezierPath {
        
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 8 + 1, y: heightSlice))
        bezier.addLine(to: CGPoint(x: widthSlice * 8 + 1, y: heightSlice * 8))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
    func sixthVerticalLine(_ size: CGSize) -> UIBezierPath {
        
        let widthSlice = size.width / 12
        let heightSlice = size.height / 10
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: widthSlice * 9.5 - 1, y: heightSlice))
        bezier.addLine(to: CGPoint(x: widthSlice * 9.5 - 1, y: heightSlice * 8))
        bezier.lineWidth = 2.0
        
        return bezier
    }
    
}
