#Intro-to-ios-app-development-with-swift

## 2017-01-06
####Homework
- 개인의 영어 이름을 지어보세요. 앞으로 서로 이렇게 불러보는 것도 좋을듯… 실제 회사에서는 이렇게 운영되는 경우들이 많아지고 있습니다.
	- 아직 못정함
	
- 지금까지 직접 사용해본 앱들 중에 하나를 골라 UI를 캡처해서 그 이면의 내용을 상상하고 MVC 패턴으로 구성해보세요. 한장이면 됩니다.
	- <img src="https://cloud.githubusercontent.com/assets/7614353/21704734/82709d1e-d3fe-11e6-808e-3ebcaece9715.PNG" width="200">  <img src="https://cloud.githubusercontent.com/assets/7614353/21704732/826e3dc6-d3fe-11e6-8c16-cde19f92b5b2.PNG" width="200">
    - Push Bullet은 앱이나 브라우저를 통해 push 알람을 주는 앱이다.
	- 위 왼쪽이미지(View)에서 "뷰"를 입력 후, Send 버튼 클릭(User Action)
	- User Action을 통해 Controller 에게 "뷰" 라는 문자열이 입력되고, Controller는 이 "뷰" 문자열을 Model로 Update
	- Model에서는 "뷰"를 push하는 내부작업을 진행한 후, Controller에게 Notify
	- Controller는 Model로부터 받은 "뷰" 문자열을 View에게 다시 Update
	- 위 오른쪽 이미지처럼 View에서 "뷰" 문자열 업데이트
	
- 지금까지 사용해본 앱들 중에 Navigation Controller 기반의 앱 3가지와, Single View Controller 기반의 앱 3가지 정도를 찾아 화면을 캡처해 설명을 준비해주세요.
  - Single View Controller
		- <img src="https://cloud.githubusercontent.com/assets/7614353/21704731/826e24d0-d3fe-11e6-8402-4be88e223b50.PNG" width="200"> 계산기: 단 하나의 view로 구성되어 있다.
        - 나머지는 못찾았다..
  - Navigation View Controller
		- <img src="https://cloud.githubusercontent.com/assets/7614353/21704733/826ea8ba-d3fe-11e6-932e-59915bd3ddab.PNG" width="250"> <img src="https://cloud.githubusercontent.com/assets/7614353/21704732/826e3dc6-d3fe-11e6-8c16-cde19f92b5b2.PNG" width="200"> Push Bullet
            - 좌측 이미지는 push bullet의 Channels view이고 우측 이미지는 Pushing view
            - Navigation view를 통해 여러 개의 view를 처리할 수 있다.
		- 메모
		- Pitch Perfect...
		- 대부분이 Navigation View
    
- Swift로 아주 간단한 코드를 만들어봅시다. 복수의 로또 번호들을 당첨 번호와 비교해서 각각 몇 개와 일치하는지 알려주는 코드입니다. 코딩방법에 따라 여러가지 모양이 나올 수 있으니 꼭 정답을 찾으실 필요는 없습니다. Playground를 사용하시면 됩니다. 
```swift
//: Playground - noun: a place where people can play

import UIKit

// generate random number
func randomInt(min: Int, max: Int) -> Int {
     return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

// create random array
var firstArray = [Int]()
var secondArray = [Int]()
var matchedArray = [Int]()

for i in 0...5 {
    firstArray.append(randomInt(min: 1, max: 45))
    secondArray.append(randomInt(min: 1, max: 45))
}

// get match number
func getMatch(inputNumber: [Int], winNumber: [Int]) -> Int {
    var match = 0
    for choice in inputNumber {
        for lotto in winNumber {
            if(choice == lotto) {
                matchedArray.append(choice)
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
print("//////////////////////")
print("Matched Number: \(matchedArray)")
print("You matched \(matchNumber) numbers")

```
  
- Auto Layout으로 두장의 사진을 미리 준비해서 그 중 한장을 보여주고, 버튼을 누르면 다른 한장으로 바꿔 보여주는 일을 반복하는 앱을 만들어주세요. 혹시 힘들면 Storyboard만 구성해주셔도 됩니다.
	- TappingImage
