import AVFAudio

extension AVAudioSession {
    static func setAmbient() {
        try? AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)

        #if targetEnvironment(simulator)
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        #endif
    }
}
