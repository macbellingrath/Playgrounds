//: [Previous](@previous)
import UIKit
import SpriteKit

//: # Advanced Pattern Matching


enum Color {
    case Red(color: UIColor?)
    case Orange(color: UIColor)
    case Yellow(color: UIColor)
    case Green(color: UIColor)
    case Blue(color: UIColor)
    case Violet(color: UIColor)
}


let redcolor = Color.Red(color: UIColor.redColor())

if case let .Red(x) = redcolor {
    print(x)
}


enum Number {
    case Integer(Int)
    case String
}

let one: Number = .Integer(1)


if case let .Integer(x) = one {
    print(x)
}


let color2: Number? = .String

//if case .String = color2 {
//    
//    
//}


let optionNumber: Int? = 2

if case let .Some(x) = optionNumber where x > 10 {
    
    
    
}

if let number = optionNumber where number == 2 {
    
}

if let num = optionNumber {
    if num == 2 {
        print(2)
    }
}

switch optionNumber {
case .Some(2): print("2")
case .None: print("none")
default: print("No match")
    
}


infix operator ~= { associativity left }

func ~= <T: Equatable >(lhs: T, rhs: T) -> Bool {
    
    return lhs == rhs
    
}












//: [Next](@next)
