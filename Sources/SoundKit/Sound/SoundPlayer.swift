import AVFAudio
import UIKit

/// 1. Prepare the engine to play sounds by calling `start` (avoid delay on first sound play)
/// 2. Play any sound with the static method `play`, or directly on your sound struct, eg: `SomeSound().play()`
public final class SoundPlayer: NSObject {
    private static let sharedInstance = SoundPlayer()
    private var audioPlayers: [URL: AVAudioPlayer] = [:]
    private var duplicateAudioPlayers: [AVAudioPlayer] = []
    
    /// Recommended to call this method as soon as possible to start the audio engine (prevent delays when you actually need to hear some sound)
    /// Usually this would go on `AppDelegate` on `SceneDelegate` (as the app finishes launching)
    public static func start() {
        EmptySound().play()
    }

    /// Plays the given sound and any associated haptics
    public static func play(_ sound: Sound) {
        try? AVAudioSession.sharedInstance().setActive(true)

        guard let url = sound.url,
              let player = sharedInstance.getAudioPlayer(for: url) else { return }

        player.volume = sound.volume
        player.numberOfLoops = sound.numberOfLoops
        DispatchQueue.main.async { player.play() }

        sound.haptic?.play()
    }
    
    private override init() {
        super.init()
        AVAudioSession.setAmbient()
    }

    private func getAudioPlayer(for url: URL) -> AVAudioPlayer? {
        guard let player = audioPlayers[url] else {
            let player = try? AVAudioPlayer(contentsOf: url)
            audioPlayers[url] = player
            return  player
        }
        guard player.isPlaying else { return player }
        guard let duplicatePlayer = try? AVAudioPlayer(contentsOf: url) else { return nil }
        duplicatePlayer.delegate = self
        duplicateAudioPlayers.append(duplicatePlayer)
        return duplicatePlayer
    }
}

extension SoundPlayer: AVAudioPlayerDelegate {
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        duplicateAudioPlayers.removeAll { $0 == player }
        guard audioPlayers.isEmpty && duplicateAudioPlayers.isEmpty else { return }
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }
}
