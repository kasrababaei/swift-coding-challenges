import Testing
@testable import Challenges

struct SparseVectorTests {
  @Test func one() async throws {
    let a = SparseVector([1, 0, 0, 2, 3])
    let b = SparseVector([0, 3, 0, 4, 0])
    #expect(a.dotProduct(b) == 8)
  }
    
  @Test func two() async throws {
    let a = SparseVector([0, 1, 0, 0, 0])
    let b = SparseVector([0, 0, 0, 0, 2])
    #expect(a.dotProduct(b) == 0)
  }
    
  @Test func three() async throws {
    let a = SparseVector([0, 1, 0, 0, 2, 0, 0])
    let b = SparseVector([1, 0, 0, 0, 3, 0, 4])
    #expect(a.dotProduct(b) == 6)
  }
}
