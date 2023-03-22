//
//  16506.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/22.
//

import Foundation

let opcodes: [String: String] = [
    "ADD": "0000", "ADDC": "0000",
    "SUB": "0001", "SUBC": "0001",
    "MOV": "0010", "MOVC": "0010",
    "AND": "0011", "ANDC": "0011",
    "OR": "0100", "ORC": "0100",
    "NOT": "0101",
    "MULT": "0110", "MULTC": "0110",
    "LSFTL": "0111", "LSFTLC": "0111",
    "LSFTR": "1000", "LSFTRC": "1000",
    "ASFTR": "1001", "ASFTRC": "1001",
    "RL": "1010", "RLC": "1010",
    "RR": "1011", "RRC": "1011"
]

let times = Int(readLine()!)!
var commands: [[String]] = []
for _ in 0..<times {
    let input = readLine()!.components(separatedBy: " ")
    commands.append(input)
}

for command in commands {
    let op = command[0]
    let rd = command[1]
    let ra = command[2]
    let bc = command[3]
    let isSharpC = (op.last! == "C")
    
    var result = opcodes[op]! //opcode
    result += (isSharpC ? "1" : "0") //4
    
    result += "0" //5

    result += String(format: "%03d", Int(String(Int(rd)!, radix: 2))!) //rd
    result += String(format: "%03d", Int(String(Int(ra)!, radix: 2))!) //ra
    if isSharpC {
        result += String(format: "%04d", Int(String(Int(bc)!, radix: 2))!) //bc
    } else {
        result += String(format: "%03d0", Int(String(Int(bc)!, radix: 2))!) //bc
    }
    
    print(result)
}
