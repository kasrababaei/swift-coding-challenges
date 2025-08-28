import Testing
@testable import Challenges

struct GroupAnagramsTests {
  @Test func success() {
    let outputs = [
      GroupAnagrams.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]),
      GroupAnagrams.groupAnagrams([""]),
      GroupAnagrams.groupAnagrams(["a"])
    ]
    
    let expectations = [
      [["tan", "nat"], ["bat"], ["eat", "tea", "ate"]],
      [[""]],
      [["a"]]
    ]
    
    for (output, expectation) in zip(outputs, expectations) {
      #expect(Set(output).symmetricDifference(expectation) == [])
    }
  }
  
  @Test func failure() {
    let output = Set(GroupAnagrams.groupAnagrams(["tin", "ram", "zip", "cry", "pus", "jon", "zip", "pyx"]))
    let expectation = Set([["ram"], ["zip", "zip"], ["cry"], ["pyx"], ["jon"], ["tin"], ["pus"]])
    
    #expect(!output.contains(expectation))
  }
}
