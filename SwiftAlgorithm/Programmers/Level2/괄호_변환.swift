//
//  괄효_변환.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/08.
//

import Foundation

func isCorrectly(_ p: String) -> Bool {
    if p.isEmpty { return true }
    
    var stack: [String] = []

    for str in p {
        let str = String(str)
        if stack.isEmpty {
            stack.append(str)
        } else {
            if str == ")" && stack.last! == "(" {
                stack.popLast()
            } else {
                stack.append(str)
            }
        }
    }
    
    return stack.isEmpty
}

func isBalance(_ p: [String]) -> Bool {
    if p.isEmpty { return true }

    return p.filter { $0 == "(" }.count == p.filter { $0 == ")" }.count
}

func splitUV(_ p: String) -> (String, String) {
    var stack: [String] = []
    
    for str in p {
        let str = String(str)
        
        if stack.isEmpty {
            stack.append(str)
        } else {
            if isBalance(stack) {
                break
            } else {
                stack.append(str)
            }
        }
    }
    
    let u = stack.joined()
    let v = (stack.count == p.count) ? "" : String(p.suffix(p.count - stack.count))
    
    return (u, v)
}

func makeCorrectedString(_ string: String) -> String {
    if string.isEmpty {
        return ""
    }
    
    let (u, v) = splitUV(string)
    if isCorrectly(u) {
        return u + makeCorrectedString(v)
    } else {
        let str = "(" + makeCorrectedString(v) + ")"
        let u2 = (Array(u)[1..<u.count-1]).map { String($0) == ")" ? "(" : ")" }.joined()
        return str + u2
    }
}

func solution(_ p:String) -> String {
    if p.isEmpty || isCorrectly(p) {
        return p
    }
    
    let result = makeCorrectedString(p)
    
    return result
}
