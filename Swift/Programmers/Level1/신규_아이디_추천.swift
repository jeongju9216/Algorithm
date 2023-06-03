//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/21.
//

import Foundation

func solution(_ new_id:String) -> String {
    var result = ""
    
    //step 1
    let lowercase = new_id.lowercased()
    
    //step 2
//    for letter in lowercase {
//        if letter.isLetter || letter.isNumber || letter == "-" || letter == "_" || letter == "." {
//            result.append(letter)
//        }
//    }
    result = lowercase.replacingOccurrences(of: "[^a-z0-9-_.]", with: "", options: .regularExpression)
    
    // step 3
    while result.contains("..") {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    
    // step 4
    result = result.trimmingCharacters(in: ["."])
    
    //step 5
    if result.isEmpty {
        result = "a"
    }
    
    //step 6
    if result.count >= 16 {
        result = String(result.prefix(15))
        
        while result.last == "." {
            result.removeLast()
        }
    }
    
    //step 7
    while result.count <= 2 {
        if let last = result.last {
            result.append(last)
        }
    }
    
    return result
}

let new_id = "...!@BaT#*..y.abcdefghijklm" //"a...a"//"......a......a......a....."
print(solution(new_id))
