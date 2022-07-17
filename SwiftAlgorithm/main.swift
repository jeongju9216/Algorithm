//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

class Class2 {

    var handler: ((Int) -> Void)? = nil
    
    func format(_ value: Int) -> String { return String(value) }

    func test() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            let formatted = self?.format(10)
            print("formatted: \(formatted as Any)")
        }
    }

    deinit {
        print("Class2 deinit")
    }
}

class Class1 {
    let class2: Class2

    init() {
        class2 = Class2()
    }

    func someEvent() {
        class2.test()
    }

    deinit {
        print("Class1 deinit")
    }
}

var class1: Class1? = Class1() // 1
class1?.someEvent() // 2
class1 = nil // 3

while (true) {
    
}
