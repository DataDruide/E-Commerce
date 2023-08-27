//
//  VideoPlayerView.swift
//  E Commerce
//
//  Created by Marcel Zimmermann on 27.08.23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let videoSelected : String
    let videoTitle : String
    
    var body: some View {
        VStack {
            VideoPlayer(player : playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                Text(videoTitle)
            }
            .overlay (
               Image("frame")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.top, 6)
               , alignment: .topLeading
            )
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoSelected: "payment", videoTitle: "Payment")
    }
}
