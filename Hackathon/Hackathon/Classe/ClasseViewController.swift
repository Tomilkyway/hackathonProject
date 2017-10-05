//
//  ClasseViewController.swift
//  Hackathon
//
//  Created by Thomas Pain-Surget on 05/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class ClasseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let cellId: String = "Cell"
    let matieres = ["Androïd", "iOS", "Electronique", "C++", "APIs du Cloud", "Réseaux", "Marketing Mobile", "Projet Annuel", "Langage C", "UML", "Planification SI", "Maths"]
    let nbCourses = ["6", "11", "3", "9", "4", "2", "9", "5", "7", "3", "15", "8"]
    
    override func viewDidLoad() {
        
        //DEL
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.viewDidLoad()
        
        
        collectionView.register(UINib.init(nibName: "CellView", bundle: nil), forCellWithReuseIdentifier: cellId)
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
        return matieres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CellView
        
        cell.titleCourse.text = matieres[indexPath.item]
        cell.nbCourses.text = "\(nbCourses[indexPath.item]) cours disponible(s)"
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let v = ExoListViewController()
        let le = Lesson()
        v.lesson = le
        self.present(v, animated: true, completion: nil)
    }
    
}

