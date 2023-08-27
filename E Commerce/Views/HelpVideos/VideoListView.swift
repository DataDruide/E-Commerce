

import SwiftUI

struct VideoListView: View {
    
  @State var videos : [Video] = Bundle.main.decode("videos.json") // Hier machen wir uns die Videos zugänglich
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
            NavigationView {
                List {
                    ForEach(videos) { item in
                        VideoListItem(video: item)
                            .padding(.vertical, 8)
                    } //: END FOREACH
                } //: END LIST
                .listStyle(InsetGroupedListStyle()) // better User Expirience Liststyle have radius
                .navigationBarTitle("Videos", displayMode: .inline) // create a title Text in InlineModus
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Shuffle Videos
                            videos.shuffle() // Mischt die Videos durcheinander 
                            hapticImpact.impactOccurred() // taktile Rückmeldung und verbessert die Benutzererfahrung
                        }) {
                            Image(systemName: "arrow.2.squarepath")
                        }
                    }
                }
            }//: End NavigationView
        }
    }


struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
