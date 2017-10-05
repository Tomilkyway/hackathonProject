//
//  ExoTableViewCell.swift
//  Hackathon
//
//  Created by Thomas Pain-Surget on 05/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class ExoTableViewCell: UITableViewCell {

    var exercice: Exercice? {
        didSet{
            if let i = exercice?.title {
                exercice_title.text = i
            }
        }
    }
    
    let contnaireView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let profileImage: UIImageView = {
        let p = UIImageView()
        p.contentMode = .scaleAspectFit
        p.translatesAutoresizingMaskIntoConstraints = false
        p.backgroundColor = .red
        p.layer.cornerRadius = 20
        p.layer.masksToBounds = true
        return p
    }()
    
    let name: UILabel = {
        let n = UILabel()
        n.text = "Thomas PS"
        n.font = UIFont.systemFont(ofSize: 14)
        n.textColor = .flatBlack
        n.translatesAutoresizingMaskIntoConstraints = false
        return n
    }()
    
    let date: UILabel = {
        let n = UILabel()
        n.text = "2017/10/6"
        n.font = UIFont.systemFont(ofSize: 10)
        n.textColor = .flatGray
        n.translatesAutoresizingMaskIntoConstraints = false
        return n
    }()
    
    let exercice_title: UILabel = {
        let n = UILabel()
        n.text = "Does it work bro Does it work bro Does it work bro Does it work bro ?"
        n.font = UIFont.boldSystemFont(ofSize: 22)
        n.textColor = .flatBlack
        n.translatesAutoresizingMaskIntoConstraints = false
        n.numberOfLines = 0
        return n
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(){
        
        setupLayout()
    }
    
    
    func setupLayout(){
        addSubview(contnaireView)
        
        contnaireView.addSubview(profileImage)
        contnaireView.addSubview(name)
        contnaireView.addSubview(date)
        contnaireView.addSubview(exercice_title)
        
        contnaireView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        contnaireView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        contnaireView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        contnaireView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
        
        profileImage.topAnchor.constraint(equalTo: contnaireView.topAnchor, constant: 8).isActive = true
        profileImage.leftAnchor.constraint(equalTo: contnaireView.leftAnchor, constant: 10).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        name.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 0).isActive = true
        name.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 8).isActive = true
        name.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 0).isActive = true
        date.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 8).isActive = true
        date.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        exercice_title.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        exercice_title.leftAnchor.constraint(equalTo: contnaireView.leftAnchor, constant: 10).isActive = true
        exercice_title.rightAnchor.constraint(equalTo: contnaireView.rightAnchor, constant: -10).isActive = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected == true{
            contnaireView.layer.borderWidth = 3
            contnaireView.layer.borderColor = UIColor.flatRed.cgColor
        } else {
            contnaireView.layer.borderWidth = 0
            contnaireView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
}
