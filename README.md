#Intro-to-ios-app-development-with-swift

## Memo
### 2017-01-18
######  MemeMe App
- 이 과정에서 만드는 앱인데, 사진에 텍스트를 입력할 수 있고 그 사진을 공유한다.
- 테이블, 그리브 뷰 사용한다.

###### Click Counter and its object
- 기존에 배운 것처럼 label과 버튼을 생성하여 버튼을 클릭할 때마다 숫자가 올라가는 앱을 만듦
- 1. User taps button -> 2. Action -> 3. Update model(View) -> 4. Update label(UI label)

###### Coding Click Counter
- viewDidLoad: 한번만 실행된다. 메모리 올라갈때,
- 모든 뷰는 frame property를 갖고 있다.
- CGRectMake사용한다.-> (x좌표, y좌표, width, height)순이다.
- addSubview를 해야한다 why? labelView를 뷰하이어라키 에 추가해야한다.
    -  view를 땠다 붙였다 없앴다 하면서 화면을 바꿔줄 수 있다.
- Views can have only one superview.

###### Quiz: Click Counter Quiz
- 현재 코딩되어 있는 코드에 가장 알맞는 다이어그램을 골라라. 답은 2번
- 아직 아무것도 안되어있다.
###### Creating the Count the Label Property
- ViewController 클래스에 count와 label 변수를 선언하여 viewDidLoad 함수 내에 있는 label과 연결하고
- incrementCount 함수를 정의하는 부분까지 진행
###### Diagramming the target action
- UIButton에 Action을  추가해야한다. (target action -> IBACtion)
- target Action의  3가지 component
    - object to notify: target
    - method to use: action
    - event that will trigger: target/ action(control event) ex)touch
###### Setting the Target Action
- 위에서 만든 버튼에 target action을 추가하는 코드
- 여기까지 진행하면 click버튼 누를때마다 label이 올라감

###### Experimenting with Target action
Take a few minutes to do some experimenting on your own.
* Add an additional label and have it increment with the first
* Add a decrement button
* Add an action that toggles the background color of the view with each clic

###### Actions as Callback Methods
- 뷰오브젝트가 컨트롤 오브젝트와 인터액트한다.
- 액션은 메소드 인디케이터이다.  view에서 view controller로 전달하

###### Transitioning to Storyboard label
- outline view, canvas view, text editor
- 스토리보드는 코드상에서 정의되어있는 변수들을 인식하지 못하기 때문에 @IBOutlet 을 추가하여 인식시킨다.
- 스토리보드와 코드상의 property를 connect하는 방법
Transitioning to Storyboard Button
- 위의  label과 마찬가지로 button을 연결하는 방법
- 함수에 IBACtion을 추가한다.

###### Quiz: Actions & Outlets quiz
1. An action is a method. An outlet is a property
2. Marking a variable as an IBOutlet makes it visible in Storyboard.
3. A view in Storyboard needs an outlet if it needs to be modified programmatically.
4. A view in Storyboard needs an action if it is expected to respond to user input.

###### Intro: Switches for there Color Make
- 앱 소개

###### Quiz: Researching Switches
- switch 버튼이 변경될때 valueChanged 라는 이벤트 이름으로 알 수 있다.
- Swift on/off는 isOn으로 알 수 있다.

###### Diagramming Color Maker
- 1.  유저가 스위치의 값을 변경하면(Action)
- 2. viewController 에서 스위치의 값을 판단하여 view color를 업데이트한다.

###### Quiz: Connection the color maker
- 처음 다운받은 프로젝트에는 아웃렛, 액션들이 연결되어 있지 않다.
- 그냥 연결하면 됨
###### Help with Connection the Color maker
- 스토리보드와 코드 연결하는 방법
###### Quiz: Debugging Color Maker Error 1
- Blue switch 가 연결되지 않았다.(valueChanged event
###### Quiz: Debugging Color Maker Error 2
- Green Switch outlet이  Blue Swith와 연결되어 있었다.
###### Quiz: Debugging Color Maker Error 3
- fatal error 발생-> color view 가 연결되어 있지 않아 에러 발생

###### View Presentations an Presenting view Controllers
- presentation view 에 대한 설명
###### Get your Game Face on!
- 어려워지니 휴식을 취해라
###### Quiz: Modal presentation vs Navigation
- navigation presentation : 유저가 선택하여 갈수있는 (flat)
- modal presentation: temporary view (Alert message, a self contained task that should be completed or abandoned)
    - 일반적으로 sub view
###### How does a view get presentation
- 메세지 앱 코드가 있다고 가정해봐라.
- presentViewController에서 코드를 처리하면 self.presentViewController(controller, animated: true, completion: nil)
- 위 함수에서 세번째 인자는 클로져로, view가 나타나면 실행되고,
- 두 번째 인자는 뷰가 어떻게 나타나는지 설정하는 인자
- 첫번째는 레퍼런스할 뷰 컨트롤러이다.(어디서 나타날지)

###### Quiz: Launch image picker and aci
- Camera roll, activity view, alert view 3개

```swift
@IBAction fund experiment() {
    let nextController = UIImagePickerController()
    self.presentViewController(nextController, animated: true, completion: nil)
}
```

###### Launch Activity View and Alert
- present 함수를 이용해서 ImagePicker와 Alert뷰를 나타내는 방법 소개
- Summarize code for 3 Experiment

```swift
//Image Picker Controller

@IBAction func experiment(_ sender: Any) {

    let nextController = UIImagePickerController()
    self.present(nextController, animated: true, completion: nil)
}
//Activity View Controller
@IBAction func experiment(_ sender: Any) {

    let image = UIImage()
    let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    self.present(controller, animated: true, completion: nil)
}
//Alert View Controller
@IBAction func experiment(_ sender: Any) {

    let controller = UIAlertController()
    controller.title = "Test Alert"
    controller.message = "This is a test"

    let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) {
      action in self.dismiss(animated: true, completion: nil)
    }

    controller.addAction(okAction)
    self.present(controller, animated: true, completion: nil)
}
```

###### Quiz: Dice example, Take Control
-  첫번째 뷰에서 버튼 클릭하면 두번째 뷰 나오면서 dice 나옴
- 다이스 뷰 컨트롤러 다이어그램 설명
- 처음 프로젝트에서 첫번째 뷰에서 Roll there Dice 가 연결이 안되어 있다.
- 두번째 뷰에서 secondDice  가 연결이 안되어있다.
- ?, ! optional을 설명해준다ㅣ
    - 옵셔널이란 값이 있을수도, 없을수도 있는 변수
    - ? 오퍼레이터를 추가함으로써 옵셔널 변수를 선언
    - ! 오퍼레이터는 강제 언래핑할때 사용한다,

###### Presenting the Dice View Controller
- nil때문에 런타임 에러가난다
- 왜 fristdice가 nil 인가?
    - let controller = DiceViewController() 만 선언하게 되면 DiceViewController에 선언되어 있는 UIView, UIButton 등이 아직 존재하지 않게 된다.
    - 이 이슈를 없애기 위해, var controller: DiceViewController = self.storyboard?.instantiateViewControllerWithIdentifier(“DiceViewController”) as! DiceViewController 로 선언해야한다.
    - instantiateViewControllerWithIdentifier의 아이덴티파이어는 단순히 스트링이다. (스토리보드에 정의되어있는)
    - (“DiceViewController”) as! DiceViewController  -> instantiateViewControllerWithIdentifier리턴 값이 any object이기 때문에 as! DiceViewController 로 cast 하는 작업이 필요하다.
###### Presenting View Controllers:
	- 위 코드를 집어넣어라

###### Quiz: How Do ViewControllers Comm
- 첫번쨰 뷰에서 두번째 뷰로 데이터를 보내는 방법에 대한 설명
- Activity View, AlertView, Dice View

###### Demonstrate Code & Segue
- 1. 스토리보드의 세그웨이와 결합하여 데이터를 보내는 방법
    - 첫번쨰 뷰에서 두번째 뷰로 Modal 쎄그웨이를 만든다.
		 // 1. 스토리보드에서 segue를 만들고, 그 segue의 identifier를 이용해 다음 뷰로 이동하는 방법
    - performSegue(withIdentifier: "rollDice", sender: self) 를 추가한다.
###### Code & Segue Review
- 위 코드 리뷰

###### Segue Only
- 위에서 view에 추가한 segue를 지우고 roll the dice 버튼에 segue를 추가한다.

###### Passing Data between ViewController
- DiceViewController를 보여주는 3가지 방법이 있다.
    - Only Code
    - Code + Segue(Segue와 action code 같이)
    - only segue
###### prepareForSegue
- UIViewController에 대한 설명
    - storyboard와 interacting 하는 부분
    - prepareForSegue
    - performSegueWithIdentifier
- prepare 함수를 추가하고, performSeguewithIdentifier를 사용해 데이터를 보내는 방법에 대한 설명
###### Review of prepareForSegue
- identifier 에 따라 데이터를 보내는 방법
- 같은 뷰컨트롤러에 여러개의 segue 가 있을 수도 있으니까 위 방법을 사용해야한다.(if segue.identifier == "rollDice" )

###### Challenge App: Roshambo
- 위에서 설명한 3가지를 모두 활용해 개발해본다.



###### Introducing Delegates
- delegate modal, view, controller  간에 많이 쓰인다.

###### Reuse with Customization
- delegate를 활용해 다른 customized behaviors를 만들어본다,
- 첫번째는 개, 고양이를 입력하면 이모니콘이 나오게
- 두번째는 텍스트의 색깔이 변하도록
- 문자열 길이 표시되도록
- delegate는 다른 오브젝트를 대신해 method를 실행해주는 오브젝트이다.
    - safari 에서 서치할때 자동완성되는 것도 delegate패턴이다
###### The Course Github Repository
- 깃허브 사용하자
###### Quiz: Compare and Contrast Custom TextField
- 정답
    - response to new characters being typed
    - reaction to the return button
    - behavior when editing begins
- textField1에는 emoji라는 놈을 delegate, field2는 colorzierDelgate, field3은 자기 자신


###### Introducing Protocols
- delegate pattern 의 중요한 점은  프로토콜을 통해서 view에서 delegate할 controller를 설정하는 것이다.
- 프로토콜은 반드시 정의되어야하는 메소드들이다. (delegat햇으면)

###### Real World Examples of Protocols
- 말과 귀(스피커의 주파수?)
- electric plug : standard electric 플러그 프로토콜로 개발된 것들은 같은 socket을 통해 전기를 받을수 있다. 세계의 다른 지역에서도 ??
###### Quiz: Text Field Code Review
- 위  텍스트필드에서 delegate된 것들을 서로 바꾸면 그 행동들이 바뀌는가?
- 코드에서 delegate 받는 것들을 서로 스왑하여 테스트한다.

###### The UITextFieldDelegate Protocol
- 이제 앞으로 개발할 함수들을 살펴본다,
- Editing lifecycle
- methods
  - textFieldShouldBeginEditing()
  - textFieldDidBeginEditing()
  - textFieldShouldEndEditing() 
  - textFieldDidEndEditing()
- The primary method for controlling text:
  - textField(shouldChangeCharactersIn:replacementString:)
- The clear button (the ‘x’ on the right side of some text fields):
  - textFieldShouldClear()
- The return key in the keyboard:
  - textFieldShouldReturn()


###### Diagramming the text field app
- 텍스트필드1번은 컬러라이저딜리게이트
- 텍스트필드2번은 이모지
- 텍스트필드3번은 self -> viewController 에서도 delegate protocol 개발해야한다.
- UILabel은 필드3번과 연결되어 텍스트 길이를 표시해준다,-> 여기서 delegate
    - 1. 유저가 키를 입력하면
    - 2. 텍스트필드는 텍스트가 변경된걸 감지하고
    - 3. shouldChangeCharactersInRange를 invoke한다.
    - 4. ViewController는 이 invoke를 받고, label을 업데이트한다.
```swift
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Figure out what the new text will be, if we return true
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString

        // hide the label if the newText will be an empty string
        self.characterCountLabel.isHidden = (newText.length == 0)

        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)

        // returning true gives the text field permission to change its text
        return true;
    }
```

###### Quiz: A look at the other two delegates
-  이모지와 칼라라이저 protocol은 차이점이있다.
- 이모티콘 텍스트 필드는 글자가 있으면 편집할때 다 지워버린다. 리턴키가 키보드를 숨겨주지 않는다.
- 칼라라이저는 글자가 있어도 시작할때 지우지 않는다. 엔터키누르면 숨긴다.
- emoji
    - textFieldBeginEditing
    - textField
- colorizer
    - textField
    - textFieldShouldReturn
	- textField.resignFirstResponder() : 키보드를 숨긴다.


###### Creating a random color delegate
-  텍스트필드에 입력될때마다 칼라가 바뀌는 클래스 만들어봐
###### Random Color Delegate Code
- 코드 설명

###### Preparing for the Challenge Apps
- placeholder 추가
- 키보드 타입 설정
###### Challenge Apps
- 1. 텍스트필드의 길이를 5자로 제한, 항상 숫자만
- 2. 달러표시, 소수 둘째자리, 항상 숫자만
- 3. 스위치 버튼이 on 일 경우에만 텍스트 입력 가능하도록

###### Build V1.0 of the Meme
- 이미지를 픽업
- 이미지에서 텍스트 수정
- view도 움직여아함(키보드 온일떄)
- 이미지 공유

###### Picking Images
- ImageView를 추가하고 toolbar 추가 -> toolbar 의 아이템에 액션 추가
- info.plist 에 Privacy - Photo Library Usage Description추가해야함



























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
