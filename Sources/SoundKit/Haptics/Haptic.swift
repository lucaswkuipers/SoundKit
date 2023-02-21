import UIKit

public protocol Haptic {
    var style: UIImpactFeedbackGenerator.FeedbackStyle { get }
    var intensity: CGFloat { get }
}

public extension Haptic {
    var style: UIImpactFeedbackGenerator.FeedbackStyle { .medium }
    var intensity: CGFloat { 0.5 }
    
    func play() { HapticPlayer.play(self) }
}
