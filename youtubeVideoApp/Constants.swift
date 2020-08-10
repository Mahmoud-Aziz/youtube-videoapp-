//
//  Constants.swift
//  youtubeVideoApp
//
//  Created by Mahmoud Aziz on 8/10/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyCfg6ySRUyRpSUNt59qrmS1d89GCNpRBJg"
    static var PLAYLIST_ID = "PLHFlHpPjgk71CsJGRdDoXwQ5SqKOezo9p"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
