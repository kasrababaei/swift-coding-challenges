/*
 Implement a method to perform basic string compression using the counts of repeated characters.
 For example, the string `aabcccccaaa` would becom `a2b1c5a3`. If the "compressed" string would
 not become smaller, than the original string, your method should return the original string.
 You can assume the string has only uppercase and lowercase letters (a - z).
 */

enum StringCompression {
    static func stringCompression(_ original: String) -> String {
        guard !original.isEmpty else { return original }
        
        var count = 0
        var compressed = String(original[original.startIndex])
        
        for char in original {
            if char != compressed.last {
                compressed = "\(compressed)\(count)\(char)"
                count = 1
            } else {
                count += 1
            }
        }
        
        compressed += "\(count)"
        
        return compressed.count < original.count ? compressed : original
    }
}
