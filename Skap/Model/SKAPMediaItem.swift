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
    var mediaGenre: NSString?
    var mediaBeatsPerMinute: UInt
    var mediaPlayCount: UInt
    var mediaLastPlayedDate: NSDate?
    
    
    // Ids
    var mediaPersistentId: NSNumber?
    var mediaAlbumPersistentId: NSNumber?
    var mediaArtistPersistentId: NSNumber?
    var mediaAlbumArtistPersistentId: NSNumber?
    var mediaGenrePersistentId: NSNumber?
    var mediaComposerPersistentId: NSNumber?
    var mediaPodcastPersistentId: NSNumber?
    
    // Playlist
    var mediaPlaylistGroup: NSString?
    var mediaPlaylistPersistentId: NSNumber?
    
    // Misc
    var mediaType: UInt
    var mediaTitle: NSString?
    var mediaAlbumTitle: NSString?
    var mediaArtist: NSString?
    var mediaAlbumArtist: NSString?
    var mediaComposer: NSString?
    var mediaPlaybackDuration: NSTimeInterval
    var mediaAlbumTrackNumber: UInt
    var mediaAlbumTrackCount: UInt
    var mediaDiscNumber: UInt
    var mediaDiscCount: UInt
    var mediaArtwork: UIImage?
    var mediaLyrics: NSString?
    var mediaIsCompilation: Bool
    var mediaReleaseDate: NSDate?
    var mediaComments: NSString?
    var mediaAssetURL: NSURL?
    var mediaIsCloudItem: Bool
    
    var mediaSkipCount: UInt
    var mediaRating: UInt
    var mediaUserGrouping: NSString?
    var mediaBookmarkTime: NSTimeInterval
    
    
    
    override init() {
        mediaType = 0
        mediaGenre = nil
        mediaBeatsPerMinute = 0
        mediaPlayCount = 0
        mediaLastPlayedDate = nil
        mediaPersistentId = nil
        mediaAlbumPersistentId = nil
        mediaArtistPersistentId = nil
        mediaAlbumArtistPersistentId = nil
        mediaGenrePersistentId = nil
        mediaComposerPersistentId = nil
        mediaPodcastPersistentId = nil
        mediaPlaylistGroup = nil
        mediaPlaylistPersistentId = nil
        mediaTitle = nil
        mediaAlbumTitle = nil
        mediaArtist = nil
        mediaAlbumArtist = nil
        mediaComposer = nil
        mediaPlaybackDuration = 0
        mediaAlbumTrackNumber = 0
        mediaAlbumTrackCount = 0
        mediaDiscNumber = 0
        mediaDiscCount = 0
        mediaArtwork = nil
        mediaLyrics = nil
        mediaIsCompilation = false
        mediaReleaseDate = nil
        mediaComments = nil
        mediaAssetURL = nil
        mediaIsCloudItem = false
        mediaSkipCount = 0
        mediaRating = 0
        mediaUserGrouping = nil
        mediaBookmarkTime = 0
        
        super.init()
    }

    
    required init?(coder aDecoder: NSCoder) {
        mediaType = (aDecoder.decodeObjectForKey("media_type") as? UInt)!
        mediaGenre = aDecoder.decodeObjectForKey("genre") as? NSString
        mediaBeatsPerMinute = (aDecoder.decodeObjectForKey("bpm") as? UInt)!
        mediaPlayCount = (aDecoder.decodeObjectForKey("play_cnt") as? UInt)!
        mediaLastPlayedDate = aDecoder.decodeObjectForKey("last_played_date") as? NSDate
        mediaPersistentId = aDecoder.decodeObjectForKey("id") as? NSNumber
        mediaAlbumPersistentId = aDecoder.decodeObjectForKey("album_id") as? NSNumber
        mediaArtistPersistentId = aDecoder.decodeObjectForKey("artist_id") as? NSNumber
        mediaAlbumArtistPersistentId = aDecoder.decodeObjectForKey("album_artist_id") as? NSNumber
        mediaGenrePersistentId = aDecoder.decodeObjectForKey("genre_id") as? NSNumber
        mediaComposerPersistentId = aDecoder.decodeObjectForKey("composer_id") as? NSNumber
        mediaPodcastPersistentId = aDecoder.decodeObjectForKey("podcast_id") as? NSNumber
        mediaPlaylistGroup = aDecoder.decodeObjectForKey("playlist_grp") as? NSString
        mediaPlaylistPersistentId = aDecoder.decodeObjectForKey("playlist_id") as? NSNumber
        mediaTitle = aDecoder.decodeObjectForKey("title") as? NSString
        mediaAlbumTitle = aDecoder.decodeObjectForKey("album_title") as? NSString
        mediaArtist = aDecoder.decodeObjectForKey("artist") as? NSString
        mediaAlbumArtist = aDecoder.decodeObjectForKey("album_artist") as? NSString
        mediaComposer = aDecoder.decodeObjectForKey("composer") as? NSString
        mediaPlaybackDuration = (aDecoder.decodeObjectForKey("playback_dur") as? NSTimeInterval)!
        mediaAlbumTrackNumber = (aDecoder.decodeObjectForKey("album_track_num") as? UInt)!
        mediaAlbumTrackCount = (aDecoder.decodeObjectForKey("album_track_cnt") as? UInt)!
        mediaDiscNumber = (aDecoder.decodeObjectForKey("disc_num") as? UInt)!
        mediaDiscCount = (aDecoder.decodeObjectForKey("disc_cnt") as? UInt)!
        mediaArtwork = aDecoder.decodeObjectForKey("artwork") as? UIImage
        mediaLyrics = aDecoder.decodeObjectForKey("lyrics") as? NSString
        mediaIsCompilation = (aDecoder.decodeObjectForKey("is_compilation") as? Bool)!
        mediaReleaseDate = aDecoder.decodeObjectForKey("release_date") as? NSDate
        mediaComments = aDecoder.decodeObjectForKey("comments") as? NSString
        mediaAssetURL = aDecoder.decodeObjectForKey("asset_url") as? NSURL
        mediaIsCloudItem = (aDecoder.decodeObjectForKey("is_icloud_item") as? Bool)!
        mediaSkipCount = (aDecoder.decodeObjectForKey("skip_cnt") as? UInt)!
        mediaRating = (aDecoder.decodeObjectForKey("rating") as? UInt)!
        mediaUserGrouping = aDecoder.decodeObjectForKey("user_grping") as? NSString
        mediaBookmarkTime = (aDecoder.decodeObjectForKey("bookmark_time") as? NSTimeInterval)!
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(NSNumber.init(unsignedInteger: mediaType), forKey: "media_type")
        aCoder.encodeObject(mediaGenre, forKey: "genre")
        aCoder.encodeObject(mediaBeatsPerMinute, forKey: "bpm")
        aCoder.encodeObject(mediaPlayCount, forKey: "play_cnt")
        aCoder.encodeObject(mediaLastPlayedDate, forKey: "last_played_date")
        aCoder.encodeObject(mediaPersistentId, forKey: "id")
        aCoder.encodeObject(mediaAlbumPersistentId, forKey: "album_id")
        aCoder.encodeObject(mediaArtistPersistentId, forKey: "artist_id")
        aCoder.encodeObject(mediaAlbumArtistPersistentId, forKey: "album_artist_id")
        aCoder.encodeObject(mediaGenrePersistentId, forKey: "genre_id")
        aCoder.encodeObject(mediaComposerPersistentId, forKey: "composer_id")
        aCoder.encodeObject(mediaPodcastPersistentId, forKey: "podcast_id")
        aCoder.encodeObject(mediaPlaylistGroup, forKey: "playlist_grp")
        aCoder.encodeObject(mediaPlaylistPersistentId, forKey: "playlist_id")
        aCoder.encodeObject(mediaTitle, forKey: "title")
        aCoder.encodeObject(mediaAlbumTitle, forKey: "album_title")
        aCoder.encodeObject(mediaArtist, forKey: "artist")
        aCoder.encodeObject(mediaAlbumArtist, forKey: "album_artist")
        aCoder.encodeObject(mediaComposer, forKey: "composer")
        aCoder.encodeObject(mediaPlaybackDuration, forKey: "playback_dur")
        aCoder.encodeObject(mediaAlbumTrackNumber, forKey: "album_track_num")
        aCoder.encodeObject(mediaAlbumTrackCount, forKey: "album_track_cnt")
        aCoder.encodeObject(mediaDiscNumber, forKey: "disc_num")
        aCoder.encodeObject(mediaDiscCount, forKey: "disc_cnt")
        aCoder.encodeObject(mediaArtwork, forKey: "artwork")
        aCoder.encodeObject(mediaLyrics, forKey: "lyrics")
        aCoder.encodeObject(mediaIsCompilation, forKey: "is_compilation")
        aCoder.encodeObject(mediaReleaseDate, forKey: "release_date")
        aCoder.encodeObject(mediaComments, forKey: "comments")
        aCoder.encodeObject(mediaAssetURL, forKey: "asset_url")
        aCoder.encodeObject(mediaIsCloudItem, forKey: "is_icloud_item")
        aCoder.encodeObject(mediaSkipCount, forKey: "skip_cnt")
        aCoder.encodeObject(mediaRating, forKey: "rating")
        aCoder.encodeObject(mediaUserGrouping, forKey: "user_grping")
        aCoder.encodeObject(mediaBookmarkTime, forKey: "bookmark_time")
    }
    
    
    func set(item: MPMediaItem) {
        mediaType = item.mediaType.rawValue
        mediaGenre = item.valueForProperty(MPMediaItemPropertyGenre) as? NSString
        mediaBeatsPerMinute = (item.valueForProperty(MPMediaItemPropertyBeatsPerMinute) as? UInt)!
        mediaPlayCount = (item.valueForProperty(MPMediaItemPropertyPlayCount) as? UInt)!
        mediaLastPlayedDate = item.valueForProperty(MPMediaItemPropertyLastPlayedDate) as? NSDate
        
        mediaPersistentId = item.valueForProperty(MPMediaItemPropertyPersistentID) as? NSNumber
        mediaAlbumPersistentId = item.valueForProperty(MPMediaItemPropertyAlbumPersistentID) as? NSNumber
        mediaArtistPersistentId = item.valueForProperty(MPMediaItemPropertyArtistPersistentID) as? NSNumber
        mediaAlbumArtistPersistentId = item.valueForProperty(MPMediaItemPropertyAlbumArtistPersistentID) as? NSNumber
        mediaGenrePersistentId = item.valueForProperty(MPMediaItemPropertyGenrePersistentID) as? NSNumber
        mediaComposerPersistentId = item.valueForProperty(MPMediaItemPropertyComposerPersistentID) as? NSNumber
        mediaPodcastPersistentId = item.valueForProperty(MPMediaItemPropertyPodcastPersistentID) as? NSNumber
        
        mediaPlaylistGroup = item.valueForProperty(MPMediaPlaylistPropertyName) as? NSString
        mediaPlaylistPersistentId = item.valueForProperty(MPMediaPlaylistPropertyPersistentID) as? NSNumber
        
        mediaTitle = item.valueForProperty(MPMediaItemPropertyTitle) as? NSString
        mediaAlbumTitle = item.valueForProperty(MPMediaItemPropertyAlbumTitle) as? NSString
        mediaArtist = item.valueForProperty(MPMediaItemPropertyArtist) as? NSString
        mediaAlbumArtist = item.valueForProperty(MPMediaItemPropertyAlbumArtist) as? NSString
        mediaComposer = item.valueForProperty(MPMediaItemPropertyComposer) as? NSString
        mediaPlaybackDuration = (item.valueForProperty(MPMediaItemPropertyPlaybackDuration) as? NSTimeInterval)!
        mediaAlbumTrackNumber = (item.valueForProperty(MPMediaItemPropertyAlbumTrackNumber) as? UInt)!
        mediaAlbumTrackCount = (item.valueForProperty(MPMediaItemPropertyAlbumTrackCount) as? UInt)!
        mediaDiscNumber = (item.valueForProperty(MPMediaItemPropertyDiscNumber) as? UInt)!
        mediaDiscCount = (item.valueForProperty(MPMediaItemPropertyDiscCount) as? UInt)!
        mediaArtwork = item.valueForProperty(MPMediaItemPropertyArtwork) as? UIImage
        mediaLyrics = item.valueForProperty(MPMediaItemPropertyLyrics) as? NSString
        mediaIsCompilation = (item.valueForProperty(MPMediaItemPropertyIsCompilation) as? Bool)!
        mediaReleaseDate = item.valueForProperty(MPMediaItemPropertyReleaseDate) as? NSDate
        mediaComments = item.valueForProperty(MPMediaItemPropertyComments) as? NSString
        mediaAssetURL = item.valueForProperty(MPMediaItemPropertyAssetURL) as? NSURL
        mediaIsCloudItem = (item.valueForProperty(MPMediaItemPropertyIsCloudItem) as? Bool)!
        
        mediaSkipCount = (item.valueForProperty(MPMediaItemPropertySkipCount) as? UInt)!
        mediaRating = (item.valueForProperty(MPMediaItemPropertyRating) as? UInt)!
        mediaUserGrouping = item.valueForProperty(MPMediaItemPropertyUserGrouping) as? NSString
        mediaBookmarkTime = (item.valueForProperty(MPMediaItemPropertyBookmarkTime) as? NSTimeInterval)!
    }
    
}