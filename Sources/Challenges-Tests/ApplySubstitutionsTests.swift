import Testing
@testable import Challenges

struct ApplySubstitutionsTests {
  @Test func applySubstitutions() async throws {
    let inputs = [
      ([["A", "abc"], ["B", "def"]], "%A%_%B%", "abc_def"),
      ([["P", "jluwndp"], ["U", "%P%%P%qi"]], "%U%_%P%", "jluwndpjluwndpqi_jluwndp"),
      ([["A", "bce"], ["B", "ace"], ["C", "abc%B%"]], "%A%_%B%_%C%", "bce_ace_abcace")
    ]
      
    for input in inputs {
      #expect(ApplySubstitutions.applySubstitutions(input.0, input.1) == input.2)
    }
  }
}
