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

func fibonacci(number: Int) -> Int {
    
    if number <= 1 {
        return number
    } else {
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}

var fibNumber = fibonacci(8)
print("The 8th Fibonacci number is: \(fibNumber)")




func isPalindrome(word: String) -> Bool {
    
    var chars = [Character]()
    
    let lowerCaseWord = word.lowercaseString
    
    for c in lowerCaseWord.characters {
        
        chars.append(c)
   
    }
    if chars == chars.reverse() {
        return true
        
    }
    return false
    
}

isPalindrome("RaCeCar")

let info = [
    
    "name" : "Mac",
    "interests" :
        
            [
            
                "Hobby": "exercise",
                "Work" : "iOS Developer"
            ]
]

func search(info: [String: AnyObject], forValue string: String) -> Bool  {
   
    for (_, value) in info {
        
        if value is String {
            
            if value as!  String ==  string { return true }
        } else if value is [String: AnyObject ] {
            
            if search(value as!  [String: AnyObject],  forValue: string) { return true }
          
        }
    }
    return false
}

search(info, forValue: "exercise")


search(info, forValue: "Mac") && search(info, forValue: "asdf")





///do while
//set up two numbers, first is 0, last num is chars.count - 1
//do while {
//increase 1st decrement last
//while 1st number not > 2nd number
//test index[1] == index [2]
