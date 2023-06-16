//
//  9536.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    var arr = readLine()!.split { $0 == " " }.map { String($0) }
    while true {
        let input = readLine()!
        if input == "what does the fox say?" {
            break
        }
        
        let newArr = input.split { $0 == " " }.map { String($0) }
        arr = arr.filter { $0 != newArr[2] }
    }
    
    print(arr.joined(separator: " "))
}
