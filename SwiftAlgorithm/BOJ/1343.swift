//
//  1343.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

//하나씩 쌓고 쌓은 개수 count
//.이 나오면 X 개수 확인
//X 개수가 2의 배수가 아니면 -1

//X가 2개면 B로 채우기
//X가 4개 이상이면 4개 몫만큼 AAAA, 나머지만큼 BB

func change(_ i: Int) {
    if tmp.count % 2 != 0 {
        print("-1")
        exit(0)
    }
    
    let aCount = tmp.count / 4
    let bCount = tmp.count % 4
    
    let new = Array(repeating: "A", count: aCount * 4) + Array(repeating: "B", count: bCount * 2)
    
    let start = i - tmp.count
    for j in start..<i {
        input[j] = new[j-start]
    }
    tmp = ""
}

var input = Array(readLine()!).map { String($0) }

var tmp = ""
for i in 0..<input.count {
    if input[i] == "." {
        change(i)
    } else if input[i] == "X" {
        tmp += input[i]
    }
}

if !tmp.isEmpty {
    change(input.count)
}

print(input.joined())
