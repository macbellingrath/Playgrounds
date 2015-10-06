//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let array = [1,2,3,4,5,6,7,8,9,10]


array.forEach{
    
    print($0)

}

let newArray = array.map{ $0 * 2 }

newArray


for suzanne in array {
   
    print(suzanne)
    
}


//loops


for var i = 0; i < array.count; i++ {
    print(i)
}

let emptyArray: [Int] = []


emptyArray.forEach{$0}





