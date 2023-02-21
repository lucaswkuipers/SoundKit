import XCTest
import SoundKit

final class SoundTests: XCTestCase {
    func test_defaultProperties_haveCorrectValue() {
        let sut = SomeSound()
        
        XCTAssertEqual(sut.fileName, "some")
        XCTAssertFalse(sut.isLoop)
        XCTAssertEqual(sut.fileExtension, "mp3")
        XCTAssertNil(sut.haptic)
        XCTAssertEqual(sut.numberOfVariations, 1)
        XCTAssertEqual(sut.volume, 1)
        XCTAssertFalse(sut.isLoop)
        XCTAssertEqual(sut.variation, "")
        XCTAssertEqual(sut.numberOfLoops, 0)
        XCTAssertEqual(sut.fileNameWithVariation, "some")
        XCTAssertNil(sut.url)
    }
    
    private struct SomeSound: Sound {}
}
