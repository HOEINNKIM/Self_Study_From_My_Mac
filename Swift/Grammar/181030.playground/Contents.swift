//Exam01 - Array

var cities = ["Seoul", "New York", "LA", "Santiago"]

cities[0]
cities[1]
cities[2]
cities[3]

//배열의 순회탐색 1.  배열의 길이 활용
let length = cities.count
for i in 0..<length{
    print("\(i)번째 원소는 \(cities[i])입니다")
}

//배열의 순회탐색 2. 배열의 Iterator 활용
for i in cities {
    print("배열 원소는 \(i)입니다")
}

//배열의 순회탐색 3. Iterator으로부터 배열의 인덱스 값 얻기
for i in cities {
    let index = cities.index(of:i)
    print("\(index!)번째 배열 원소는 \(i)입니다")
}

//배열의 선언과 초기화를 따로 지정
var cities2 : Array<String>
cities2 = Array()

//배열의 선언과 초기화를 동시에
var cities3 = Array<String>()

//전체 구문
var cities4 : Array<String> = Array<String>()

//배열의 선언과 초기화 2-1 - 이전 타 언어와의 연결성을 인식
var cities5 : [String]
cities5 = [String]()

//배열의 선언과 초기화 2-2 - 빈 배열을 할당하는 초기화 방식
var cities6 : [String]
cities6 = []

//배열의 선언과 초기화 2-3 - 선언과 초기화를 한번에
var cities7 : [String] = [String]()
var cities8 = [String]()

