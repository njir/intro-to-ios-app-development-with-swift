#Intro-to-ios-app-development-with-swift

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

## 2017-01-01
### Audio in iOS
- ![Audio in iOS](https://cloud.githubusercontent.com/assets/7614353/21580454/413ac8aa-d03a-11e6-9399-b322197c2af0.png)
- AVFoundation: av audio recorder을 포함한다.
- Delegate: 개념정리할것
AVAudioRecorderDelegate : protocol
- ![Stack Views](https://cloud.githubusercontent.com/assets/7614353/21580534/40a32156-d041-11e6-9802-5b5d51eb6965.png)
  - storyboard에서 stack의 distribution을 Fill Equally로 해야 버튼 정렬됨
