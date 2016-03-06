//
//  API.swift
//  Skap
//
//  Created by Bingee on 2/22/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

import Foundation


let apiBase = ""
let apiGet = "song/list.php"
let apiCreate = "song/create.php"
let apiCreateMany = "song/createmany.php"
let apiUpdate = "song/update.php"
let apiUpdateMany = "song/updatemany.php"

let httpMethodGET = "GET"
let httpMethodPOST = "POST"
let httpMethodPUT = "PUT"

class API {
    
    
    private class func apiString(apipath: String) -> String {
        return apiBase + apipath;
    }
    
    
    // **** GET **** //
    
    class func syncGetSongs(completion: (Array<SKAPMediaItem>?) -> Void) {
        API.getSongs(true, completion: completion)
    }
    class func asyncGetSongs(completion: (Array<SKAPMediaItem>?) -> Void) {
        API.getSongs(false, completion: completion)
    }
    private class func getSongs(syncRequest: Bool, completion: (Array<SKAPMediaItem>?) -> Void) {
        func submitRequest() {
            serverRequest(apiString(apiGet), httpMethod: httpMethodGET, params: nil) { (response) -> Void in
                if (response != nil) {
                    NSLog("Response: %@", response!)
                    completion(nil)
                }
            }
        }
        
        if (syncRequest) {
            submitRequest()
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                submitRequest()
            })
        }
    }
    
    
    
    // **** PUT **** //
    
    class func syncPutSong(song: SKAPMediaItem, user: NSUUID) {
        API.putSong(true, song: song, user: user)
    }
    class func asyncPutSong(song: SKAPMediaItem, user: NSUUID) {
        API.putSong(false, song: song, user: user)
    }
    private class func putSong(syncRequest: Bool, song: SKAPMediaItem, user: NSUUID) {
        func submitRequest() {
            serverRequest(apiString(apiUpdate), httpMethod: httpMethodPUT, params: putSongParams(song, user: user)) { (response) -> Void in
                if (response != nil) {
                    NSLog("Response: %@", response!)
                }
            }
        }
        
        if (syncRequest) {
            submitRequest()
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                submitRequest()
            })
        }
    }
    
    
    class func syncPutSongs(songs: NSArray, user: NSUUID) {
        API.putSongs(true, songs: songs, user: user)
    }
    class func asyncPutSongs(songs: NSArray, user: NSUUID) {
        API.putSongs(false, songs: songs, user: user)
    }
    private class func putSongs(syncRequest: Bool, songs: NSArray, user: NSUUID) {
        func submitRequest() {
            let paramSongs = NSMutableArray()
            for song in songs {
                let ps = putSongParams(song as! SKAPMediaItem, user: user)
                paramSongs.addObject(ps)
            }
            serverRequest(apiString(apiUpdateMany), httpMethod: httpMethodPUT, params: NSDictionary.init(object: paramSongs, forKey: "songs")) { (response) -> Void in
                if (response != nil) {
                    NSLog("Response: %@", response!)
                }
            }
        }
        
        if (syncRequest) {
            submitRequest()
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                submitRequest()
            })
        }
    }
    
    private class func putSongParams(item: SKAPMediaItem, user: NSUUID) -> NSMutableDictionary {
        let params = NSMutableDictionary()
        params.setObject(item.mediaPersistentId, forKey: "id")
        params.setObject(user.UUIDString.lowercaseString, forKey: "user_id")
        params.setObject(item.mediaPlayCount, forKey: "play_cnt")
        params.setObject(item.mediaLastPlayedTs, forKey: "last_played_ts")
        params.setObject(item.mediaSkipCount, forKey: "skip_cnt")
        params.setObject(item.mediaRating, forKey: "rating")
        params.setObject(item.mediaLyrics!, forKey: "lyrics")
        
        return params
    }
    
    
    
    // **** POST **** //
    
    class func syncPostSong(song: SKAPMediaItem, user: NSUUID) {
        API.postSong(true, song: song, user: user)
    }
    class func asyncPostSong(song: SKAPMediaItem, user: NSUUID) {
        API.postSong(false, song: song, user: user)
    }
    private class func postSong(syncRequest: Bool, song: SKAPMediaItem, user: NSUUID) {
        func submitRequest() {
            serverRequest(apiString(apiCreate), httpMethod: httpMethodPOST, params: postSongParams(song, user: user)) { (response) -> Void in
                if (response != nil) {
                    NSLog("Response: %@", response!)
                }
            }
        }
        
        if (syncRequest) {
            submitRequest()
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                submitRequest()
            })
        }
    }
    
    class func syncPostSongs(songs: NSArray, user: NSUUID) {
        API.postSongs(true, songs: songs, user: user)
    }
    class func asyncPostSongs(songs: NSArray, user: NSUUID) {
        API.postSongs(false, songs: songs, user: user)
    }
    private class func postSongs(syncRequest: Bool, songs: NSArray, user: NSUUID) {
        func submitRequest() {
            let paramSongs = NSMutableArray()
            for song in songs {
                let ps = postSongParams(song as! SKAPMediaItem, user: user)
                paramSongs.addObject(ps)
            }
            serverRequest(apiString(apiCreateMany), httpMethod: httpMethodPOST, params: NSDictionary.init(object: paramSongs, forKey: "songs")) { (response) -> Void in
                if (response != nil) {
                    NSLog("Response: %@", response!)
                }
            }
        }
        
        if (syncRequest) {
            submitRequest()
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                submitRequest()
            })
        }
    }
    
    private class func postSongParams(item: SKAPMediaItem, user: NSUUID) -> NSMutableDictionary {
        let params = NSMutableDictionary()
        params.setObject(item.mediaPersistentId, forKey: "id")
        params.setObject(user.UUIDString.lowercaseString, forKey: "user_id")
        params.setObject(item.mediaTitle!, forKey: "title")
        params.setObject(item.mediaBeatsPerMinute, forKey: "bpm")
        params.setObject(item.mediaPlayCount, forKey: "play_cnt")
        params.setObject(item.mediaLastPlayedTs, forKey: "last_played_ts")
        params.setObject(item.mediaAlbumPersistentId, forKey: "album_id")
        params.setObject(item.mediaAlbumTitle!, forKey: "album")
        params.setObject(item.mediaArtistPersistentId, forKey: "artist_id")
        params.setObject(item.mediaArtist!, forKey: "artist")
        params.setObject(item.mediaAlbumArtistPersistentId, forKey: "album_artist_id")
        params.setObject(item.mediaAlbumArtist!, forKey: "album_artist")
        params.setObject(item.mediaGenrePersistentId, forKey: "genre_id")
        params.setObject(item.mediaGenre!, forKey: "genre")
        params.setObject(item.mediaComposerPersistentId, forKey: "composer_id")
        
        if (item.mediaComposer != nil){
            params.setObject(item.mediaComposer!, forKey: "composer")
        }
        
        if (item.mediaPlaylistPersistentId != 0) {
            params.setObject(item.mediaPlaylistPersistentId, forKey: "playlist_id")
        }
        
        if (item.mediaPlaylistGroup != nil) {
            params.setObject(item.mediaPlaylistGroup!, forKey: "playlist_grp")
        }
        
        params.setObject(item.mediaPlaybackDuration, forKey: "playback_dur")
        params.setObject(item.mediaAlbumTrackNumber, forKey: "album_track_num")
        params.setObject(item.mediaAlbumTrackCount, forKey: "album_track_cnt")
        params.setObject(item.mediaDiscNumber, forKey: "disc_num")
        params.setObject(item.mediaDiscCount, forKey: "disc_cnt")
        params.setObject(item.mediaReleaseTs, forKey: "release_ts")
        params.setObject(item.mediaSkipCount, forKey: "skip_cnt")
        params.setObject(item.mediaRating, forKey: "rating")
        params.setObject(item.mediaLyrics!, forKey: "lyrics")
        
        return params
    }
    
    
    
    // **** REQUEST **** //
    
    private class func serverRequest(api: String, httpMethod: String, params: NSDictionary?, completion: (NSDictionary?) -> Void) {
        
        let request = NSMutableURLRequest.init(URL: NSURL.init(string: api)!)
        request.HTTPMethod = httpMethod
        
        switch httpMethod {
            
            case httpMethodGET:
                break
            
            case httpMethodPOST, httpMethodPUT:
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                do {
                    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params!, options: NSJSONWritingOptions.PrettyPrinted)
                } catch {
                    print("Error")
                    completion(nil)
                    return
                }
                request.setValue(String(request.HTTPBody?.length), forHTTPHeaderField: "Content-Length")
                break
            
            
            default:
                completion(nil)
                return
            
        }
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, err) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                completion(json as? NSDictionary)
            } catch {
                print("Error :%@", err)
                completion(nil)
            }
        }
        task.resume()
        
    }
    
}