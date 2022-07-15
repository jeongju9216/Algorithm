//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

struct PersonS {
    var name: String = "시리"
}

class PersonC {
    var name: String = "시리"
    var person: PersonS = PersonS()
}

let person1: PersonC = PersonC()
var person2 = person1
var person3 = person1

person3.person.name = "팀쿡"

print("person1 name: \(person1.person.name)")
print("person2 name: \(person2.person.name)")
print("person3 name: \(person3.person.name)")
