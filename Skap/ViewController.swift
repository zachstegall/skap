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
    
    var userId: NSUUID = NSUUID()
    var sessionPlayed: Dictionary<Int, SKAPMediaItem>?
    var allSongIds: Set<Int> = Set<Int>()
    var lastPostedTs: Int = 0
    
    let allSongIdsKey = "all_song_ids"
    let userIdKey = "user_id"
    let lastPostedTsKey = "last_posted_ts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadFromDisk()
        grabRecentlyPlayed()
//        API.syncGetSongs { (items) -> Void in
//            if (items != nil) {
//                NSLog("Items: %@", items!)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFromDisk() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.valueForKey(userIdKey) != nil) {
            let userIdString = defaults.objectForKey(userIdKey) as! String
            userId = NSUUID.init(UUIDString: userIdString)!
        }
        if (defaults.valueForKey(allSongIdsKey) != nil) {
            let data: NSData = (defaults.objectForKey(allSongIdsKey) as? NSData)!
            allSongIds = (NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Set<Int>)!
        }
        if (defaults.valueForKey(lastPostedTsKey) != nil) {
            lastPostedTs = defaults.integerForKey(lastPostedTsKey)
        }
    }
    
    func saveToDisk() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(userId.UUIDString, forKey: userIdKey)
        
        let data = NSKeyedArchiver.archivedDataWithRootObject(allSongIds)
        defaults.setObject(data, forKey: allSongIdsKey)
        
        defaults.setInteger(lastPostedTs, forKey: lastPostedTsKey)
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
                    let toUpdate = NSMutableArray()
                    var toUpdateIds = Set<Int>()
                    let toAdd = NSMutableArray()
                    var ts = 0
                    for item in collection.items {
                        let skapitem = parseMediaItem(item)
                        
                        ts = max(ts, skapitem.mediaLastPlayedTs)
                        
                        if (skapitem.mediaLastPlayedTs > lastPostedTs) {
                            if (allSongIds.contains(skapitem.mediaPersistentId)) {
                                if (!toUpdateIds.contains(skapitem.mediaPersistentId)) {
                                    toUpdate.addObject(skapitem)
                                    toUpdateIds.insert(skapitem.mediaPersistentId)
                                }
                            } else {
                                toAdd.addObject(skapitem)
                            }
                            
                            allSongIds.insert(skapitem.mediaPersistentId)
                        }
                        
                        recentlyPlayedItems.append(skapitem)
                    }
                    
                    lastPostedTs = ts
                    saveToDisk()
                    insertRecentlyPlayedIntoSession(recentlyPlayedItems)
                    insertIntoDatabase(toAdd, update: toUpdate)
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
            sessionPlayed?.updateValue(item, forKey: item.mediaPersistentId)
        }
    }
    
    
    func insertIntoDatabase(add: NSArray, update: NSArray) {
        if (add.count > 0) {
            API.syncPostSongs(add, user: userId)
        }
        
        if (update.count > 0) {
            API.syncPutSongs(update, user: userId)
        }
    }
    
    
}

