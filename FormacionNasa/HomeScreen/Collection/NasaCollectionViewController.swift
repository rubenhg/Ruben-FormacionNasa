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
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Collection"
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "NasaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "nasaCollectionViewCell")

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "nasaCollectionViewCell", for: indexPath) as! NasaCollectionViewCell
        cell.titleLabel.text = nasaData?.title
        cell.dateLabel.text = nasaData?.date
        cell.image.image = UIImage(url: URL(string: nasaData?.image ?? ""))
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let detailVC = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
            detailVC.modalPresentationStyle = .fullScreen
            self.present(detailVC, animated: true, completion: nil)
    }


}
