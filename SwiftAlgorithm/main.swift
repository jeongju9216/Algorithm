//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

func address(of object: UnsafeRawPointer) -> String {
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

func dumpInt() {
    print("\n----- dumpInt() -----")
    
    var intValue: Int = 10
    print("Int(\(MemoryLayout.size(ofValue: intValue)))")
    print("intValue: \(address(of: &intValue))")
    
    var copyInt: Int = intValue
    print("copyInt: \(address(of: &copyInt))")
    print("--------------------")
}

func dumpIntArray() {
    print("\n----- dumpIntArray() -----")
    
    var array: [Int] = [1, 2, 3]
    var array2 = array
    print("Array(\(MemoryLayout.size(ofValue: array)))")
    print("\(address(of: &array))")
    print("\(address(of: &array2))")
    
    array2.append(1)
    
    print("----- After Append -----")
    print("\(address(of: &array))")
    print("\(address(of: &array2))")
    print("--------------------")
}

func dumpCollection() {
    var dict: Dictionary = [0: 0]
    var setValue: Set = [1, 2, 3]
    
    print("Dictionary: \(address(of: &dict))")
    print("Set: \(address(of: &setValue))")
}

func dumpString() {
    var str: String = "Hello"
    var str2: String = str
    
    print("String(\(MemoryLayout.size(ofValue: str)))")
    print("str: \(address(of: &str))")
    print("str2: \(address(of: &str2))")
}


dumpString()
