//
//  Utility.swift
//  Hackathon
//
//  Created by Henri Gil on 04/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class Utility: NSObject {

    func getStringSize(message: String, width: Int , fontSize: Int) -> CGFloat{
        
        let size = CGSize(width: width - 20, height: 1000)
        let stringOption = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimateSize = NSString(string: message).boundingRect(with: size, options: stringOption, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17) ], context: nil)
        
        let height = estimateSize.height + 15
        return CGFloat(height)
        
    }
    
}
