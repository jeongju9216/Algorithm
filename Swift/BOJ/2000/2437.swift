//
//  2437.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/17.
//

//누적합 + 1보다 현재 올리는 추가 무거우면 누적합+1의 수를 만들 수 없다
let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()

var sum = 0
for num in arr {
    if num > sum + 1 {
        break
    }
    sum += num
}

print(sum + 1)
