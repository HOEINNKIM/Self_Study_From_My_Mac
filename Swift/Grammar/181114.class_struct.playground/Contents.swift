//Class and Struct Example

//1
struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    var res = Resolution()
    func desc() -> String {
        return "VideoMode 클래스"
    }
}

let insRes = Resolution()
let insVMode = VideoMode()
let width = insRes.width
print("insRes 인스턴스의 width값은 \(width)입니다.")
let vMode = VideoMode()
print("vMode 인스턴스의 witdh값은 \(vMode.res.width)입니다.")

vMode.name = "Sample"
vMode.res.width = 1280
print("\(vMode.name!) 인스턴스의 width 값은 \(vMode.res.width)입니다.")

//Memberwise Initializer
let defaultRes = Resolution(width: 1024, height: 768)
print("width: \(defaultRes.width), height: \(defaultRes.height)")


//Call By Value from struct

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print("cinema 인스턴스의 width 값은 \(cinema.width)입니다!")

//Call By Value from class
let video = VideoMode()
video.name = "Original Video Instance"

print("video인스턴스의 name 값은 \(video.name)입니다!")

let dvd = video
dvd.name = "DVD Video Instance"

print("video인스턴스의 name 값은 \(video.name)입니다!")

func changeName(v: VideoMode){
    v.name = "Function Video Instance"
}

changeName(v: video)
print("video인스턴스의 name 값은 \(video.name)입니다!")

// ===, !==
if(video === dvd){
    print("동일 인스턴스 참조")
} else {
    print("다른 인스턴스 참조")
}

let vs = VideoMode()
let ds = VideoMode()

if(vs === ds){
    print("same address")
} else {
    print("different address")
}
