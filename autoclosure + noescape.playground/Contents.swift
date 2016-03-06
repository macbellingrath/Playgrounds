import UIKit


// Autoclosure

//Without Autoclosure
func f1(compare:() -> Bool) -> Bool {
   return compare()
}
// when calling

f1({ 2 > 5 }) //allowed

// f(3 > 5) // not allowed

func f2(@autoclosure compare: () -> Bool) -> Bool {
    return compare()
}


//now with @autoclosure
f2(2 < 7)

// f2({ 2 < 7 }) // not allowed



// @noescape
let op = { true }
func performOp(op: () -> Bool) {
   
    op() ? print("True") : print("False")
    
}

performOp{ op() }

// With @noescape

func performOpWithAutoclosure(@noescape op: () -> Bool) {
    
     op() ? print("True") : print("False")
}

//Now we can do this
performOpWithAutoclosure(op)

