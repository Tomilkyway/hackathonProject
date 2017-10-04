//
//  SessionUser.swift
//  Hackathon
//
//  Created by Henri Gil on 04/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class SessionUser: NSObject {

    static let shared = SessionUser()
    
    var id_user: String?
    var token: String?
}
