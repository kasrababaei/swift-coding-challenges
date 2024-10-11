import Testing
@testable import Challenges

struct LongestPalindromeIITests {
  @Test func caseOne() {
    #expect(LongestPalindromeII.longestPalindrome("abccccdd") == 7)
  }
  
  @Test func caseTwo() {
    #expect(LongestPalindromeII.longestPalindrome("ccc") == 3)
  }
  
  @Test func caseThree() {
    let input = """
    civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth
    """
    #expect(LongestPalindromeII.longestPalindrome(input) == 983)
  }
  
  @Test func caseFour() {
    #expect(LongestPalindromeII.longestPalindrome("ababababa") == 9)
  }
}
