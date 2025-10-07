import Testing
@testable import Challenges

struct FindItineraryTests {
  @Test func findItinerary() async throws {
    let pairs = [
      (
        [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]],
        ["JFK", "MUC", "LHR", "SFO", "SJC"]
      ),
      (
        [["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"], ["ATL", "JFK"], ["ATL", "SFO"]],
        ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"]
      )
    ]
    
    #expect(FindItinerary.findItinerary(pairs[0].0) == pairs[0].1)
    #expect(FindItinerary.findItinerary(pairs[1].0) == pairs[1].1)
  }
}
