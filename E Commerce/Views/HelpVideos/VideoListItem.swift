import SwiftUI
import AVKit

struct VideoListItem: View {


    let video : Video
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)


            } //: ZSTACK
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor) // verwendet die DeviceFarbe unter Assets
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VSTACK
        } //: END HSTACK
    }
}


struct VideoListItem_Previews: PreviewProvider {
    static let videos : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItem(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
