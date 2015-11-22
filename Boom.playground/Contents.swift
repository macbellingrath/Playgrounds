//: Playground - noun: a place where people can play

import UIKit


enum LegalError: ErrorType {
    
    case UnderAge
    
}

func checkAge(age: Int) throws -> Bool {
    
    defer {
        
        print("happens no matter what")
        
    }
    
    guard age >= 21 else {
        
        print("throws")
        throw LegalError.UnderAge
        
    }
    
    print("passed")
    
    return true
    
}


do {
    
    try checkAge(20)
    
} catch {
    
    print(error)
    
}


