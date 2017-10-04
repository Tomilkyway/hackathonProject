//
//  Question.swift
//  Hackathon
//
//  Created by Henri Gil on 04/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class Question: NSObject {
    
    weak var lesson: Lesson?
    var id: String?
    var id_user: String?
    var role_user: String?
    var question: String?
    var favorite: String?
}
