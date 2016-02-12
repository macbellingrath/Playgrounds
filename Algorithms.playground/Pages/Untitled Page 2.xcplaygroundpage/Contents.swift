//: [Previous](@previous)

import Foundation



let dateString = "2016-01-25T22:40:13Z"

func makeDateStringfrom(dateString: String) -> String {
let formatter = NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    guard let date = formatter.dateFromString(dateString) else { return "" }
    let prettydateformatter = NSDateFormatter()
    prettydateformatter.dateStyle = .ShortStyle
    prettydateformatter.timeStyle = .ShortStyle
    return prettydateformatter.stringFromDate(date)
}

//: [Next](@next)
