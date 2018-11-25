//1.옵셔널 강제 해제

var optInt : Int? = 3

print("옵셔널 자체의 값은 \(optInt)입니다")
print("!로 강제 해제한 값 : \(optInt!)")


print("------------------------------------------------")

//1-1.옵셔널 값의 안전한 해제
var str = "123"
var intFromStr = Int(str)

if intFromStr != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr!)입니다")
} else {
    print("값 변환에 실패하였습니다")
}

print("------------------------------------------------")
//1-2.nil값이 반환될 경우
var str2 = "SWIFT"
var intFromStr2 = Int(str2)

if intFromStr2 != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr2!)입니다")
} else {
    print("값 변환에 실패하였습니다.")
}

//2.옵셔널 바인딩
var str3 = "SWIFT"
if let intFromStr3 = Int(str3) {
    print("값 변환 성공. \(intFromStr3)")
} else {
    print("값 변환 실패")
}

//2-2.배열의 옵셔널 처리

func intStr(str3 : String){
    
    guard let intFromStr3 = Int(str3) else {
        print("값 변환 실패")
        return
    }
    
    print("값 변환 성공. 변환값 : \(intFromStr3)")
}

//딕셔너리 값을 키값으로 접근할 때 옵셔널을 반환
var capital = ["KR" : "Seoul", "EN" : "London", "FR" : "Paris"]

print(capital["KR"])
print(capital["KR"]!)

//딕셔너리 값을 읽을 때 존재하지 않는 키를 사용할 가능성때문에 옵셔널 반환
if (capital["KR"] != nil){
    print(capital["KR"]!)
}
//혹은
if let val = capital["KR"]{
    print(val)
}

//컴파일러에 의한 옵셔널 자동 해제
let optInt1 = Int("123")

if(optInt1 == 123){
    print("optInt1==123")
}else{
    print("optInt1!=123")
}

//비교 연산자를 사용하는 경우에 옵셔널과 일반타입을 비교한다면 자동으로 옵셔널 해제
let tempInt = Int("123")

tempInt == 123
tempInt == Optional(123)
tempInt! == 123
tempInt! == Optional(123)

//묵시적 옵셔널 선언(? 자리에 !로 변경)
var strX: String! = "Swift Optional"
print(strX) //왜 안되는가? (1)

//묵시적 옵셔널로 인한 연산
var value01: Int! = 10
print(value01)
value01 + 5 // 왜 안되는가? (2)
