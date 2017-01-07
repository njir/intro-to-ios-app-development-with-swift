//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Lottery"

// generate random number
func randomInt(min: Int, max: Int) -> Int {
     return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

// create random array
var firstArray = [Int]()
var secondArray = [Int]()
for i in 0...5 {
    firstArray.append(randomInt(min: 1, max: 45))
    secondArray.append(randomInt(min: 1, max: 45))
}

func getMatch(inputNumber: [Int], winNumber: [Int]) -> Int {
    var match = 0
    for choice in inputNumber {
        for lotto in winNumber {
            if(choice == lotto) {
              //  print("Macthed! \(choice)")
                match += 1
            }
        }
    }
    return match
}

let matchNumber = getMatch(inputNumber: firstArray, winNumber: secondArray)

print("//////////////////////")
print("Input: \(firstArray)")
print("WinNumber: \(secondArray)")
print("You matched \(matchNumber) numbers")