
# Class
- 전통적인 oop 관점에서의 클래스
  - Swift에서는 주로 인스턴스라고 부름(객체가 곧 인스턴스)
- 단일 상속
- (인스턴스/타입) method
- (인스턴스/타입) property
  - 클래스 변수 -> 타입 프로퍼티. 단순 용어 변경
- **Reference 타입**
- iOS 프레임워크의 대부분의 큰 뼈대는 모두 클래스로 구성
- **Class의 인스턴스를 초기화(init)할 때, 선언해놓은 모든 값을 설정해야한다** 는 규칙이 있음

# Struct
- C언어 등의 구조체보다 다양한 기능
- 상속 불가
- (인스턴스/타입) Method
- (인스턴스/타입) property
- **Value 타입**
- Swift의 대부분의 큰 뼈대는 모두 구조체로 구성

# Enum
- 다른 언어의 열겨형과는 많이 다른 존재
- **Value 타입**
- 상속 불가
- (인스턴스/타입) Method
- (인스턴스/타입) 연산 프로퍼티
- Enumeration
- 하나의 데이터 타입이 될수 있음
- 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의
- **열거형 자체가 하나의 데이터 타입  
열거형의 case 하나하나 전부 하나의 유의미한 값으로 취급**
- 선언 키워드 - enum

```swift
enum Aninal {
  case tiger
  case leopard
  case snowLeopard
  case lion
  case cat, dog, elephant
}

//기존의 0, 1, 2, 3 이런건 잊어버릴것
let tiger: Animal = Animal.tiger
let leopard: Animal = .leopard // Animal.leopard 라고 안써도 됨

switch tiger {
  case Animal.tiger:
    print("tiger")
  case .cat:
    print("cat")
}
```

- 기존 언어와 비슷하게 사용하고 싶다면 raw value를 가질 수 있지만 굳이 꼭 필요한 경우가 아니라면 사용하지 않는다.

```swift
enum PrintOption: Int {
  case black = 0
  case red
  case blue
}

PrintOption.black.rawValue  // 0
// 전달한 rawValue에 해당하는 case가 없을 수 있기 때문에
// rawValue를 통한 인스턴스 생성은 옵셔널로 지정

// 정수 타입일 때만 0, 1, 2.. 추가되고 그게 아니라면 하나씩 다 raw value를 지정해야 한다.
```

- 열거형은 메서드와 연산 프로퍼티를 가질 수 있다.

```swift
enum Color {
  case red, green, blue

  var currentStateByComputedProperty: Void {
    swift self {
      case .red: print("Red")
      default:   print("others")
    }
  }

  func currentStateByFunction() {
    swift self {
      case .red: print("Red")
      default:   print("others")
    }
  }
}

// implementation
var color: Color = Color.red
color.currentStateByComputedProperty //red
color.currentStateByFunction //red

color = .blue
color.currentStateByComputedProperty //others
color.currentStateByFunction //others

```

# Class / Struct / Enum
- Class만 Reference 타입이고, 상속 가능
- Struct는 언제 사용하나
    - 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶을 때
    - 다른 객체 또는 함수 등으로 전달될 때  
    **참고가 아닌 복사를 원할 때**
    - 자신을 상속할 필요가 없거나, **자신이 다른 타입을 상속받을 필요가 없을 때**
- iOS 프로그래밍을 할 때는 주로 Class를 사용한다.


### Value vs Reference
- Value
  - 데이터를 전달할 때 값을 **복사** 하여 전달

```swift
struct SomeStruct {
  var someProperty: String = "Property"
}

var someStructInstance: SomeStruct = SomeStruct()
func someFunction(structInstance: SomeStruct) {
  var localVar: SomeStruct = structInstance
  localVar.someProperty = "ABC"
}

someFunction(someStructInstance)
print(someStructInstance.someProperty) // Property
```

- Reference
  - 데이터를 전달할 때, 값의 메모리 위치를 전달

```swift
class SomeClass {
  var someProperty: String = "Property"
}

var someClassInstance: SomeClass = SomeStruct()
func someFunction(classInstance: SomeClass) {
  var localVar: SomeClass = classInstance
  localVar.someProperty = "ABC"
}

someFunction(someClassInstance)
print(someClassInstance.someProperty) // ABC
```

# Data types in Swift
- swift에서 왜 변수 타입이 구조체일까

```swift
public struct Int
public struct Double
public struct String
```
- swift는 구조체, 열거형 사용을 선호
- iOS는 대부분 클래스 사용

# Optional
- 우선 Swift는 Safe, Fast, Expressive한 언어이다.
  - 버전 1에서는 Safe, Fast, Modern 이었지만 바뀌었다.
- Optional 은 값이 **있을수도 없을 수도** 있다.
- Why?
 - compile time에서 에러를 검출 할 수 있다.
 - Null pointer Exception 같은 에러들
 - Optional이면 nil or 실패일수도 있으니 대비를 해라.

- Optional
 - enum + Generic
 - 그래서 nil 이어도 메모리를 차지하고 있음.
```swift
let optionalValue: Int? = 100
switch optionalValue {
  case .none:
    print("is nil")
  case .some(let value):
    print("value is \(value)")
}
```
- Optional의 값을 추출하는 것을 언래핑이라고 한다.

# Optional Binding
- if let 구문
```swift
func printName(_ name: String) {//String과 String? 타입은 다르다.
  print(name)
}

var myName: String? = nil
if let name = myName {  // myName변수에 값이 있으면 name 에 넣자.
  printName(name)       // 해당 변수가 nil이 아닌 것을 확신할 수 있다.
}
```

# Optional Chaining
- Optional Binding 의 연속 콤보
```swift
let addressNumber: Int? = paul.residence?.address?.number
// 중간 optional 변수 어딘가에서 nil 이라면 nil 리턴한다.
// residence 가 nil이 아니면 address로 가고...

if let addressNumber = paul.residence?.address?.number
{
  print(addressNumber)
}
```

# ! 는 무엇인가
- Force Unwrapping 즉, 강제 추출

```swift
func printName(_ name: String) {
  print(name)
}

var myName: String? = nil

printName(myName!)  // 컴파일은 되지만 runtime 에러가 발생할 것이다.
```
- 일단 잘 안쓰는게 좋다. 하지만 쓸때도 있다.
- Implicitly Unwrapped Optional
- 암시적 추출 옵셔널
  - 옵셔널 바인딩으로 매번 값을 추출하기 귀찮거나 로직상으로 nil이 할당되지 않을 것 같다는 확신이 들 때
  - 클래스의 프로퍼티로 주로 사용
    - **Class의 인스턴스를 초기화(init)할 때, 선언해놓은 모든 값을 설정해야한다** 는 규칙이 있음
    - 옵셔널로 선언되어 있으면 설정안해도 된다.(?, ! 모두 옵셔널임)
 - nil이 할당되어 있을 때, 접근을 시도하면 runtime 에러 발생

```swift
var myName: String! = nil

if let name = myName {    // ! 도 옵셔널이기 때문에 check 가능
  print("name is \(name)")
} else {
  print(name is nil)
}
```

# guard
- Early exit
- 빠른 종료 구문
- guard else 가 있어야함
  - 제어 구문이 else 안에 있어야 함

```swift
for i in 0...3 {
  if i == 2 {
    print(i)
  } else {
    continue
  }
}


for i in 0...3 {
  guard i == 2 else {
    continue
  }
  print(i)
}
```

```swift
func someFunction(_ param: Int?) {
  guard let value = param, value > 10 else {
    print("실행할 필요 없음")
    return
  }

  print("값이 10보다 크므로 계속 실행")
  print("\(value)") // value 상수는 guard-let 구문 통과 후 사용 가능
}
```

# Type Casting
### Type Casting in C
- 인스턴스의 타입을 다른 타입으로 변환

### Type Casting in Swift
- 인스턴스의 타입을 확인
- 인스턴스를 다른 타입의 인스턴스인 것처럼 행세하도록 컴파일러에게 안내
- as 키워드 사용
```swift
class Person{}
class Student: Person{}

let me: Person = Person()
let you: Student = Student()

//Optional Casting
let meAsStudent: Student? = me as? Student //me가 student로 casting 될 수 있느냐?라고 물어보는 것임

//Force Casting
let meAsStudent2: Student = me as! Student // 강제로 집어넣는다. me가 student로 casting이 안되면 에러 발생

// Optional binding 과 연계 사용
if let someOne = me as? Student {
  print("I'm student")
}

let someOne: Person = you as Person
```

# Type check
- 타입이 맞는지 확인
- is 연산자 사용
- 결과는 Bool 타입

# Error Handling
- do
- try
- catch
```Swift
let bundlePath = Bundle.main.bundlePath

do {
  let files = try FileManager.default.contentsOfDirectory(atPath: bundlePath)
  print("bundle files \(files)")
} catch {
  print("error occurred \(error")
}

let files = try? FileManager.default.contentsOfDirectory(atPath: bundlePath) // 실패하면 nil을 넣어라.

```
