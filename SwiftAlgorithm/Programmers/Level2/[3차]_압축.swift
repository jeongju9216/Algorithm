//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/18.
//

func solution(_ msg:String) -> [Int] {
    var result: [Int] = []
    
    let alphabets: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var dict: [String: Int] = [:]
    for (i, ch) in alphabets.enumerated() {
        dict[String(ch)] = i+1
    }
    var msg: [String] = Array(msg).map { String($0) }

    var count = 0
    var str: String = ""
    while count < msg.count {
        let ch = msg[count] //다음 글자
        var tmpString = str + ch //현재 입력
        
        guard let _ = dict[tmpString] else { //존재하지 않으면 사전 추가
            dict[tmpString] = dict.count+1
            result.append(dict[str]!) //출력
            
            str = ""
            continue
        }
     
        //존재하면 계속 탐색
        str += ch
        count += 1
    }
    
    result.append(dict[str]!) //출력
        
    return result
}
