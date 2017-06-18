//
//  TextViewController.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 21/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    var notes : [String] = []
    
    @IBAction func didExtractChords(_ sender: Any) {
        self.view.endEditing(true)
        notes = Chords().chords(from: textView.text, noRepeat:  true)
        self.performSegue(withIdentifier: "showChordsIdentifier", sender: nil)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showChordsIdentifier" {
            let viewController = segue.destination as! IdentifiedChordsNavigationViewController
            viewController.notes = notes
        }
    }
 

}
