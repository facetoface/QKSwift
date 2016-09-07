//
//  QKBasics.swift
//  QKSwift
//
//  Created by 一米阳光 on 16/9/3.
//  Copyright © 2016年 一米阳光. All rights reserved.
//

import Foundation

typealias QKInt = UInt16

class QKBasics: NSObject {
    
    
    func test()
    {
        letOrVarTest()
        
        floatTest()
        
        strTest()
        
        integerTest()
        
        boolTest()
        
        tuples()
        
        optionals()
        
        flowControl()
    }
    
    func letOrVarTest() -> Void
    {
        let maxinumNumberOfLoginAttempts = 10
        var currentLoginAttempt = 0
        print("常量",maxinumNumberOfLoginAttempts,"变量",currentLoginAttempt)
        currentLoginAttempt = 100
        //maxinumNumberOfLoginAttempts = 5 error
    }
    
    func floatTest()
    {
        var fx = 0.1,fy = 0.2,fz = 0.3;
        print("fx =",fx,"fy = ",fy,"fz = ",fz)
        fx = 0.5
        fy = 0.6
        fz = 0.8
        print("fx = \(fx),fy = \(fy),fz= \(fz)")
    }
    
    func strTest()
    {
        var welcomMessage:String
        welcomMessage = "Hello"
        print(welcomMessage)
        
        var message = "Hello"
        print(message)
        message = "changed"
        print(message)
        
        let cstring = "const string"
        print(cstring)
        //cstring = "chang is error,you must chang the type to var"
        
        
    }
    
    func integerTest()
    {
        print("UInt8.min = \(UInt8.min)")
        print("UInt8.max = \(UInt8.max)")
        print("UInt16.min = \(UInt16.min)")
        print("UInt16.max = \(UInt16.max)")
        print("UInt32.min = \(UInt32.min)")
        print("UInt32.max = \(UInt32.max)")
        print("UInt64.min = \(UInt64.min)")
        print("UInt64.max = \(UInt64.max)")
        
        let twoThousand:UInt16 = 2_000
        let one:UInt8 = 1
        let twoThousandAndOne = twoThousand + UInt16(one)
        print(twoThousandAndOne)
        
        let three = 3
        let pointOneFourFiveNine = 0.14159
        let pi = Double(three) + pointOneFourFiveNine
        print("pi = \(pi)")
        
        var myInt:QKInt
        myInt = 100
        print(myInt)
        myInt = 20
        print(myInt)
        
        

        
    }
    
    func boolTest()
    {
        let yes = true
        let no = false
        print("yes = \(yes) no = \(no)")
        if yes {
            print("yes is true")
        }
        
        let one = 1
        if one == 1 {
            print("one = \(one)")
        }
   }
    
    func tuples()
    {
        let http404Error = (404,"not found")
        print("code = \(http404Error.0) guide = \(http404Error.1)")
        
        let http200Status = (statusCode:200,description:"OK")
        print("code = \(http200Status.statusCode) description = \(http200Status.description)")

        
    }
    
    func optionals()
    {
        //the nil in swift is not as same as in OC
        //the nil is a pointer to a nonexistent object
        //but it is a absence of value of a certain type in swift
        var money: Float? = 0
        money = Float("3218.5")
        print("money = \(money)")
        money = Float("ni hao");
        print("money = \(money)")
        
        var ocode: Int? = 404
        print("ocode \(ocode)")
        ocode = nil
        print("ocode \(ocode)")
        
        var code: Int = 404
        //code = nil code error
        code = 200
        print("code = \(code)")
        
        var str: String = "hello"
        print("str = \(str)")
        //str = nil this is error, default is not optional
        str = ""
        
        var strNil: String?
        print("strNil = \(strNil)")
        strNil = "opential nil"
        
        
    }
    
    func flowControl()
    {
        print("\n------ for in -----")
        for index in 1...5
        {
            print("index = \(index)");
        }
        
        let names = ["Anmi","Jan","Rose"]
        for _ in 1...5
        {
         print("an underscore in place of a variavle name for not need each value")
        }
        
        for name in names
        {
            print("wecome to china,\(name)")
        }
        
        let animal = ["spider":8,
                      "ant":6,
                      "cat":4]
        for (animalName,legCount) in animal
        {
            print("\(animalName)s have \(legCount) legs")
        }
        
        print("\n----- while lopps -----")
        let finalSquare = 25
       
        var board = [Int](count: finalSquare + 1,repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        while square < finalSquare
        {
            
            diceRoll += 1
            if diceRoll == 7
            {
                diceRoll = 1
            }
            print("diceRoll \(diceRoll)")
            square += diceRoll
            print("square \(square)")
            if square < board.count
            {
                square += board[square]
                print("square < baoard.count  \(square)")
            }
        }
        print("Game over!")
        
        square = 3
        //repeat
        repeat
        {
            print("squre = \(square)")
            square -= 1;
            
        }while square > 0
        
    }

}
