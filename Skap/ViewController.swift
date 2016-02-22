//
//  ViewController.swift
//  Skap
//
//  Created by Zachary Stegall on 2/13/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var sessionPlayed: AnyObject?
    var sessionTimestamp: Int64?
    var sessionIds: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadIdsFromDisk()
        sessionTimestamp = Util.getCurrentTimestampMS()
        sessionIds?.addObject(NSNumber.init(longLong: sessionTimestamp!))
        grabRecentlyPlayed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFromDisk(ts: Int64) {
        let defaults = NSUserDefaults.standardUserDefaults()
        var key = "session_played"
        key.appendContentsOf(String(format: "%llu", ts))
        sessionPlayed = defaults.objectForKey(key)
    }
    
    func loadIdsFromDisk() {
        let defaults = NSUserDefaults.standardUserDefaults()
        sessionIds = defaults.objectForKey("session_ids")
    }
    
    func saveToDisk() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(sessionPlayed, forKey: "session_played")
        defaults.setObject(NSNumber.init(longLong: sessionTimestamp!), forKey: "session_timestamp")
        defaults.setObject(sessionIds, forKey: "session_ids")
    }
    
    
    
    
    
    func grabRecentlyPlayed() {
        
        let collections = MPMediaQuery.playlistsQuery().collections
        let recentlyPlayed = "Recently Played"
        if collections != nil {
            var foundRecentlyPlayed = false
            for collection in collections! {
                let playlistName = collection.valueForProperty(MPMediaPlaylistPropertyName)
                if playlistName as! String == recentlyPlayed {
                    foundRecentlyPlayed = true
                    var recentlyPlayedItems = [SKAPMediaItem]()
                    for item in collection.items {
                        let newitem = parseMediaItem(item)
                        recentlyPlayedItems.append(newitem)
                    }
                    
                    sessionPlayed = recentlyPlayedItems
                    saveToDisk()
                }
                
                if foundRecentlyPlayed {
                    break
                }
            }
        }
        
    }
    
    
    func parseMediaItem(item: MPMediaItem) -> SKAPMediaItem {
        let skapItem = SKAPMediaItem.init()
        skapItem.set(item)
        return skapItem
    }


}

