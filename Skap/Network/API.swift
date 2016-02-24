//
//  API.swift
//  Skap
//
//  Created by Bingee on 2/22/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

import Foundation


class API {
    
    class func syncGetSongs() {
        API.getSongs(true)
    }
    
    class func asyncGetSongs() {
        API.getSongs(false)
    }
    
    
    private class func getSongs(syncRequest: Bool) {
        func submitRequest() {
            
        }
        
        if (syncRequest) {
            submitRequest()
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                submitRequest()
            })
        }
    }
    
}