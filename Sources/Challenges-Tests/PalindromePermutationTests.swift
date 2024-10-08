//
//  PalindromePermutationTests.swift
//  Challenges
//
//  Created by Kasra Babaei on 2024-09-02.
//

import XCTest
@testable import Challenges

final class PalindromePermutationTests: XCTestCase {
  func testPalindromePermutation() {
    let strings = [
      ("civic", true),
      ("ivicc", true),
      ("racecar", true),
      ("aabb", true),
      ("carerac", true),
      ("abc", false),
      ("aabbccdd", true),
      ("abcd", false),
      ("aaabb", true),
      ("abcabc", true),
      ("Tact Coa", true)
    ]
        
    for (string, bool) in strings {
      XCTAssertEqual(
        PalindromePermutation.isPalindromePermutation(string),
        bool,
        "\(string) is not \(bool)"
      )
    }
  }
}
