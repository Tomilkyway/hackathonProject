////
////  ExoViewController.swift
////  Hackathon
////
////  Created by Thomas Pain-Surget on 05/10/2017.
////  Copyright © 2017 Henri Gil. All rights reserved.
////
//
//import UIKit
//
//class ExoViewController: UIViewController, exoSelectedDelegate {
//
//    var exercices = [Exercice]()
//    var sizes = [Int : CGFloat]()
//    let cellID = "cellID"
//    var composeHeigth: NSLayoutConstraint?
//    var idThreadReponse: String? = "21"
//
//
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .flatWhite
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.delegate = self
//        cv.dataSource = self
//        return cv
//    }()
//
//    lazy var composeBar: ComposeBar = {
//        let compose = ComposeBar()
//        compose.translatesAutoresizingMaskIntoConstraints = false
//        compose.delegate = self
//        return compose
//    }()
//
//    var exercice: Exercice? {
//        didSet{
//            print(exercice?.title)
//            print(exercice?.desc)
//            print(exercice?.content)
//            configFakeData()
//            collectionView.reloadData()
//        }
//    }
//
//    func exoSelected(exoRecieved: Exercice) {
//        print("Done")
//        exercice = exoRecieved
//
//    func configFakeData(){
//         = [Answer]()
//
//        for _ in 0...10 {
//            let q = Answer()
//            q.answer = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//            q.role_user = "0"
//            q.type_answer = "0"
//            answers.append(q)
//        }
//
//        collectionView.reloadData()
//
//        if answers.count > 0{
//            let index = IndexPath(item: 0, section: 0)
//            collectionView.scrollToItem(at: index, at: .top, animated: true)
//        }
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .flatWhite
//        // Do any additional setup after loading the view.
//        configFakeData()
//        setupCV()
//        setupLayout()
//    }
//
//    func setupCV(){
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
//        {
//            layout.scrollDirection = .vertical
//            layout.minimumLineSpacing = 10
//        }
//
//
//        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
//        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.isPagingEnabled = false
//        collectionView.register(AnswerCell.self, forCellWithReuseIdentifier: cellID)
//    }
//
//    var tabBarHeigh: CGFloat = 49
//
//    func setupLayout(){
//        view.addSubview(collectionView)
//        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//
//
//        composeBar.idThreadRep = idThreadReponse
//        view.addSubview(composeBar)
//        composeBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tabBarHeigh).isActive = true
//        composeBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        composeBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        composeHeigth = composeBar.heightAnchor.constraint(equalToConstant: 47)
//        composeHeigth?.isActive = true
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//}
//
//
//extension AnswerViewController: composeBarDelegate {
//    func updateSize(heigth: CGFloat) {
//        composeHeigth?.constant = heigth + 20
//        self.view.layoutIfNeeded()
//    }
//}
//
//extension AnswerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return answers.count
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID , for: indexPath) as! AnswerCell
//        cell.backgroundColor = .flatWhite
//        cell.answer = answers[indexPath.item]
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let answer = answers[indexPath.item].answer else {return CGSize(width: collectionView.frame.width, height: 0)}
//
//        if let h = sizes[indexPath.item] {
//            let sizeFound = CGSize(width: collectionView.frame.width, height: h)
//            return sizeFound
//        }
//
//        let width = collectionView.frame.width-(8+8+10+10)
//        let questionHeight = Utility.shared.getStringSize(message: answer , width: Int(width), fontSize: UIFont.systemFont(ofSize: 20))
//        let height: CGFloat = 5+8+40+10+5
//        let hFound: CGFloat = CGFloat(questionHeight)+height
//        sizes[indexPath.item] = hFound
//
//        return CGSize(width: Int(collectionView.frame.width) , height: Int(hFound))
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//}

