//
//  SKAPMediaItem.swift
//  Skap
//
//  Created by Zachary Stegall on 2/13/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

import Foundation
import MediaPlayer


class SKAPMediaItem: NSObject, NSCoding {
    
    // Categorical items
    var mediaType: UInt
    var mediaGenre: NSString?
    var mediaBeatsPerMinute: UInt
    var mediaPlayCount: UInt
    var mediaLastPlayedTs: Int
    
    
    // Ids
    var mediaPersistentId: Int
    var mediaAlbumPersistentId: Int
    var mediaArtistPersistentId: Int
    var mediaAlbumArtistPersistentId: Int
    var mediaGenrePersistentId: Int
    var mediaComposerPersistentId: Int
    var mediaPlaylistPersistentId: Int
    
    // Misc
    var mediaTitle: NSString?
    var mediaAlbumTitle: NSString?
    var mediaArtist: NSString?
    var mediaAlbumArtist: NSString?
    var mediaComposer: NSString?
    var mediaPlaylistGroup: NSString?
    var mediaPlaybackDuration: NSTimeInterval
    var mediaAlbumTrackNumber: UInt
    var mediaAlbumTrackCount: UInt
    var mediaDiscNumber: UInt
    var mediaDiscCount: UInt
    var mediaArtwork: UIImage?
    var mediaLyrics: NSString?
    var mediaReleaseTs: Int
    var mediaSkipCount: UInt
    var mediaRating: UInt
    
    
    
    override init() {
        mediaType = 0
        mediaBeatsPerMinute = 0
        mediaPlayCount = 0
        mediaLastPlayedTs = 0
        
        mediaPersistentId = 0
        mediaAlbumPersistentId = 0
        mediaArtistPersistentId = 0
        mediaAlbumArtistPersistentId = 0
        mediaGenrePersistentId = 0
        mediaComposerPersistentId = 0
        mediaPlaylistPersistentId = 0
        
        mediaTitle = nil
        mediaAlbumTitle = nil
        mediaArtist = nil
        mediaAlbumArtist = nil
        mediaGenre = nil
        mediaComposer = nil
        mediaPlaylistGroup = nil
        mediaPlaybackDuration = 0
        mediaAlbumTrackNumber = 0
        mediaAlbumTrackCount = 0
        mediaDiscNumber = 0
        mediaDiscCount = 0
        mediaArtwork = nil
        mediaLyrics = nil
        mediaReleaseTs = 0
        mediaSkipCount = 0
        mediaRating = 0
        
        super.init()
    }

    
    required init?(coder aDecoder: NSCoder) {
        mediaType = (aDecoder.decodeObjectForKey("media_type") as? UInt)!
        mediaBeatsPerMinute = (aDecoder.decodeObjectForKey("bpm") as? UInt)!
        mediaPlayCount = (aDecoder.decodeObjectForKey("play_cnt") as? UInt)!
        mediaLastPlayedTs = (aDecoder.decodeObjectForKey("last_played_ts") as? Int)!
        
        mediaPersistentId = (aDecoder.decodeObjectForKey("id") as? Int)!
        mediaAlbumPersistentId = (aDecoder.decodeObjectForKey("album_id") as? Int)!
        mediaArtistPersistentId = (aDecoder.decodeObjectForKey("artist_id") as? Int)!
        mediaAlbumArtistPersistentId = (aDecoder.decodeObjectForKey("album_artist_id") as? Int)!
        mediaGenrePersistentId = (aDecoder.decodeObjectForKey("genre_id") as? Int)!
        mediaComposerPersistentId = (aDecoder.decodeObjectForKey("composer_id") as? Int)!
        mediaPlaylistPersistentId = (aDecoder.decodeObjectForKey("playlist_id") as? Int)!
        
        mediaTitle = aDecoder.decodeObjectForKey("title") as? NSString
        mediaAlbumTitle = aDecoder.decodeObjectForKey("album_title") as? NSString
        mediaArtist = aDecoder.decodeObjectForKey("artist") as? NSString
        mediaAlbumArtist = aDecoder.decodeObjectForKey("album_artist") as? NSString
        mediaGenre = aDecoder.decodeObjectForKey("genre") as? NSString
        mediaComposer = aDecoder.decodeObjectForKey("composer") as? NSString
        mediaPlaylistGroup = aDecoder.decodeObjectForKey("playlist_grp") as? NSString
        mediaPlaybackDuration = (aDecoder.decodeObjectForKey("playback_dur") as? NSTimeInterval)!
        mediaAlbumTrackNumber = (aDecoder.decodeObjectForKey("album_track_num") as? UInt)!
        mediaAlbumTrackCount = (aDecoder.decodeObjectForKey("album_track_cnt") as? UInt)!
        mediaDiscNumber = (aDecoder.decodeObjectForKey("disc_num") as? UInt)!
        mediaDiscCount = (aDecoder.decodeObjectForKey("disc_cnt") as? UInt)!
        mediaArtwork = aDecoder.decodeObjectForKey("artwork") as? UIImage
        mediaLyrics = aDecoder.decodeObjectForKey("lyrics") as? NSString
        mediaReleaseTs = (aDecoder.decodeObjectForKey("release_ts") as? Int)!
        mediaSkipCount = (aDecoder.decodeObjectForKey("skip_cnt") as? UInt)!
        mediaRating = (aDecoder.decodeObjectForKey("rating") as? UInt)!
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(NSNumber.init(unsignedInteger: mediaType), forKey: "media_type")
        aCoder.encodeObject(mediaBeatsPerMinute, forKey: "bpm")
        aCoder.encodeObject(mediaPlayCount, forKey: "play_cnt")
        aCoder.encodeObject(mediaLastPlayedTs, forKey: "last_played_ts")
        
        aCoder.encodeObject(mediaPersistentId, forKey: "id")
        aCoder.encodeObject(mediaAlbumPersistentId, forKey: "album_id")
        aCoder.encodeObject(mediaArtistPersistentId, forKey: "artist_id")
        aCoder.encodeObject(mediaAlbumArtistPersistentId, forKey: "album_artist_id")
        aCoder.encodeObject(mediaGenrePersistentId, forKey: "genre_id")
        aCoder.encodeObject(mediaComposerPersistentId, forKey: "composer_id")
        aCoder.encodeObject(mediaPlaylistPersistentId, forKey: "playlist_id")
        
        aCoder.encodeObject(mediaTitle, forKey: "title")
        aCoder.encodeObject(mediaAlbumTitle, forKey: "album_title")
        aCoder.encodeObject(mediaArtist, forKey: "artist")
        aCoder.encodeObject(mediaAlbumArtist, forKey: "album_artist")
        aCoder.encodeObject(mediaGenre, forKey: "genre")
        aCoder.encodeObject(mediaComposer, forKey: "composer")
        aCoder.encodeObject(mediaPlaylistGroup, forKey: "playlist_grp")
        aCoder.encodeObject(mediaPlaybackDuration, forKey: "playback_dur")
        aCoder.encodeObject(mediaAlbumTrackNumber, forKey: "album_track_num")
        aCoder.encodeObject(mediaAlbumTrackCount, forKey: "album_track_cnt")
        aCoder.encodeObject(mediaDiscNumber, forKey: "disc_num")
        aCoder.encodeObject(mediaDiscCount, forKey: "disc_cnt")
        aCoder.encodeObject(mediaArtwork, forKey: "artwork")
        aCoder.encodeObject(mediaLyrics, forKey: "lyrics")
        aCoder.encodeObject(mediaReleaseTs, forKey: "release_ts")
        aCoder.encodeObject(mediaSkipCount, forKey: "skip_cnt")
        aCoder.encodeObject(mediaRating, forKey: "rating")
    }
    
    
    func set(item: MPMediaItem) {
        mediaType = item.mediaType.rawValue
        mediaBeatsPerMinute = (item.valueForProperty(MPMediaItemPropertyBeatsPerMinute) as? UInt)!
        mediaPlayCount = (item.valueForProperty(MPMediaItemPropertyPlayCount) as? UInt)!
        mediaLastPlayedTs = Util.dateToMs(item.valueForProperty(MPMediaItemPropertyLastPlayedDate) as? NSDate)
        
        if (item.valueForProperty(MPMediaItemPropertyPersistentID) != nil) {
            mediaPersistentId = abs((item.valueForProperty(MPMediaItemPropertyPersistentID) as? Int)!)
        }
        if (item.valueForProperty(MPMediaItemPropertyAlbumPersistentID) != nil) {
            mediaAlbumPersistentId = abs((item.valueForProperty(MPMediaItemPropertyAlbumPersistentID) as? Int)!)
        }
        if (item.valueForProperty(MPMediaItemPropertyArtistPersistentID) != nil) {
            mediaArtistPersistentId = abs((item.valueForProperty(MPMediaItemPropertyArtistPersistentID) as? Int)!)
        }
        if (item.valueForProperty(MPMediaItemPropertyAlbumArtistPersistentID) != nil) {
            mediaAlbumArtistPersistentId = abs((item.valueForProperty(MPMediaItemPropertyAlbumArtistPersistentID) as? Int)!)
        }
        if (item.valueForProperty(MPMediaItemPropertyGenrePersistentID) != nil) {
            mediaGenrePersistentId = abs((item.valueForProperty(MPMediaItemPropertyGenrePersistentID) as? Int)!)
        }
        if (item.valueForProperty(MPMediaItemPropertyComposerPersistentID) != nil) {
            mediaComposerPersistentId = abs((item.valueForProperty(MPMediaItemPropertyComposerPersistentID) as? Int)!)
        }
        if (item.valueForProperty(MPMediaPlaylistPropertyPersistentID) != nil) {
            mediaPlaylistPersistentId = abs((item.valueForProperty(MPMediaPlaylistPropertyPersistentID) as? Int)!)
        }
        
        
        if (item.valueForProperty(MPMediaItemPropertyTitle) != nil) {
            mediaTitle = item.valueForProperty(MPMediaItemPropertyTitle) as? NSString
        }
        if (item.valueForProperty(MPMediaItemPropertyAlbumTitle) != nil) {
            mediaAlbumTitle = item.valueForProperty(MPMediaItemPropertyAlbumTitle) as? NSString
        }
        if (item.valueForProperty(MPMediaItemPropertyArtist) != nil) {
            mediaArtist = item.valueForProperty(MPMediaItemPropertyArtist) as? NSString
        }
        if (item.valueForProperty(MPMediaItemPropertyAlbumArtist) != nil) {
            mediaAlbumArtist = item.valueForProperty(MPMediaItemPropertyAlbumArtist) as? NSString
        }
        if (item.valueForProperty(MPMediaItemPropertyGenre) != nil) {
            mediaGenre = item.valueForProperty(MPMediaItemPropertyGenre) as? NSString
        }
        if (item.valueForProperty(MPMediaItemPropertyComposer) != nil) {
            mediaComposer = item.valueForProperty(MPMediaItemPropertyComposer) as? NSString
        }
        if (item.valueForProperty(MPMediaPlaylistPropertyName) != nil) {
            mediaPlaylistGroup = item.valueForProperty(MPMediaPlaylistPropertyName) as? NSString
        }
        
        mediaPlaybackDuration = (item.valueForProperty(MPMediaItemPropertyPlaybackDuration) as? NSTimeInterval)!
        mediaAlbumTrackNumber = (item.valueForProperty(MPMediaItemPropertyAlbumTrackNumber) as? UInt)!
        mediaAlbumTrackCount = (item.valueForProperty(MPMediaItemPropertyAlbumTrackCount) as? UInt)!
        mediaDiscNumber = (item.valueForProperty(MPMediaItemPropertyDiscNumber) as? UInt)!
        mediaDiscCount = (item.valueForProperty(MPMediaItemPropertyDiscCount) as? UInt)!
        mediaArtwork = item.valueForProperty(MPMediaItemPropertyArtwork) as? UIImage
        
        if (item.valueForProperty(MPMediaItemPropertyLyrics) != nil) {
            mediaLyrics = item.valueForProperty(MPMediaItemPropertyLyrics) as? NSString
        }
        
        mediaReleaseTs = Util.dateToMs(item.valueForProperty(MPMediaItemPropertyReleaseDate) as? NSDate)
        mediaSkipCount = (item.valueForProperty(MPMediaItemPropertySkipCount) as? UInt)!
        mediaRating = (item.valueForProperty(MPMediaItemPropertyRating) as? UInt)!
    }
    
}