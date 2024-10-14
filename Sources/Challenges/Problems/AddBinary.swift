/*
 Given two binary strings a and b, return their sum as a binary string.

 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 
 Example 2:
 Input: a = "1010", b = "1011"
 Output: "10101"

 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 */

struct AddBinary {
  func addBinary(_ a: String, _ b: String) -> String {
    var aIndex = a.count - 1
    var bIndex = b.count - 1
    
    if bIndex > aIndex {
      return addBinary(b, a)
    }
    
    let a = Array(a)
    let b = Array(b)
    var carry = 0
    var result = ""
    
    while aIndex >= 0 {
      let aValue = a.indices.contains(aIndex) ? (a[aIndex].wholeNumberValue ?? 0) : 0
      let bValue = b.indices.contains(bIndex) ? (b[bIndex].wholeNumberValue ?? 0) : 0
      
      if aValue == 1 {
        carry += 1
      }
      
      if bValue == 1 {
        carry += 1
      }
      
      result.append("\(carry % 2)")
      carry = carry / 2
      
      aIndex -= 1
      bIndex -= 1
    }
    
    if carry == 1 {
      result.append("1")
    }
    
    return String(result.reversed())
  }
}
