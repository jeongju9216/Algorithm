import Foundation

func decodeMessage(_ key: String, _ message: String) -> String {
    var dict: [Character: Int] = [:]
    
    let key = Array(key.replacingOccurrences(of: " ", with: ""))
    
    var count: Int = 97
    for char in key {
        if dict[char] == nil {
            dict[char] = count
            count += 1
        }
    }
    
    var message: [Character] = Array(message)
    var result: String = ""
    for char in message {
        if char.isWhitespace {
            result += String(char)
        } else {
            var newChar = String(UnicodeScalar(dict[char]!)!)
            result += newChar
        }
    }
    
    return result
}

print(decodeMessage("the quick brown fox jumps over the lazy dog", "vkbs bs t suepuv"))
