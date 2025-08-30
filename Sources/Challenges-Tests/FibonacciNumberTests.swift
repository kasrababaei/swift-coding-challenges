import Testing
@testable import Challenges

struct FibonacciNumberTests {
  @Test func fib() async throws {
    #expect(FibonacciNumber.fib(1) == 1)
    #expect(FibonacciNumber.fib(2) == 1)
    #expect(FibonacciNumber.fib(3) == 2)
    #expect(FibonacciNumber.fib(10) == 55)
  }
}
