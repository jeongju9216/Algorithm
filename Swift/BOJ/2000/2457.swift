//
//  2457.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/05.
//

import Foundation

typealias Flower = (start: Int, end: Int)

let n = Int(readLine()!)!

let startStd = 301
let endStd = 1130

var flowers: [Flower] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    let s = input[0] * 100 + input[1]
    let e = input[2] * 100 + input[3]
    
    //3/1 이전에 지는 꽃, 12/1 이후에 피는 꽃은 필요 없음
    if e <= startStd || s > endStd {
        continue
    }
    
    flowers.append((s, e))
}

flowers.sort {
    if $0.start != $1.start {
        return $0.start < $1.start
    } else {
        return $0.end > $1.end
    }
}

//가장 먼저 피는 꽃이 3/1 이후면 0
if flowers[0].start > endStd {
    print("0")
    exit(0)
}

var result = 0, end = 301
var cursor = 0
while end <= 1130 {
    var newEndTime = 0
    for i in cursor..<flowers.count {
        //당일에 피고 당일에 짐
        let flower = flowers[i]
        if flower.start >= flower.end {
            continue
        }
        
        if end >= flower.start {
            if newEndTime < flower.end {
                newEndTime = flower.end
                cursor = i + 1
            }
        } else {
            //중간에 공백이 생기는 경우
            break
        }
    }
    
    if newEndTime > 0 {
        end = newEndTime
        result += 1
    } else {
        //모두 탐색 or 업데이트할 꽃이 없음
        break
    }
}

if end > endStd {
    print(result)
} else {
    //마지막에 지는 꽃이 11/30 이전이면 0
    print("0")
}
