/*
 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

  

 Example 1:

 Input: x = 2.00000, n = 10
 Output: 1024.00000
 Example 2:

 Input: x = 2.10000, n = 3
 Output: 9.26100
 Example 3:

 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 */

enum MyPow {
  static func myPow(_ x: Double, _ n: Int) -> Double {
    guard x != 0 else { return 0 }
    guard n != 0 else { return 1 }
        
    var res: Double = 1
    var absN = abs(n)
    var base = x
    while absN > 0 {
      if absN % 2 == 1 {
        res *= base
      }
      base *= base
      absN /= 2
    }
        
    return n < 0 ? 1 / res : res
  }
}
