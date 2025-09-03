import Testing
@testable import Challenges

struct WaterfallTests {
  @Test func layout() async throws {
    #expect(
      Waterfall.layout(
        pins: [
          (id: 1, height: 550),
          (id: 2, height: 850),
          (id: 3, height: 100),
          (id: 4, height: 50)
        ],
        columns: 2
      ) == [[550, 100, 50], [850]]
    )
      
    #expect(
      Waterfall.layout(
        pins: [
          (id: 1, height: 250),
          (id: 2, height: 250),
          (id: 3, height: 250),
          (id: 4, height: 250)
        ],
        columns: 3
      ) == [[250, 250], [250], [250]]
    )
  }
}
