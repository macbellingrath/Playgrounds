//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Normal

// - build a new playground called FizzBuzz
// - create a loop to run from 1 - 100
// - follow the rules of Fizz Buzz
// - print current number unless you are printing fizz or buzz (based on rules)






//Easy
for var i = 0; i < 100; i++ {
    print(i)
}



// Hard

// - create a function that will run an infinite loop
// - create a function that loops though an input String and prints every letter

//Stopped bc infinite loop
//var k = 11
//while k < 10 {
//    print(k)
//}


let string = "SwiftProgrammingLanguage"

for i in string.characters {
    print(i)
}



// Nightmare

// - create a function that will run the Fibonacci sequence

func fibonacci(number: Int) -> (Int) {
    if number <= 1 {
        return number
    } else {
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}

var fibNumber = fibonacci(8)
print("The 8th Fibonacci number is: \(fibNumber)")



