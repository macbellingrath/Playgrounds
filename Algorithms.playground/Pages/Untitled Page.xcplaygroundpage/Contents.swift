import UIKit
let numberList = [1,2,3,4,5,6,7,8,9,10]

public protocol MinMaxable: CollectionType {
    typealias Item
    var min: Item { get }
    var max: Item { get }
}

typealias number = (Int)

extension SequenceType where Generator.Element == number {
    func binarySearch(key: number) -> Bool {
        guard let min = self.minElement(),let max = self.maxElement() where key <= max && key >= min else { return false }
        let sorted = self.sort()
        
        let midindex = round(Double((min + max)  / 2))
        let midnum = sorted[Int(midindex)]

        
    }
    
}



let numbers = [1,2,3,4,5,6,7,8,9,10]

    func binarySearch(min: Int, max: Int, key: Int) -> Bool {
        guard key >= min && key <= max else { return false }
       
        let midindex = round(Double((min + max)  / 2))
        let midnum = numbers[Int(midindex)]
        
            if midnum > key {
                binarySearch(min, max: Int(midindex) - 1, key: key)
            } else if midnum < key {
                binarySearch(Int(midindex) + 1, max: max, key: key)
            }
        return true
    }
binarySearch(1, max: 10, key: 10)

////    let midIndex : Double = round(Double((min + max) / 2))
//    let midNumber = numberList[Int(midIndex)]
//
//    //reduce the range
//    if midNumber > key  {
//        binarySearch(key, imin: imin, imax: Int(midIndex) - 1)
//    }
//
//        //increase the range
//    else if (midNumber < key ) {
//        binarySearch(key, imin: Int(midIndex) + 1, imax: imax)
//    }
//
//    else {
//        print("value \(key), found")
//    }
//}



//
//public extension SequenceType where Generator.Element : sortable {
//    /// Return true if `element` is in `self`.
//    @warn_unused_result
//    public func binarySearch(element: Self.Generator.Element) -> Bool? {
//        guard let min = self.minElement(), let max = self.maxElement() else { return nil }
//       let mid = Int(min) + Int(max)
//    }
//}
//
//func binarySearch(xs: [Int], imin: Int, imax: Int, key: Int) -> Bool {
//    
//    
//    let midIndex = round(Double((imin + imax) / 2))
//    
//    let number = xs[Int(midIndex)]
//    if number == key { return true }
//    if number > key {
//        
//        binarySearch(xs, imin: number, imax: Int(midIndex) - 1, key: key)
//    } else if number < key {
//        binarySearch(xs, imin:Int(midIndex) - 1, imax: imax, key: key)
//    } else if number == key {
//        return true
//    }
//    return false
//    }
//
//
//binarySearch([1,2,3,4,5,6,7,8,9,10], imin: 1, imax: 10, key: 8)
//
//
//func insertionsort() {
//    //
//}
//func bubbleSort() {
//    //
//}
