//
//  ClasseViewController.swift
//  Hackathon
//
//  Created by Thomas Pain-Surget on 05/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class ClasseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var classeCollectionView: UICollectionView!
    let cellId: String = "Cell"
    let year = ["1i", "2i", "3A", "4A"]
    let spec = ["", "", "MOC", "MOC"]
    let promo = ["2014/2015", "2015/2016", "2016/2017", "2017/2018"]
    
    override func viewDidLoad() {
        
        //DEL
        
        classeCollectionView.delegate = self
        classeCollectionView.dataSource = self
        
        super.viewDidLoad()
        
        classeCollectionView.register(UINib.init(nibName: "ClasseCellView", bundle: nil), forCellWithReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return year.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ClasseCellView
        
        cell.classYearAndSpec.text = "\(year[indexPath.item]) \(spec[indexPath.item])"
        cell.classPromo.text = "Promotion \(promo[indexPath.item])"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 2, height: (collectionView.frame.height / 4) - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}

