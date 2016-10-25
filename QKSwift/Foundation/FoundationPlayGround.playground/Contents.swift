//: Playground - noun: a place where people can play

import UIKit


    //返回函数 n1 是返回的函数的参数 后面的Int 是这个函数的返回值
    func myFunction(forIncrement amount: Int) ->(_ n1: Int) ->Int{
        
        func ahah(number1 number: Int) -> Int{
            
            return number + 2
            
        }
        return ahah;
        
    }
    let myTest = myFunction(forIncrement: 10)
    print(myTest(3))
    print(myTest(4))
    
    print(myFunction(forIncrement: 1))
