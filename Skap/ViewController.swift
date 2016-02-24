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
    
    var sessionPlayed: Dictionary<Int, SKAPMediaItem>?
    let sessionPlayedKey = "session_played"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadFromDisk()
        grabRecentlyPlayed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFromDisk() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.valueForKey(sessionPlayedKey) != nil) {
            let data: NSData = (defaults.objectForKey(sessionPlayedKey) as? NSData)!
            sessionPlayed = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Dictionary<Int, SKAPMediaItem>
        }
    }
    
    func saveToDisk() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if (sessionPlayed != nil) {
            let data = NSKeyedArchiver.archivedDataWithRootObject(sessionPlayed!)
            defaults.setObject(data, forKey: sessionPlayedKey)
        }
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
                    
                    insertRecentlyPlayedIntoSession(recentlyPlayedItems)
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
    
    
    func insertRecentlyPlayedIntoSession(recPlayed: [SKAPMediaItem]) {
        if (sessionPlayed == nil) {
            sessionPlayed = Dictionary<Int, SKAPMediaItem>()
        }
        
        for item in recPlayed {
            sessionPlayed?.updateValue(item, forKey: (item.mediaPersistentId as! NSNumber).integerValue)
        }
    }
    
    
}

