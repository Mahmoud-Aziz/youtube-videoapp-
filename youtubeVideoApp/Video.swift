//
//  Video.swift
//  youtubeVideoApp
//
//  Created by Mahmoud Aziz on 8/10/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import Foundation

struct video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        //parse the description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnails)
        
        //parse the video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
