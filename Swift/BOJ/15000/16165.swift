//
//  16165.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/23.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]

var teamDict: [String: [String]] = [:]
var memberDict: [String: String] = [:]

for _ in 0..<n {
    let teamName = readLine()!
    let num = Int(readLine()!)!
    var arr: [String] = []
    for _ in 0..<num {
        let member = readLine()!
        arr.append(member)
        memberDict[member] = teamName
    }
    
    teamDict[teamName] = arr.sorted()
}

for _ in 0..<m {
    //팀의 이름 or 멤버 이름
    let name = readLine()!
    let type = Int(readLine()!)!
    
    //팀
    if type == 0 {
        teamDict[name]!.forEach { print($0, terminator: "\n") }
    } else if type == 1 {
       //멤버 이름
        print(memberDict[name]!)
    }
}
