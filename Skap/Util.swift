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
    
    class func dateToMs(date: NSDate?) -> Int {
        if (date == nil) {
            return 0;
        } else {
            return (Int((date?.timeIntervalSince1970)!) * 1000)
        }
    }
    
}
