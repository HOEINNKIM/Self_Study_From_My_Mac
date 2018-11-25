for row in 1...9{
    print("2 * \(row) = \(2*row)")
}

for year in 1970...2018{
    print("\(year) 년도")
}

var lang : String = "SWIFT"
for hi in lang{
    print("\(hi)")
}

for i in 1..<10 {
    for j in 1..<10{
        print("\(i) * \(j) = \(i*j)")
    }
}

var A1 = 3
var A2 = 3

if A1 < A2 {
    print("정상")
} else if A1 == A2 {
    print("비정상")
} else {
    
}

let val = 2

switch val {
case 1:
    print(1)
case 2:
    fallthrough
case 2:
    print("일치 하나 더")
default:
    print("어느 패턴과도 일치하지 않음")
}

