import XCTest
import SoundKit

final class HapticTests: XCTestCase {
    func test_defaultProperties_haveCorrectValue() {
        let sut = SomeHaptic()
        
        XCTAssertEqual(sut.style, .medium)
        XCTAssertEqual(sut.intensity, 0.5)
    }
    
    private struct SomeHaptic: Haptic {}
}
