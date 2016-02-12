import UIKit

/* Write code to find a 8 letter string of characters that contains only letters from

acdegilmnoprstuw

such that the hash(the_string) is

25377615533200

if hash is defined by the following pseudo-code:

Int64 hash (String s) {
Int64 h = 7
String letters = "acdegilmnoprstuw"
for(Int32 i = 0; i < s.length; i++) {
h = (h * 37 + letters.indexOf(s[i]))

}
return h
}
*/

extension String {
    public func indexOfCharacter(char: Character) -> Int? {
        guard let idx = self.characters.indexOf(char) else { return nil }
        return self.startIndex.distanceTo(idx)
    }
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    func take(i:Int) -> String? {
        guard self.characters.count >= i  else { return nil }
        return self.substringToIndex(self.startIndex.advancedBy(i))
        
    }
    subscript(i: Int64) -> Character {
        return self[self.characters.startIndex.advancedBy(Int(i))]
        

    }
}

extension Array {
    
    func take(x: Int) -> [Element] {
        guard x <= self.count else { return [Element]()}
        var arr = [Element]()
        for i in 1...x {
            arr.append(self[i])
        }
        return arr
    }
}



typealias Hash = Int64
let letters = "acdegilmnoprstuw"
let goal:Int64 = 25377615533200
/*******************************/


func hash(s: String) ->  Hash {
    
    var h: Int64 = 7
    for var i = 0; i < s.characters.count; i++ {
        guard let letterindx = letters.indexOfCharacter(s[i]) else { break }
        h = (h * 37 + letterindx)
    }
    return h
}

/*******************************/

func unhash(var h: Hash) -> String {
    var indices = [Hash]()
    var i = 0
    while h > 37 {
        indices.insert((h % 37), atIndex: i)
        i++
        h /= 37
    }
    
    var unhashedStr = ""
    for var j = indices.count - 1; j >= 0; j-- {
        unhashedStr.append(letters[indices[j]])
    }
    
    return unhashedStr
}
unhash(goal)

// "nsanswer"







