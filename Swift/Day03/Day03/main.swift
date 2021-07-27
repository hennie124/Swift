//
//  main.swift
//  Day03
//
//  Created by 임현진 on 2021/07/16.
//

import Foundation

//Dictionary
//Key와 Value로 구성됨
                              //Key , value       Data
//var scoreDictionary:Dictionary<String,Int> = [String: Int]()
var scoreDictionary: [String:Int] = [:]    //array + : -->dictionary
scoreDictionary["유비"] = 100
scoreDictionary["관우"] = 90
scoreDictionary["장비"] = 80

print(scoreDictionary)

//초기 값을 가지는 Dictionary
let initializedDictionary:[String:String] = ["name" : "James","gender":"male"]

//Set
//Set은 집합연산에 사용되고, 중복 데이터를 적용하지 않는다.

//let oddDigits : Set = [1,3,5,7,9,9,9,9]
let oddDigits : Set = [1,3,5,7,9]
let  evenDigits : Set = [0,2,4,6,8]
let singleDigitPrimeNumbers : Set = [2,3,5,7]

//합집합
print(oddDigits.union(evenDigits).sorted())

//교집합
print(oddDigits.intersection(singleDigitPrimeNumbers).sorted())

//차집합
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())

//Set의 동등 비교
let houseAnimals : Set = ["dog","cat"]
let  farmAnimals : Set = ["cow","chicken","sheep","dog","cat"]
let cityAnimals : Set = ["duck","rabbit"]

//데이터가 완전히 둘 다에 있어야 한다.
print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))

//데이터가 완전 다르냐 같냐
print(farmAnimals.isDisjoint(with: cityAnimals))
print("======================================")

//If
var isCar = true
var isNew = true

if isCar, isNew{
    print("New Car")
}

isNew = false
if isCar,isNew{
    print("Old Car")
}

// MARK: 4. Switch 조건문

// Switch 조건문_IOS는 이게 잘 되어있어서 If문 잘 안 씀...

// Before Switch

let personAge = 14

if personAge < 1{
    print("baby")
}else if personAge < 3{
    print("toddler")
}else if personAge < 5{
    print("preshooler")
}else if personAge < 13{
    print("gradeschooler")
}else if personAge < 18{
    print("teen")
}else{
    print("adult")
}

// After using Switch statement

switch personAge{
case 0..<1:
    print("baby")
case 1..<3:
    print("toddler")
case 3..<5:
    print("preshooler")
case 5..<13:
    print("gradeschooler")
case 13..<18:
    print("teen")
default:            //  기타 등등 default
    print("adult")
}
// Switf는 기본이 안 흘러내려가는 것이라 break가 필요 없는 것

let someInteger = 123456

switch someInteger{
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

// cf). 64비트 언어...
print(Int.max)
print(Double.maximum(10.0, 20.0)) // 최대값 찾는 애.. 별로 쓸 일이 없음

let aCharacter: Character = "a"

switch aCharacter{
case "a", "A": // 여기서 or 조건....? 또한, where 조건 쓰는 switch문도 있음
    print("The letter A")
default:
    print("Not the letter A")
}

// 국어, 영어, 수학 점수로 총점 평균을 구하고 등급을 정하기

let name = "유비"
let kor = 91
let eng = 97
let math = 95

var tot = 0
var avg: Double = 0

tot = kor + eng + math
//avg = tot / 3
// 계산해서 줄 놈(avg)이 Double이라 Type이 안 맞아서 에러 뜨는 것임! 따라서, 왼쪽의 Type에 맞춰줘야 함!

avg = Double(tot) / 3

// 퀴즈
// 점수 등급 출력 - 1

// if문을 이용한 등급 출력
var grade: String

if avg >= 90{
    grade = "A"
}else if avg >= 80{
    grade = "B"
}else if avg >= 70{
    grade = "C"
}else if avg >= 60{
    grade = "D"
}else {
    grade = "F"
}

// switch case문을 이용한 등급 출력
switch avg{
case 90...100: // 100점 포함시 "90..<100" 가 아니라 "90…100"임(점 3개)
    grade = "A"
case 80..<90:
    grade = "B"
case 70..<80:
    grade = "C"
case 60..<70:
    grade = "D"
default:
    grade = "F"
}


//삼항연산자 등급 출력
grade = avg >= 90 ? "수" :
        avg >= 80 ? "우" :
        avg >= 70 ? "미" :
        avg >= 60 ? "양" : "가"
print(grade)


//배열과 반복문
var score = [95,85,75,55]
var level = ["A","B","C","D","F"]

for i in 0..<score.count{
    if avg >= Double(score[i]){
        grade = level[i]
        print("점수는 " ,avg, "이고 등급은 ", grade ," 입니다.")
        break
    }
}

//반복문
let names = ["Anna","Alex","Brain","Jack"]

for i in 0..<name.count{
    print(names[i])
}

for name in names{
    print(name)
}

//dictionary 반복문
let numberOfLegs = ["Spider":8,"Ant":6,"Cat":4]

for (animalName, LegCount) in numberOfLegs{
    print("\(animalName) have \(LegCount)legs")
}

let seq1 = 1...5
for i in seq1 {
    print("\(i)* 5 = \(i*5)")
}

for i in seq1.reversed(){
    print("\(i)* 5 = \(i*5)")
}

let minutes = 60
let hourInterval = 5

for tickMark in stride(from: 0, to: minutes, by: hourInterval){
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: hourInterval){
    print(tickMark)
}

//while
var startIndex = 0
var endIndex = 100
var sum = 0

while startIndex <= endIndex{
    sum += startIndex
    startIndex += 1
}
print(sum)

//1부터 100까지의 짝수의 합(단,if문 사용금지)
while startIndex <= endIndex{
    sum += startIndex
    startIndex += 2
}
print(sum)

//입력한 한 자릿수 정수의 합을 구하는 프로그램을 작성하라
print("Enter an integer(0~9) :",terminator:"")
var read = readLine()!
var integers :Int = Int(read)!

//var integers = Int(readLine()!)
//if let i : Int = inpNum{
//repNum = inpNum!
//while repNum != 0{
//remainder = repNum % 10
//sumNo += remainder
//repNum /= 10
//}print("Sum of digits = \(sumNo)")
//else{
//print("Input value is wrong!")
//}
var div = 10
var sum1 = 0
//var mul = (integers % div)
while integers != 0{
    sum1 += (integers % div)
    integers = integers / div
}
print(sum1)




