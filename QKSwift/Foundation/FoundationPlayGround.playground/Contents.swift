//: Playground - noun: a place where people can play

import UIKit


//(_ : Int, _: Int) ->Int 代表一个函数，我们把它叫做 A吧
//A 是函数 myFunction 的返回值
//A 是有两个参数的返回值为Int的函数
//myFunction 有一个Int参数 amount
func myFunction(forIncrement amount: Int) ->(_ : Int, _: Int) ->Int{
    
    print(amount)
    func ahah(number1: Int, number2: Int) -> Int{
        
        return number1 + amount + number2;
        
    }
    return ahah;
    
}

//接收一个函数
let myTest = myFunction(forIncrement: 10)
//调用这个函数
print(myTest(3,4))
print(myTest(6,6))
print("myFunctio: \(myFunction(forIncrement: 1))")


func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackWard(_ input: Int) -> Int {
    return input - 1
}
//Here's a function called chooseStepFunction(backward:),whose return type is (Int) -> Int. The chooseStepFunction(backward:)function returns teh stepForward(_:) function or the stepBackward(_:) function based on a Boolean parameter called backward:
func chooseStepFunction(backward: Bool) -> (Int)->Int {
    return backward ? stepForward: stepBackWard
}

let add = chooseStepFunction(backward: true)
add(1)
add(2)

func printMathResult (_ mathFunction:(Int,Int) -> Int, _ a: Int, _ b: Int){
    print("Result:\(mathFunction(a,b))")
}

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

printMathResult(addTwoInts, 3, 4)
printMathResult(multiplyTwoInts, 3, 4)

