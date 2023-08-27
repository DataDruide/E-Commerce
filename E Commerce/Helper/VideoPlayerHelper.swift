//
//  VideoPlayerHelper.swift
//  E Commerce
//
//  Created by Marcel Zimmermann on 27.08.23.
//

import Foundation
import AVKit

var videoPlayer : AVPlayer? // Why VideoPlayer is a Optional


func playVideo(fileName: String, fileFormat: String) -> AVPlayer { // AS Return give a AVVIDEOPLAYER
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer! // erzwingen wir den return videoPlayer sonst kommt eine Fehlermeldung 
}
