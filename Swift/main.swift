import Foundation

func solution(_ cards1: [String], _ cards2: [String], _ goal: [String]) -> String {
    var cards1: [String] = cards1.reversed()
    var cards2: [String] = cards2.reversed()
    
    var result = "Yes"
    for word in goal {
        if let card1 = cards1.last,
            card1 == word {
            cards1.removeLast()
            continue
        }
        
        if let card2 = cards2.last,
            card2 == word {
            cards2.removeLast()
            continue
        }
        
        result = "No"
        break
    }
    
    return result
}
