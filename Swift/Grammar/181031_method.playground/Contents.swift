//1.1 매개변수와 반환값이 모두 없는 함수
func printHello(){
    print("안녕하세요")
}

//1.2 매개변수가 없지만 반환값은 있는 함수
func sayHello() -> String{
    let returnValue = "안녕하세요"
    return returnValue
}

//1.3 매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name: String){
    print("\(name)님, 안녕하세요")
}

//1.4 매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name: String) -> String {
    let returnValue = "\(name)님, 안녕하세요"
    return returnValue
}

//void 에서 return 사용하는 경우 -> ex:옵셔널 바인딩 실패할 경우 리턴
func hello(name: String?) {
    guard let _name = name else {
        return
    }
    
    print("\(_name)님, 안녕하세요")
}

//1번 함수결과
printHello()

//3번 함수결과
let inputName = "홍길동"
printHelloWithName(name: inputName)

//함수 호출의 방법
func times(x: Int, y: Int) -> Int {
    return(x*y)
}

times(x:5, y:5)
times(x:y:)(5, 6)

//튜플 함수(2개의 값) 반환
func getIndvInfo() -> (Int, String){
    let height = 180
    let name = "꼼꼼한 재은씨"
    return (height, name)
}
print(getIndvInfo())

//튜플 함수(3개의 값) 반환
func getUserInfo() -> (Int, Character, String){
    let gender: Character = "M"
    let height2 = 180
    let name2 = "꼼꼼한 회인씨"
    return (height2, gender, name2)
}
print(getUserInfo())

//튜플 인덱스로 요소 참조
var uInfo = getUserInfo()
print(uInfo.0)
print(uInfo.1)
print(uInfo.2)

var(a,b,c) = getUserInfo()
print(a)
print(b)
print(c)

var(d,_,e) = getUserInfo()
print(d)
print(e)

//변수 할당하여 리턴하기
func getUserInfo2() ->(h: Int, g: Character, n: String){
    let gender : Character = "M"
    let height3 = 180
    let name3 = "회인"
    
    return(height3, gender, name3)
}

var result = getUserInfo2()
result.g
result.h
result.n

//타입 알리어스
typealias infoResult = (h: Int, c: Character, s: String)

func getUserInfoT() -> infoResult {
    let genderT : Character = "M"
    let heightT = 180
    let nameT = "회인"

    return (heightT, genderT, nameT)
}
let infoT = getUserInfoT()
infoT.0
infoT.1
infoT.2

infoT.c
infoT.h
infoT.s


//7.2.2 가변인자
func avg(score: Int...) -> Double {
    var total = 0
    for r in score {
        total += r
    }
    return (Double(total)/Double(score.count))
}

print(avg(score: 10, 20, 30, 40))

//7.2.3 기본값을 갖는 매개변수
func echo(message: String, newLine: Bool = true){
    if newLine == true {
        print(message, true)
    } else {
        print(message,false)
    }
}
echo(message: "안녕하세요")
echo(message: "안녕하세요", newLine: true)
echo(message: "안녕하세요", newLine: false)

//7.2.4 매개변수의 수정
func incrementBy(base: Int) -> Int{
    var base = base
    base += 1
    return base
}
incrementBy(base: 7)

func descAge(_ name: String, _ paramAge: Int) -> String {
    var name = name
    var paramAge = paramAge
    
    name = name + "씨"
    paramAge += 1
    return "\(name)의 내년 나이는 \(paramAge)"
}
descAge("아", 27)

//7.2.5 InOut 매개변수
//(1)값에 의한 전달
var cnt = 30

func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    return value
}

print(autoIncrement(value: cnt))
print(cnt)

//(2)참조에 의한 전달
func foo(paramCount: inout Int) -> Int {
    paramCount += 1
    return paramCount
}

var count = 30
print(foo(paramCount: &count))
print(count)

    //상수는 inout 매개변수에 인자값으로 전달 불가
    let count1 = 30
    //foo(paramCount: &count1)

    //리터럴은 inout 매개변수에 인자값으로 전달 불가
    //foo(paramCount: &30)

    //변수는 inout 매개변수에 인자값으로 전달 가능
    var value = 30
    foo(paramCount: &value)
    print(value)

//7.2.6 변수의 생존 범위와 생명 주기
do{
    do{
        var ccnt = 3
        ccnt += 1
        print(ccnt)
    }
    
    //ccnt += 1
    //print(ccnt)
} // 잘못

do{
    var ccnt1 = 0
    do{
        ccnt1 = 3
        print(ccnt1)
    }
    ccnt1 += 1
    print(ccnt1)
}

var countX = 30

func foo() -> Int {
    countX += 1
    return countX
}
print(count)
func foo1() -> Int {
    countX += 1
    return countX
}
print(count)

//일급 함수의 특성
//1. 객체가 런타임에도 생성이 가능해야 한다.
//2. 인자값으로 객체를 전달할 수 있어야 한다.
//3. 반환값으로 객체를 사용할 수 있어야 한다.
//4. 변수나 데이터 구조 안에 저장할 수 있어야 한다.
//5. 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야 한다.

//일급 함수의 특성 1. 변수나 상수에 함수를 대입할 수 있음

func foo(base: Int) -> String {
    return "결과값은 \(base + 1) 입니다"
}

let fn1 = foo(base: 5)

func boo(age: Int) -> String {
    return "\(age)"
}
let fb1: (Int) -> String = boo
fb1(5)

func desc() -> String {
    return "this is desc()"
}

func pass() -> () -> String {
    return desc
}

let p = pass()
p()


func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func Times(a: Int, b: Int) -> Int {
    return a * b
}

func devide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+" :
        return plus
    case "-" :
        return minus
    case "*" :
        return Times
    case "/" :
        return devide
        default :
        return plus
    }
}
let ca = calc("+")(3,4)
let c2 = calc("-")
c2(4,3)


//일급함수의 특성 3 - 함수의 인자값으로 함수를 사용할 수 있다.

func incr(param: Int) -> Int{
    return param+1
}

func broker(base: Int, function fn4: (Int) -> Int) -> Int {
    return fn4(base)
}

broker(base: 3, function: incr)

//Call Back Function

func successThrough(){
    print("연산 처리가 성공했습니다")
}

func failThrough(){
    print("처리 과정에 오류가 발생하였습니다")
}

func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    
    guard base != 0 else {
        fCallBack()
        return 0
    }
    
    defer {
        sCallBack()
    }
    
    return 100 / base
}

divide(base: 30, success: successThrough,fail: failThrough)


//7.3.2 Nested Function

//Example1
func outer(base: Int) -> String {
    func inner(inc: Int) -> String {
        return "\(inc)를 반환합니다."
    }
    let result = inner(inc: base + 1)
    return result
}

outer(base:3)

//Example2
func outer(param: Int) -> (Int) -> String {
    func inner(inc: Int) -> String{
        return "\(inc)를 리턴합니다."
    }
    return inner
}

let fnn = outer(param: 3)
let fnn2 = fnn(30)

//Example3
func basic(param: Int) -> (Int)->Int{
    let value = param + 20
    
    func append(add: Int) -> Int {
        return value + add
    }
    
    return append
}

let resultn = basic(param: 10)
resultn(10)


//7.4 Closure
//Example1
let f = { () -> Void in
    print("클로저가 실행됩니다.")
}
f()

//Example2
({() -> Void in
    print("클로저가 실행됩니다.")
})()

//Example3
let clo1 = {(s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
}
clo1(1,"closure")

//Example4
({(s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
    
})(1, "Closure2")

//Example5
func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2{
        return true
    } else {
        return false
    }
}
var valueClo = [1,9,5,7,3,2]
valueClo.sort(by: order)

var valueClo2 = [1,9,5,7,3,2]
valueClo2.sort(by: {(s1: Int, s2: Int) -> Bool in return s1 > s2})
valueClo2.sort(by: {(s1: Int, s2: Int) in return s1 > s2})
valueClo2.sort(by: {s1, s2 in return s1 > s2})
valueClo2.sort(by:{$0 > $1})
valueClo2.sort(by:>)

//7.4.3 Trailing Closure

valueClo2.sort(){(s1, s2) in return s1 > s2}

//If you have only one param
valueClo2.sort{(s1,s2) in return s1 > s2}

//If you have more param
func divideClo(base: Int, success s: () -> Void) -> Int {
    defer{
        s()
    }
    return 100 / base
}

divideClo(base: 3){()
    in print("연산 성공")}

//If you have 2 closures at the end
func divideClo2(base: Int, success s:() -> Void, fail f: () -> Void) -> Int {
    guard base != 0 else {
        f()
        return 0
    }
    defer{
        s()
    }
    return 100 / base
}   //You can use only 1 closure, not two

divideClo2(base:3, success: {() in print("연산 성공")}) {() in print("연산 실패")}

//7.4.4 @escaping and @autoescape

//Example1_@escaping
func callback(fn: @escaping () -> Void){
    let f = fn
    f()
}

callback{
    print("Closure가 실행되었습니다")
}

//Example2_@autoclosure
func condition(stmt: @autoclosure () -> Bool){
    if stmt() == true{
        print("결과가 참")
    } else {
        print("결과가 거짓")
    }
}
condition(stmt: (4 > 2))

//Example3
var arrs = [String]()

func addVars(fn: @autoclosure ()->Void){
    arrs = Array(repeating: "", count: 3)
    fn()
}
addVars(fn: arrs.insert("KR", at: 1))
