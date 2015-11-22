//: [Previous](@previous)

import Foundation

//: # Functional Programming
//: SIDE EFFECTS
let numbers = Array(1...10)
var total = 0

func addNumbers() {
for number in numbers {
    total += number
    
    }
}

addNumbers()
total

//When you call your function again...there are unintended side effects
addNumbers()
total

// BUT WAIT..... VALUE TYPES

//let mynumber = addNums(numbers)
//
//let anotherNumber = addNums(numbers)



//NO SIDE EFFECTS :)

func addNums(numbers: [Int]) -> Int {
    
   return numbers.reduce(0) { $0 + $1 }
}


var testArray = Array(1...10)
//map


let doubleArray = testArray.map { $0 * 2 }
doubleArray
//flatmap

let someNils: [Int?] = [1,nil, 3, 4, nil, 5]
let someNilsWithoutNils  = someNils.flatMap { $0 }
someNilsWithoutNils
//filter

let evensArray = testArray.filter { $0 % 2 == 0 }
evensArray
//reduce

let reduced = testArray.reduce(0){ $0 + $1 }
reduced



enum Erros: ErrorType {
    case NoNameError
}

func printHello(name: String?) throws {
    if let x = name {
    print("Hello" + x)
    } else {
        throw Erros.NoNameError
    }
}




//: Currying


func add(x: Int) -> Int -> Int {
    
    return { y in x + y }
}

let two = add(1)(1)


func add1(x: Int) -> Int {
    return x
}

func add2(x: Int, y: Int) -> Int {
    return x + y
}


add2(1, y: 7 )
var a = 1
var b = 1
var x: (Int) -> Int = {a in a + b }



typealias intInOut = Int -> Int
typealias extra = Int -> intInOut
typealias extra1 = Int -> extra


extension Int {
func add(x: Int) -> Int -> Int {
    
    return { y in self + x + y }
}
}

let four = 1.add(3)
let zero = 0
zero.add(5)(5).add(5)(5).add(1)(2)
/////


//let part = add(2)
//
//let sum = part(3)




var weird: Int -> Int = { i in i + 2 }

weird(3)

typealias multiplication = Int -> Int

func multiply(x: Int) -> multiplication {
    return { y in x *  y }
}

multiply(5)(5)


typealias checkMultiplication = (Int,Int) -> Bool

func checkResult(result: Int) -> checkMultiplication {
    
    return { (num1,num2) in num1 * num2 == result }
    
}

checkResult(10)(2,5)
//: [Next](@next)
