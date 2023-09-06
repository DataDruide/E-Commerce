import Foundation
import AVKit

var videoPlayer: AVPlayer? // Ein optionaler AVPlayer, da er möglicherweise nicht initialisiert wird

func playVideo(fileName: String, fileFormat: String) -> AVPlayer { // Die Funktion gibt einen AVPlayer zurück
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!) // Initialisiere den AVPlayer mit der angegebenen URL
        videoPlayer?.play() // Starte die Wiedergabe des Videos
    }
    return videoPlayer! // Wir erzwingen den Rückgabewert des AVPlayers, um sicherzustellen, dass ein Wert zurückgegeben wird
}
