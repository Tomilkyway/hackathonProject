//
//  Video.swift
//  Hackathon
//
//  Created by Henri Gil on 04/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var id: String?
    var link: String?
    var desc: String?
    var title: String?
    weak var lesson: Lesson?
}
