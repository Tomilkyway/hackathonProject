//
//  ComposeBar.swift
//  Hackathon
//
//  Created by Thomas Pain-Surget on 05/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

import NVActivityIndicatorView

protocol composeBarDelegate: NSObjectProtocol {
    func updateSize(heigth: CGFloat)
}

class ComposeBar: UIView, UITextViewDelegate{
    
    
    
    weak var delegate: composeBarDelegate?
    
    var idThreadRep: String?
    var maxCharacters: Int = 2050
    
    var widthSendBut: NSLayoutConstraint?
    var heigthTextView: NSLayoutConstraint?
    var heightView: NSLayoutConstraint?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    lazy var textView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.delegate = self
        text.layer.cornerRadius = 3
        text.layer.masksToBounds = true
        text.backgroundColor = .clear
        text.keyboardType = UIKeyboardType.twitter
        text.textContainerInset = UIEdgeInsetsMake(10, 6, 3, 6)
        text.font = UIFont.systemFont(ofSize: 16)
        return text
    }()
    
    let placeHolder: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.backgroundColor = .white
        lab.textColor = UIColor.lightGray
        lab.font = UIFont.systemFont(ofSize: 13)
        lab.text = NSLocalizedString("Post a comment", comment: "")
        lab.textAlignment = .left
        return lab
    }()
    
    let sendButton: UIButton = {
        let but = UIButton()
        but.backgroundColor = .flatWhite
        but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        but.setTitle(NSLocalizedString("SEND", comment: ""), for: .normal)
        but.titleLabel?.sizeToFit()
        but.setTitleColor(.flatBlack, for: .normal)
        but.layer.cornerRadius = 10
        but.translatesAutoresizingMaskIntoConstraints = false
        return but
    }()
    
    let countLab: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.backgroundColor = .clear
        lab.text = "0/0"
        lab.textAlignment = .center
        lab.font = UIFont.boldSystemFont(ofSize: 10)
        lab.textColor = UIColor.flatBlack
        lab.isHidden = true
        return lab
    }()
    
    let activityIndicator: NVActivityIndicatorView = {
        let ac = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30) , type: .ballPulseSync, color: .flatWhiteDark, padding: 3)
        ac.translatesAutoresizingMaskIntoConstraints = false
        ac.backgroundColor = .clear
        return ac
    }()
    
    let shadowBar: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1)
        return v
    }()
    
    
    
    func setupView(){
        
        self.backgroundColor = .white
        sendButton.addTarget(self, action: #selector(sendComment), for: .touchUpInside)
        
        
        
        addSubview(shadowBar)
        addSubview(placeHolder)
        addSubview(textView)
        addSubview(sendButton)
        addSubview(countLab)
        addSubview(activityIndicator)
        
        //heigthTextView = textView.heightAnchor.constraint(equalToConstant: 45)
        //heigthTextView?.isActive = true
        
        shadowBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        shadowBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        shadowBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        shadowBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        
        placeHolder.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        placeHolder.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        placeHolder.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -15).isActive = true
        placeHolder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        
        textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        textView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        textView.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -15).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        
        
        widthSendBut = sendButton.widthAnchor.constraint(equalToConstant: 0)
        widthSendBut?.isActive = true
        sendButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        
        activityIndicator.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: sendButton.centerXAnchor).isActive = true
        
        countLab.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: 0).isActive = true
        countLab.widthAnchor.constraint(equalToConstant: 70).isActive = true
        countLab.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countLab.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        
    }
    
    
    var tmp: String = ""
    
    @objc func sendComment(){
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        checkSizeText()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        //        placeHolder.isHidden = true
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.characters.count
        
        if numberOfChars > maxCharacters {
            return false
        }
        
        
        countLab.text = "\(numberOfChars)/\(maxCharacters)"
        
        sendDelegateUpdateSize(height: textView.contentSize.height)
        
        checkSizeText()
        return true
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        sendDelegateUpdateSize(height: textView.contentSize.height)
        // basede 36
        checkSizeText()
    }
    
    func checkSizeText(){
        
        if textView.frame.height >  46 {
            countLab.isHidden = false
        }
        else {
            countLab.isHidden = true
        }
        
        if textView.text.characters.count > 0  && widthSendBut?.constant == 0  {
            textView.backgroundColor = .white
            widthSendBut?.constant = 70
            updateLayout()
        }
        else if textView.text.characters.count == 0 {
            textView.backgroundColor = .clear
            widthSendBut?.constant = 0
            updateLayout()
        }
        
    }
    
    func sendDelegateUpdateSize(height: CGFloat){
        
        if height < 150 {
            delegate?.updateSize(heigth: height)
        } else {
            delegate?.updateSize(heigth: 150)
        }
    }
    
    func updateLayout(){
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.layoutIfNeeded()
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("ComposeBar deinit")
    }
    
}

    func color(_ rgbColor: Int) -> UIColor{
        return UIColor(
            red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
            blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
            alpha: CGFloat(1.0)
        )
}

