//
//  main.swift
//  Day02
//
//  Created by 임현진 on 2021/07/15.
//

import Foundation

var  str1 : String

str1 = "Apple"
str1 = "Google"
//str1 = nil

print(str1)

var str2 : String?
str2 = "Apple"
str2 = "Google"
//str2 = nil
str2 = "123"

var int1 : Int = Int(str2!)!
print(int1 + 10)

//비교 연산자
print(1 == 1)

//Tuple
print((1,"zebra") < (2,"apple")) //숫자에서부터 비교를 하여 숫자가 크면 true
print((3,"apple") < (3,"bird")) //숫자가 같을 때 알파벳 순서로 비교

//삼항 조건 연산자
let contentHeight = 40
let  hasHeader = true

let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)

// 범위 연산자
// 닫힌 범위 연산자
for i in 1...10{
    print(i)
}

var sum : Int = 0
for i in 1...10{
    sum+=i
}

print("1~10의 합계는 \(sum)입니다.")

for i in 1...9{
    print("5X\(i) = \(i*5)")
}
for i in 1..<10{
    print("5X\(i) = \(i*5)")
}

let names = ["Anna","Alex","Brian","Jack"]
for i in 0..<names.count{
    print("person\(i+1) is called \(names[i])")
}

//Optional
//: 값이 있을수도 있고 없을 수도 있다
// : nil 값을 포함할 수도 있고 포함하지 않을 수도 있다

var constantNum :Int? = 100
constantNum = nil
var constantNum2 : Int! = 100
print(constantNum2!)
print(constantNum2 + 10)

//Optional Unwrapping

var myName: String? = nil
//print(myName as Any)
var yourName:String! = nil

//Optional Binding
if let name : String = myName{
  print(name)
}else{
   print("yourName is nil")
}

var myName2 : String? = "James"
var yourName2: String? = nil
if let name = myName2, let friend = yourName2{
    print("\(name) and \(friend)")
}

//Force Unwrapping

print(myName2!)
myName2 = nil //--> 이렇게 쓰려면 먼저 데이터가 있는 지 보고 써야 함
print(myName2 as Any)


//Collection : 여러 값들을 묶어서 하나의 변수로 사용

/*
 Array : 순서가 있는 리스트 컬렉션
 Dictionary : Key와 Value의 쌍으로 이루어진 컬렉션
 Set : 순서가 없고 멤버가 유일한 컬렉션, 집합연산
 */

//Array --> 순서가 있는 collection이다.
//빈 Array 생성
// var intVariable: Array<Int> = Array<Int>()
// var intVariable: [Int] = [Int]()
var intVariable: [Int] = []
intVariable.append(1)
intVariable.append(10)
intVariable.append(100)
intVariable.append(1000)

print(intVariable)
print(intVariable.contains(100)) //contains는 true 나 false 값을 가진다.
print(intVariable.contains(90))
print(intVariable[0])

print(intVariable[0...3][0])

intVariable.remove(at: 0)
intVariable.removeLast()
intVariable.removeAll()
print(intVariable)

intVariable = [] //removeAll과 같은 원리이다.

//기본값으로 배열 생성하기
var threeDouble = Array(repeating: 0.0, count: 3)
print(threeDouble)

var anotherDouble = Array(repeating: 2.5, count: 3)
var sixDouble = threeDouble + anotherDouble
print(sixDouble)

let intVariable2 = [1,2,3] //let으로 잡아둔 배열은 수정 못함
print(type(of: intVariable2))
//intVariable2.append(4)

var shoppingList = ["Eggs","Milk"]
print(shoppingList.count)
if shoppingList.isEmpty{

}else{
    shoppingList += ["Chocolate" , "Flour", "Butter"]
    shoppingList += ["Baking Powder"]
}
print(shoppingList)

//배열의 특정 위치 데이터 변경 및 제거
shoppingList[0...3] = ["Banana","almond","peanut","caramel","Apple"]
print(shoppingList)

shoppingList.insert("Grape", at: 0)
print(shoppingList)

//배열의 값과 인덱스가 필요한 경우
//for (index, value) in shoppingList.enumerated(){
//    print("Item \(index+1):\(value)")
//}
//print(shoppingList.enumerated())

//var tot = 0.0
//for i in sixDouble{
//    tot += i
//}
//print(tot)

//최댓값 찾기
//print(sixDouble.max()!)
//print(sixDouble.min()!)













