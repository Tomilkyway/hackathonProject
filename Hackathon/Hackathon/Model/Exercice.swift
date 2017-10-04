//
//  Exercice.swift
//  Hackathon
//
//  Created by Henri Gil on 04/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class Exercice: NSObject {

    var id: String?
    var id_user: String?
    var role_user: String?
    var title: String?
    var desc: String?
    var content: String?
    var link: String?
    weak var lesson: Lesson?
}
