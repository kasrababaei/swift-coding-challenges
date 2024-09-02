import XCTest
@testable import Challenges

final class OnlyUniqueCharactersTests: XCTestCase {
    func testIsUnique() {
        let strings = [
            "abcdefg",
            "1234567890",
            "ABCabc123",
            "!@#$%^&*()",
            "aBcDeFg"
        ]
        
        for string in strings {
            XCTAssertTrue(OnlyUniqueCharacters.isUnique(string))
        }
    }
    
    func testIsNotUnique() {
        let strings = [
            "hello",
            "aabbcc",
            "112233",
            "AAbbCC",
            "abcABCabc"
        ]
        
        for string in strings {
            XCTAssertFalse(OnlyUniqueCharacters.isUnique(string))
        }
    }
}
