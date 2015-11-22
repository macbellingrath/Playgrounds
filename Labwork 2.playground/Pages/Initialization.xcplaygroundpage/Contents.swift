//: # Initialization
import UIKit
//: “Initialization is the process of preparing an instance of a class, structure, or enumeration for use. This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that is required before the new instance is ready for use.”


// A simple initializer

class exampleClass {
    init() {
    // perform some initialization here
    }
}




//: A simple struct that declares an initializer that initializes the stored property with a temperate of 32º
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

//: You can also define a stored property a default value as part of the property's declaration

var fahrenheit = 32.0

//: - Customizing Initialization

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}


let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0”


//: The Celcius struct declares two init methods which allow for initialization from either Fahrenheit and from Kelvin. 



struct Color {
let red, green, blue: Double
init(red: Double, green: Double, blue: Double) {
    self.red   = red
    self.green = green
    self.blue  = blue
}
init(white: Double) {
    red   = white
    green = white
    blue  = white
    }
}

let greyColor = Color(red: 0.5, green: 0.5, blue: 0.5)


//: External parameter names are required in an init method. If you wish to omit them, an _ may be used.
struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
//initialize an instance from our Struct, without using external parameters :)
let bodyTemperature = Celsius2(37.0)

/*: 
## Optional Property Types
* A property that is allowed to have no value can be declared with an optional type. Optional types are automatically initialized with a default value of nil
* If a value cannot be assigned at initialization, optionals enable them to be nil at creation and later assigned a value
*/


class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

var cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

/*: Assigning Constant Properties During Initialization
* Contant properties can be set during initialization, and are useful to convey that the property will not change on the object once it is created
*/


class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
// prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"

//: ## Default Initializers




// Nightmare
// - step through chapters "Initialization" -> "Nested Types"
// - everytime you see code in the book, add it to your playground and add a comment explaining what it is doing

// Blackhole
// - step through chapters "Extensions" -> "Access Control"
// - everytime you see code in the book, add it to your playground and add a comment explaining what it is doing
