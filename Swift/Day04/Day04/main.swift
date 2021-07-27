//
//  main.swift
//  Day04
//
//  Created by 임현진 on 2021/07/19.
//

import Foundation

//함수

func interSum(a:Int,b:Int) -> Int {
    return a + b
}

//변수는 데이터라 소모될 수 있어서 속도가 느려진다 그러니 많이 사용하지 말 것
print(interSum(a: 5, b: 8))

func greet(person: String) -> String {
    let greeting = "Hello,\(person)!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func sayHelloWorld() -> String {
    return "Hello,world!"
}

print(sayHelloWorld())

// name을 보이기 싫다 : _ 사용 | zipCode를 내부적인 곳에서만 써야한다 : 우편번호 zipCode 쓰라
func buildAddress(_ name:String, address:String, city:String, 우편번호 zipCode:String,country:String?="USA") -> String {
    return """
        \(name)
        \(address)
        \(city)
        \(zipCode)
        \(country ?? "")
        """
}

print(buildAddress("유비", address: "중국", city: "상하이", 우편번호: "123", country: "China"))
//country를 아예 안쓰면 default값인 USA로 나옴
print(buildAddress("장비", address: "중국", city: "북경", 우편번호: "234"))
//nil값을 쓰면 country 결과가 아예 안나옴
print(buildAddress("조조", address: "중국", city: "스촨", 우편번호: "345", country: nil))

//가변 매개변수
func sayHelloFriends(me:String,friend:String...) -> String{
    return "Hello \(friend)! I'm \(me)."
}

print((sayHelloFriends(me: "초선", friend: "손견","손책","장양")))

//


//복수의 값을 반환하는 함수
func getCountry() -> (dialCode:Int,isoCode:String,name:String) {
    let Country = (dialCode: 82, isoCode:"KR",name:"Korea")
    return Country
}

let ret = getCountry()
print(ret)
print(ret.dialCode)

//시작숫자부터 끝숫자까지의 합계를 구하는 함수
//1)for문
var total:Int = 0
func addRange(start:Int,end:Int) -> String{
    for x in start...end{
        total += x
    }
    return "\(start)부터 \(end)까지의 합은 \(total)입니다."
}


//for x in 1...100{
//    total = total + x
//}
//print("total = \(total)")

//2)while문
func addRange1(start:Int,end:Int) -> String {
    var startNum = start
    var sumResult = 0
    while startNum <= end {
        sumResult += startNum
        startNum += 1
    }
    return "\(start)부터 \(end)까지의 합은 \(total)입니다."
}
print(addRange(start: 1, end: 100))
print(addRange1(start: 1, end: 100))

//Overloading : 함수의 이름은 중복되도 parameter의 갯수로 구분이 가능

//도형의 면적과 둘레를 구하는 함수
func  shape(_ r:Double) {
    let pi = 3.14
    let area = pi*r*r
    let border = 2*pi*r
    print("원 : \(area),\(border)")
}
shape(5)

func shape(_ w: Int,_ h:Int) {
    let area = w*h
    let  border = (w+h)*2
    print("직사각형 : \(area),\(border)")
    
}
shape(5,6)

//직각 삼각형
func shape(_ w:Int, _ h:Int,_ d:Int){
    let  area = (w * h)/2
    let border = w + h + d
    print("직각삼각형 : \(area),\(border)")
}
shape(3,4,5)

/*
 Class : 전통적인 OOP관점에서의 클래스
 -단일 상속
 -property
 -constructor
 -method
 -참조 타입 선언(Call by reference)
 
 Struct
 -상속불가
 -property
 -constructor
 -method
 -값 타입 선언(Call by value)
 
 */

//Class와 Struct의 비교
struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

let firstStructInstance: ValueType = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("First:\(firstStructInstance.property)") // 1
print("Second:\(secondStructInstance.property)") // 2 -->쌍둥이를 만들어도 상속이 안되기 때문에 다른 값을 가진다.(이란성쌍둥이 같은 느낌??)

let firstClassInstance : ReferenceType = ReferenceType()
var secondClassInstance = firstClassInstance
secondClassInstance.property = 2

print("first:\(firstClassInstance.property)")//2
print("second:\(secondClassInstance.property)") //2 --> 쌍둥이를 만들고 상속이 되었기 때문에 같은 값을 가진다.(일란성 쌍둥이 느낌!!)




