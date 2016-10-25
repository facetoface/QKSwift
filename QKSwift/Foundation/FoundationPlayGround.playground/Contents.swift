//: Playground - noun: a place where people can play

import UIKit


    //->(_ n1: Int) 代表一个函数，我们把它叫做 A吧
    //在 A 后面->Int是他的返回值
    //myFunction(forIncrement amount: Int) 这是一个叫myFunction的函数
    //拥有一个Int参数amount 其中forIncrement可以提高阅读性，我把它称作参数标签
    //那么A和她后面的->Int 是这个函数的返回值
    func myFunction(forIncrement amount: Int) ->(_ n1: Int) ->Int{
        
        print(amount)
        func ahah(number1 number: Int) -> Int{
            
            return number + amount
            
        }
        return ahah;
        
    }
    let myTest = myFunction(forIncrement: 10)
    print(myTest(3))
    print(myTest(4))
    print(myFunction(forIncrement: 1))
