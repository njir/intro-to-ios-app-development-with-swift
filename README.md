#Intro-to-ios-app-development-with-swift

## Memo

### Delegate
- Delegate는 Method를 *대신해서 호출*하는 역할
- 서로 다른 클래스 간의 이벤트를 알려주기에 효과적인 패턴

### Protocol
- Swift의 프로토콜은 개발자에게 *이 메소드나 프로퍼티 등을 구현해라*라고 명령하는 것과 같다.
- 즉, 특정 클래스를 만들 때 프로토콜을 명시하면 해당 프로토콜의 요구사항대로 메소드나 프로퍼티를 직접 구현해야 한다.
 - Delegate의 스펙이 프로토콜에 정의되어 있다.
```swift
protocol SomeProtocol {
    func someFunction() -> Int
    var someProperty: String { get set }
    optional func anotherFunction() // 꼭 구현할 필요는 없음
}
```
- Remember that protocols act as a kind of contract. AVAudioRecorder does not know what classes you have in your app. However, if you say that your class conforms to the AVAudioRecorderDelegate protocol, then it knows it can call a specific function in your class.
- The specific function has been defined in the protocol (in this case, the AVAudioRecorderDelegate protocol). This way your class and the AVAudioRecorder are loosely coupled, and they can work together without having to know much about each other.

### Lesson 4
- AVFoundation 이라는 프레임워크가 있다.
- 여기서 AV는 Audio, Video
- AVAudioEngine을 사용 -> 레코딩을 할수 있게, 그리고 mix, play등을 할 수 있다
- AVFoundation 안에 있는 AVAuidoEngine class를 사용할 것이다
- AVAudioRecorder : recoding audio
- excalmation mark -> 느낌표 마크
 - ! 마크는 unwrapped optionals를 암묵적으로 뜻한다.
- 하나의 audio h/w만 있기 때문에, 하나의 AVAudioSession만 필요하다.
 - let session = AVAudioSession.sharedInstance -> Singletone
- .wav 파일 포맷으로 레코딩된다.
- 2가지 이슈가 있다.
 - First ViewController 에서 Second ViewController로 어떻게 보낼것인가?
 - 파일 자체를 보낼때 -> 파일 크기가 크면 문제가 생긴다.   -> recoding이 끝냈을때 보내야한다.

### Segue 추가하는방법
- 스토리보드에서 Ctrl 누르고 FirstViewController -> Second ViewController: Segue 추가함(여기서는 show)
- FirstViewController 에서 Show segue "First"->Second 가 생김
- 위의 아이템을 클릭하면 Storyboard segue에서 identifier를 추가할수 있음
- identifier에 "stopRecording" 추가
- RecordSoundsViewController에서 AVAudioRecorderDelegate 프로토콜을 추가해야한다(why? delegate를 위해. 이 Delegate는 이미 정의되어 있으며 audioRecorderDidFinishRecording 라는 함수를 갖고있다.)
 - recordAudio func에 audioRecorder.delegate = self 를 추가하여 deletgate 되었음을 알려준다.
- 현재 이 뷰어에서 AVAudioRecorder 를 delegate하였으므로 audioRecorderDidFinishRecording  함수를 통해 recording이 완료 되었다는 것을 Viewer에서 알 수 있다.
- 그럼 이 함수에 segue 부분을 추가하여 다음 뷰어로 넘길 수 있다.
```swift
     func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
            // 여기서 stopRecording은 storyboard에서 segue
            // 여기서 SENDER는 다음으로 두번째 VIEWCONTORLLER에게 알려주는 변수다.

        } else {
            print("recoding was not successful")
        }
    }
```
- sender에서 알려주려면
 - prepare 함수에서 segue 함수 설정가능하다
  - segue의 destination이 PlaySoundsViewController라 설정
  - audioRecorderDidFinishRecording 함수에서의 sender(URL)을 보낼건데, 이 변수는 Playsoundsviewcontroller에도 선언되어 있어야한다.
  
- Delegate
- It really just means getting one object do the work for the other.
- AV Recoder Class의 경우, view에 관해서 전혀 모른다.
 - 단지 recording이 끝나면 다른 클래스에게 알려줄수 있다. RecordSoundsViewController에서 AVAudioRecorderDelegate 프로토콜을 추가


- Lesson5에서는 StackView 사용법과 Extension을 배움
- Extensions: 기존 클래스, 구조체 또는 열거형 타입에 새로운 기능을 추가한다. 





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
  
  
## 2017-01-01
### Audio in iOS
- ![Audio in iOS](https://cloud.githubusercontent.com/assets/7614353/21580454/413ac8aa-d03a-11e6-9399-b322197c2af0.png)
- AVFoundation: av audio recorder을 포함한다.
- Delegate: 개념정리할것
AVAudioRecorderDelegate : protocol
- ![Stack Views](https://cloud.githubusercontent.com/assets/7614353/21580534/40a32156-d041-11e6-9802-5b5d51eb6965.png)
  - storyboard에서 stack의 distribution을 Fill Equally로 해야 버튼 정렬됨

  
## 2016-12-31
- what I learned
  - how to use storyboard
  - how to add button and enable or disable it
  - how to add other ViewController

### Difference between IBAction and IBOutlet
- UI -> IBAction -> Code
> IBAactions are from UIElement TO code
- UI <- IBOutlet <- Code
> IBOutlets are From code To UIElement

### etc
- option key + 마우스 포인터 : 해당 클래스 설명보기
> help 에서 documentation 볼 수 있다.
- viewDidLoad 가 처음에 call된다.
  - viewDidLoad is called when UIViewController is first loaded into memory
- ![ViewController LifeCycle](https://cloud.githubusercontent.com/assets/7614353/21576472/656c174a-cf74-11e6-94cc-dff728c45303.png)
- ![UINavigationController](https://cloud.githubusercontent.com/assets/7614353/21576686/578daf64-cf7c-11e6-8d6f-516a9e2bc325.png)
- The UINavigationController has a stack of UIViewControllers, and this stack needs to have at least 1 View Controller. It can have as many as your app needs.

