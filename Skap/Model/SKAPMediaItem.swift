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
    var mediaGenre: AnyObject?
    var mediaBeatsPerMinute: AnyObject?
    var mediaPlayCount: AnyObject?
    var mediaLastPlayedDate: AnyObject?
    
    
    // Ids
    var mediaPersistentId: AnyObject?
    var mediaAlbumPersistentId: AnyObject?
    var mediaArtistPersistentId: AnyObject?
    var mediaAlbumArtistPersistentId: AnyObject?
    var mediaGenrePersistentId: AnyObject?
    var mediaComposerPersistentId: AnyObject?
    var mediaPodcastPersistentId: AnyObject?
    
    // Playlist
    var mediaPlaylistGroup: AnyObject?
    var mediaPlaylistPersistentId: AnyObject?
    
    // Misc
    var mediaType: MPMediaType?
    var mediaTitle: AnyObject?
    var mediaAlbumTitle: AnyObject?
    var mediaArtist: AnyObject?
    var mediaAlbumArtist: AnyObject?
    var mediaComposer: AnyObject?
    var mediaPlaybackDuration: AnyObject?
    var mediaAlbumTrackNumber: AnyObject?
    var mediaAlbumTrackCount: AnyObject?
    var mediaDiscNumber: AnyObject?
    var mediaDiscCount: AnyObject?
//    var mediaArtwork: AnyObject?
    var mediaLyrics: AnyObject?
    var mediaIsCompilation: AnyObject?
    var mediaReleaseDate: AnyObject?
    var mediaComments: AnyObject?
    var mediaAssetURL: AnyObject?
    var mediaIsCloudItem: AnyObject?
    
    var mediaSkipCount: AnyObject?
    var mediaRating: AnyObject?
    var mediaUserGrouping: AnyObject?
    var mediaBookmarkTime: AnyObject?
    
    
    
    override init() {
        super.init()
    }

    
    required init?(coder aDecoder: NSCoder) {
        mediaType = MPMediaType.init(rawValue: UInt(aDecoder.decodeObjectForKey("media_type") as! NSNumber))
        mediaGenre = aDecoder.decodeObjectForKey("genre")
        mediaBeatsPerMinute = aDecoder.decodeObjectForKey("bpm")
        mediaPlayCount = aDecoder.decodeObjectForKey("play_cnt")
        mediaLastPlayedDate = aDecoder.decodeObjectForKey("last_played_date")
        mediaPersistentId = aDecoder.decodeObjectForKey("id")
        mediaAlbumPersistentId = aDecoder.decodeObjectForKey("album_id")
        mediaArtistPersistentId = aDecoder.decodeObjectForKey("artist_id")
        mediaAlbumArtistPersistentId = aDecoder.decodeObjectForKey("album_artist_id")
        mediaGenrePersistentId = aDecoder.decodeObjectForKey("genre_id")
        mediaComposerPersistentId = aDecoder.decodeObjectForKey("composer_id")
        mediaPodcastPersistentId = aDecoder.decodeObjectForKey("podcast_id")
        mediaPlaylistGroup = aDecoder.decodeObjectForKey("playlist_grp")
        mediaPlaylistPersistentId = aDecoder.decodeObjectForKey("playlist_id")
        mediaTitle = aDecoder.decodeObjectForKey("title")
        mediaAlbumTitle = aDecoder.decodeObjectForKey("album_title")
        mediaArtist = aDecoder.decodeObjectForKey("artist")
        mediaAlbumArtist = aDecoder.decodeObjectForKey("album_artist")
        mediaComposer = aDecoder.decodeObjectForKey("composer")
        mediaPlaybackDuration = aDecoder.decodeObjectForKey("playback_dur")
        mediaAlbumTrackNumber = aDecoder.decodeObjectForKey("album_track_num")
        mediaAlbumTrackCount = aDecoder.decodeObjectForKey("album_track_cnt")
        mediaDiscNumber = aDecoder.decodeObjectForKey("disc_num")
        mediaDiscCount = aDecoder.decodeObjectForKey("disc_cnt")
//        mediaArtwork = aDecoder.decodeObjectForKey("artwork")
        mediaLyrics = aDecoder.decodeObjectForKey("lyrics")
        mediaIsCompilation = aDecoder.decodeObjectForKey("is_compilation")
        mediaReleaseDate = aDecoder.decodeObjectForKey("release_date")
        mediaComments = aDecoder.decodeObjectForKey("comments")
        mediaAssetURL = aDecoder.decodeObjectForKey("asset_url")
        mediaIsCloudItem = aDecoder.decodeObjectForKey("is_icloud_item")
        mediaSkipCount = aDecoder.decodeObjectForKey("skip_cnt")
        mediaRating = aDecoder.decodeObjectForKey("rating")
        mediaUserGrouping = aDecoder.decodeObjectForKey("user_grping")
        mediaBookmarkTime = aDecoder.decodeObjectForKey("bookmark_time")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(NSNumber.init(unsignedInteger: (mediaType?.rawValue)!), forKey: "media_type")
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
//        aCoder.encodeObject(mediaArtwork, forKey: "artwork")
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
        mediaType = item.mediaType
        mediaGenre = item.valueForProperty(MPMediaItemPropertyGenre)
        mediaBeatsPerMinute = item.valueForProperty(MPMediaItemPropertyBeatsPerMinute)
        mediaPlayCount = item.valueForProperty(MPMediaItemPropertyPlayCount)
        mediaLastPlayedDate = item.valueForProperty(MPMediaItemPropertyLastPlayedDate)
        
        mediaPersistentId = item.valueForProperty(MPMediaItemPropertyPersistentID)
        mediaAlbumPersistentId = item.valueForProperty(MPMediaItemPropertyAlbumPersistentID)
        mediaArtistPersistentId = item.valueForProperty(MPMediaItemPropertyArtistPersistentID)
        mediaAlbumArtistPersistentId = item.valueForProperty(MPMediaItemPropertyAlbumArtistPersistentID)
        mediaGenrePersistentId = item.valueForProperty(MPMediaItemPropertyGenrePersistentID)
        mediaComposerPersistentId = item.valueForProperty(MPMediaItemPropertyComposerPersistentID)
        mediaPodcastPersistentId = item.valueForProperty(MPMediaItemPropertyPodcastPersistentID)
        
        mediaPlaylistGroup = item.valueForProperty(MPMediaPlaylistPropertyName)
        mediaPlaylistPersistentId = item.valueForProperty(MPMediaPlaylistPropertyPersistentID)
        
        mediaTitle = item.valueForProperty(MPMediaItemPropertyTitle)
        mediaAlbumTitle = item.valueForProperty(MPMediaItemPropertyAlbumTitle)
        mediaArtist = item.valueForProperty(MPMediaItemPropertyArtist)
        mediaAlbumArtist = item.valueForProperty(MPMediaItemPropertyAlbumArtist)
        mediaComposer = item.valueForProperty(MPMediaItemPropertyComposer)
        mediaPlaybackDuration = item.valueForProperty(MPMediaItemPropertyPlaybackDuration)
        mediaAlbumTrackNumber = item.valueForProperty(MPMediaItemPropertyAlbumTrackNumber)
        mediaAlbumTrackCount = item.valueForProperty(MPMediaItemPropertyAlbumTrackCount)
        mediaDiscNumber = item.valueForProperty(MPMediaItemPropertyDiscNumber)
        mediaDiscCount = item.valueForProperty(MPMediaItemPropertyDiscCount)
//        mediaArtwork = item.valueForProperty(MPMediaItemPropertyArtwork)
        mediaLyrics = item.valueForProperty(MPMediaItemPropertyLyrics)
        mediaIsCompilation = item.valueForProperty(MPMediaItemPropertyIsCompilation)
        mediaReleaseDate = item.valueForProperty(MPMediaItemPropertyReleaseDate)
        mediaComments = item.valueForProperty(MPMediaItemPropertyComments)
        mediaAssetURL = item.valueForProperty(MPMediaItemPropertyAssetURL)
        mediaIsCloudItem = item.valueForProperty(MPMediaItemPropertyIsCloudItem)
        
        mediaSkipCount = item.valueForProperty(MPMediaItemPropertySkipCount)
        mediaRating = item.valueForProperty(MPMediaItemPropertyRating)
        mediaUserGrouping = item.valueForProperty(MPMediaItemPropertyUserGrouping)
        mediaBookmarkTime = item.valueForProperty(MPMediaItemPropertyBookmarkTime)
    }
    
}