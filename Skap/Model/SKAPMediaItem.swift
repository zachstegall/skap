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
    var mediaArtwork: AnyObject?
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
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInt(mediaType?.rawValue, forKey: "")
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
        aCoder.encodeObject(<#T##object: AnyObject?##AnyObject?#>)
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
        mediaArtwork = item.valueForProperty(MPMediaItemPropertyArtwork)
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