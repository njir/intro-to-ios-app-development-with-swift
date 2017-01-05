//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// variables
var x: Int = 42
let y = 100 //constant

var myString = "Hello"

// control flow
if x < 50 {
    print("X is less than 50")
} else {
    print("X is greater than or equal to 50")
}


// classes
class ViewController: UIViewController {
    // instance var go here
    // class function go here
}

// functions
func printHello() {
    print("Hello")
}

printHello()

func printHelloMessage(helloString: String){
    print(helloString)
}

printHelloMessage(helloString: "test")

func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}

join(

printHelloMessage(helloString: join(s1: "foo", s2: "bar", joiner: ", "))




