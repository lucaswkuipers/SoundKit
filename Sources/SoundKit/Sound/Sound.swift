import Foundation

public protocol Sound {
    var fileName: String { get }
    var fileExtension: String { get }
    var haptic: Haptic? { get }
    var numberOfVariations: Int { get }
    var volume: Float { get }
    var isLoop: Bool { get }
}

public extension Sound {
    var fileName: String { String(describing: type(of: self)).lowercased().removing(["()", "sound"]) }
    var fileExtension: String { "mp3" }
    var haptic: Haptic? { nil }
    var numberOfVariations: Int { 1 }
    var volume: Float { 1.0 }
    var isLoop: Bool { false }
    var variation: String { numberOfVariations > 1 ? "_\(Int.random(in: (0..<numberOfVariations)))" : "" }
    var numberOfLoops: Int { isLoop ? -1 : 0 }
    var fileNameWithVariation: String { fileName + variation }
    var url: URL? { Bundle.main.url(forResource: fileNameWithVariation, withExtension: fileExtension) }
    
    func play() { SoundPlayer.play(self) }
}
