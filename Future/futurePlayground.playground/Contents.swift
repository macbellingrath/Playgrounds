//: Playground - noun: a place where people can play

import UIKit
import BrightFutures

let fibonacci = { x in x * 10 }

let f = Future<Int,NoError>(value: 4).andThen { r
    in switch r {
    case .Success(let value): break
    case .Failure(let error): print(error)
    }
}


func asyncOp() -> Future<String, NSError> {
    let promise = Promise<String, NSError>()
    
    Queue.global.async {
        return 
    }
    
    
}