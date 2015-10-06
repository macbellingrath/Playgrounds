import UIKit


// Normal

// - build a new playground called FizzBuzz
// - create a loop to run from 1 - 100
for var i = 0; i < 100; i++ {
    print(i)
}

// - follow the rules of Fizz Buzz
// - print current number unless you are printing fizz or buzz (based on rules)

// Hard

// - create a function that will run an infinite loop
//var k = 0
//while k < 1 {
//    print("forever!")
//}
// - create a function that loops though an input String and prints every letter

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