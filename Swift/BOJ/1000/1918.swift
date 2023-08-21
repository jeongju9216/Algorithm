//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/20.
//

import Foundation

let arr = readLine()!.map { String($0) }

let dict: [String: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]
var result: [String] = []
var stack: [String] = []
for str in arr {
    if str == "(" {
        stack.append(str)
    } else if str == ")" {
        while let top = stack.popLast(), top != "(" {
            result.append(top)
        }
    } else if let priority = dict[str] {
        //연산자
        //(가 아닌 글자가 pop되는걸 방지하기 위해 last로 체크
        while let top = stack.last, top != "(" {
            guard let topPriority = dict[top], topPriority >= priority else { break }
            //같거나 더 높은 우선순위면 result에 추가
            result.append(stack.removeLast())
        }
        stack.append(str)
    } else {
        //알파벳
        result.append(str)
    }
}

if !stack.isEmpty {
    result += stack.reversed()
}

print(result.joined())
