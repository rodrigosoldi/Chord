//
//  IdentifiedChordsViewController.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 21/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

class IdentifiedChordsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    public var notes : [String] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellWidth : CGFloat = collectionView.frame.size.width / 5.0
        let cellheight : CGFloat = cellWidth
        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IdentifiedChordsCollectionViewCell
        cell.layer.borderColor = #colorLiteral(red: 0.4190416336, green: 0.3278442919, blue: 0.7069011331, alpha: 1).cgColor
        cell.labelNote.text = notes[indexPath.item]
        return cell
    }
    
    @IBAction func didPressCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
