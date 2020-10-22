//
//  NasaCollectionViewController.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 15/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import UIKit

class NasaCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let items = ["Item 1", "Item2", "Item3", "Item4"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "NasaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "nasaCollectionViewCell")
        
        
        
        self.view.backgroundColor = .red

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "nasaCollectionViewCell", for: indexPath) as! NasaCollectionViewCell
        cell.titleLabel.text = items[indexPath.row]
       
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
