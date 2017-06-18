//
//  NoteViewController.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 21/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelNote: UILabel!
    @IBOutlet weak var labelValidChord: UILabel!        
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var verticalSpaceTextField: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.borderColor = #colorLiteral(red: 0.4190416336, green: 0.3278442919, blue: 0.7069011331, alpha: 1).cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textString = textField.text as NSString?
        let text = textString?.replacingCharacters(in: range, with: string)
        
        if text?.isEmpty ?? false {
            self.navigationItem.title = "Acordes"
            labelValidChord.isHidden = true
            labelNote.text = "Digite um acorde"
            
            return true
        } else {
            self.navigationItem.title = "Digite um acorde"
        }
        
        let happyEmojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😎", "😏", "🤠"]
        let sadEmojis = ["😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫"]
        
        let randomHappyIndex = Int(arc4random_uniform(UInt32(happyEmojis.count)))
        let randomSadIndex = Int(arc4random_uniform(UInt32(sadEmojis.count)))
        
        labelNote.text = text
        
        labelValidChord.isHidden = false
        labelValidChord.text = Chords().isChord(word: text!) ? "Acorde Válido \(happyEmojis[randomHappyIndex])" : "Acorde Inválido \(sadEmojis[randomSadIndex])"
        labelValidChord.textColor = Chords().isChord(word: text!) ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            verticalSpaceTextField.constant = keyboardSize.height - (self.tabBarController?.tabBar.frame.size.height ?? 0)
            let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 1
            UIView.animate(withDuration: animationDuration, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        verticalSpaceTextField.constant = 0
        let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 1
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
        })
    }

}
