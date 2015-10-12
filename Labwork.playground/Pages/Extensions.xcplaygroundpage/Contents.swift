//: [Previous](@previous)
//:# Extensions
import Foundation


protocol Moveable {
    func moveTo()
}




struct Shape: Moveable {
    func moveTo() {
    }
}

protocol KVOProtocol: class {
    
    var info: [String:AnyObject] { get set }
    
}


protocol SetNumberable: KVOProtocol {
    
    var value3: Int { get set }

}

class someClass: SetNumberable {
    
    var info: [String:AnyObject] = [:]
    
    var value2: Int!
    
    func boom() {
        
        value2 = 4
        value3 = 5
        
        var newName = name
        
    }
    
    
}


extension SetNumberable {
    
    var value3: Int {
        
        get { return info["value3"] as? Int ?? 0 }
        set { info["value3"] = newValue }
        
    }
    var name: String { return "mac" }
    
}

let s = someClass()

s.boom()

s.value2
s.value3

//: [Next](@next)
