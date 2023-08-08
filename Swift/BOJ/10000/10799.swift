//
//  10799.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/08.
//

import Foundation

//여는건 새로운 막대를 만남
//닫는건 막대 끝이나 레이저
//() -> 레이저라서 반 갈라짐
//) -> 막대 끝
//() -> 지금까지의 막대 개수 추가
//) -> + 1

let input = Array(readLine()!).map { String($0) }

var cnt = 0
var prev = ""
var result = 0

for str in input {
    if str == "(" {
        cnt += 1
    } else if prev == "(" {
        //레이저
        cnt -= 1
        result += cnt
    } else {
        //닫는거
        cnt -= 1
        result += 1
    }
    
    prev = str
}

print(result)
