//: Playground - noun: a place where people can play

import UIKit


protocol Animal {
    typealias Element
    
    func eat(food: Element)
}

struct Food {
    var name: String
}
struct Pig: Animal {
    typealias Element = Food
    func eat(food: Element) {
        print(food)
    }
}

var pig = Pig()
let food = Food(name: "banana")
pig.eat(food)