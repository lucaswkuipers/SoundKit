import UIKit

enum HapticPlayer {
    static func play(_ haptic: Haptic) {
        DispatchQueue.main.async {
            let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: haptic.style)
            impactFeedbackGenerator.prepare()
            impactFeedbackGenerator.impactOccurred(intensity: haptic.intensity)
        }
    }

    static func vibrate(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            UINotificationFeedbackGenerator().notificationOccurred(type)
        }
    }
}
