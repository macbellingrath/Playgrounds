//: Functional Swift

import UIKit


typealias computation = Int -> Int

//add two ints together

func addTwoInts(x: Int, y: Int) -> Int {
    return x + y
}


//Add two ints curried function

func add2(x:Int) -> Int -> Int {
    return { y in return x + y }
}


add2(2)(2)

func add3(x:Int)(_ y: Int) -> Int {
    return x + y
    
}

add3(1)(1)


// Define a custom operator
infix operator >>> { associativity left }

func >>> (x: Int, y: Int) -> Int {
    return (x * x * y * y)
    
}

8 >>> 8

//: Chapter 4 - Map, Filter, Reduce

//write a function that increments every member of an array

func incrementArray(xs: [Int]) -> [Int] {
   
    var result: [Int] = []
    
    for x in xs {
        result.append(x + 1)
    }
    return result
    
}

// write a function that doubles an array


func doubleArray(xs: [Int]) -> [Int] {
    var result: [Int] = []
    
    for x in xs {
        result.append(x * 2)
    }
    
    return result
}

func computeArray(xs: [Int], f: computation) -> [Int] {
    
    var result: [Int] = []
    
    for x in xs {
       result.append(f(x))
    }
    return result
}

func squared(x:Int) -> Int {
    return x * x
}

var array = [1,2,3,4,5]

computeArray(array) { $0 * $0 }

// Write generic compute function

func genericComputeArray<T> (xs: [Int], f: Int-> T ) -> [T] {
    
    var result: [T] = []
    
    for x in xs {
        result.append(f(x))
    }
    
    return result
}

genericComputeArray(array) {
    x in return x < 3
}

// Write generic function that works with array of any type

func map<T, U>(xs: [T], f: T -> U) -> [U] {
    var result: [U] = []
    
    for x in xs {
        result.append(f(x))
    }
    return result
}

// Swift Standard Library  already has map

func doubleArray2(xs: [Int]) -> [Int] {
    return xs.map { x in x * 2 }
}


// Filter

func filter<T>(xs: [T], check: T -> Bool) -> [T] {
    
    var result: [T] = []
    
    for x in xs {
        if check(x) {
            result.append(x)
        }
    }
    return result
}

let names = ["Will", "Mac", "Jay"]

let namesWithLetterA = names.filter { name in name.containsString("a")}


namesWithLetterA


//Reduce

let numbers = [1,2,3]

func reduce<A, R>(arr: [A], initialValue: R, combine: (R, A) -> R ) -> R {
   
    var result = initialValue
    
    for i in arr {
        result = combine(result, i)
    }
    return result
}
func sumUsingReduce(xs: [Int]) -> Int {
    return reduce(xs, initialValue: 0) { result, x in result + x }
}

sumUsingReduce(numbers)

// SSL has reduce function


struct City {
    let name: String
    let population: Int
}

//cities with pop in thousands

let paris = City(name: "Paris", population: 2243)
let madrid = City(name: "Madrid", population: 3216)
let amsterdam = City(name: "Amsterdam", population: 811)
let berlin = City(name: "Berlin", population: 3397)

let cities = [paris, madrid, amsterdam, berlin]

//scale population up
func scale(city: City) -> City {
    return City(name: city.name, population: city.population * 1000)
}


cities.filter{ city in city.population > 1000}
    .map(scale)
    .reduce("City: Population"){ result, c in
        return result + "\n" + "\(c.name) : \(c.population)"
        
}