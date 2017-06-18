//
//  IdentifiedChordsNavigationViewController.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 21/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

class IdentifiedChordsNavigationViewController: UINavigationController {

    var notes : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewController = self.viewControllers.first as! IdentifiedChordsViewController
        viewController.notes = notes
    }

}
