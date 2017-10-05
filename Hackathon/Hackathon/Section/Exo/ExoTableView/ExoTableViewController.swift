//
//  ExoTableViewController.swift
//  Hackathon
//
//  Created by Thomas Pain-Surget on 05/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

protocol exoSelectedDelegate: NSObjectProtocol {
    func exoSelected(exoRecieved: Exercice)
}

class ExoTableViewController: UITableViewController {
    
    weak var delegate: exoSelectedDelegate?
    
    var lesson: Lesson?
    var exos = [Exercice]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .flatWhite
        
        setupTableView()
        configFakeData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func configFakeData(){
        
        if let extracted = lesson {
            
            for index in 0...10 {
                let e = Exercice()
                e.id = "\(index)"
                e.id_user = SessionUser.shared.id_user
                e.lesson = extracted
                e.role_user = "0"
                e.title = "Titre1_ Titre1_ Titre1_ Titre1_ Titre1_ Titre1_ Titre1_ Titre1_ Titre1_ \(index)"
                
                exos.append(e)
            }
            
            tableView.reloadData()
        }
        
    }
    
    func setupTableView(){
        tableView.register(ExoTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .flatWhite
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .flatWhite
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.exoSelected(exoRecieved: exos[indexPath.item])
    }
    
    var sizes = [Int: CGFloat]()
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let exo = exos[indexPath.item].title else {return 0}
        
        if let h = sizes[indexPath.item] {
            return h
        }
        
        let width = tableView.frame.width-(8+2+10+10)
        let questionHeight = Utility.shared.getStringSize(message: exo , width: Int(width), fontSize: UIFont.boldSystemFont(ofSize: 22))
        let height: CGFloat = 2+8+40+10
        let hFound: CGFloat = CGFloat(questionHeight)+height
        sizes[indexPath.item] = hFound
        return hFound
    }
    
}

