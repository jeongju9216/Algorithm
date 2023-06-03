//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/19.
//

import Foundation

struct Word {
    var head: String
    var number: String
    var index: Int
}

func makeWord(_ file: String, index: Int) -> Word {
    var head = file.prefix { !$0.isNumber }.lowercased()
    var number = file.drop { !$0.isNumber }.prefix(while: { $0.isNumber })
    // print("head: \(head) / number: \(number)")
    
    return Word(head: head, number: String(number), index: index)
}

func isAFrontB(_ a: Word, _ b: Word) -> Bool {
    let aNum = Int(a.number)!, bNum = Int(b.number)!
    
    if a.head != b.head { return a.head < b.head }
    
    if aNum != bNum { return aNum < bNum }
    
    return a.index < b.index
}

func solution(_ files:[String]) -> [String] {
    var words: [Word] = []
    
    for (i, file) in files.enumerated() {
        words.append(makeWord(file, index: i))
    }
    
    words.sort { isAFrontB($0, $1) }
    print("words: \(words)")
    
    let result: [String] = words.map { files[$0.index] }
    print("result: \(result)")
    
    return result
}
