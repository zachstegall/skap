//
//  Util.swift
//  Skap
//
//  Created by Zachary Stegall on 2/20/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

import Foundation

class Util: NSObject {
    
    class func getCurrentTimestampMS() -> Int64 {
        return Int64((NSDate().timeIntervalSince1970)*1000)
    }
    
}
