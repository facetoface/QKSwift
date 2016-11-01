//
//  QKBasics.swift
//  QKSwift
//
//  Created by 一米阳光 on 16/9/3.
//  Copyright © 2016年 一米阳光. All rights reserved.
//

import Foundation

typealias QKInt = UInt16

class QKBasics: QKBaseViewController {
    
    
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
        
        valueBingings()
        
        controlTransferStatments()
        
        labeledStatements()
        
        earlyExit()
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
        
        var board = [Int](repeating: 0,count: finalSquare + 1)
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
        
        var  temperatureInFahrenheit = 30;
        temperatureInFahrenheit = square;
        if temperatureInFahrenheit <= 32 {
            
            print("It's very cold. Consider wearing a scarf.");
            
        }else
        {
            print("It's not that cold. Wear a t-shirt.");
        }
        
        switch temperatureInFahrenheit
        {
        case 0..<15:
            print("It's very cold. Consider wearing a scarf.");

        case 16..<100:
                print("It's very hot");
            
        default:
            print("It's not that cold. Wear a t-shirt.");

        }
        
        let someCharacter: Character = "z"
        switch someCharacter {
        case "a":
            print("The first letter of the alphabet");
        case "z":
            print("The last letter of the alphabet");
        default:
            print("Some other charcter");
        }
        
        var somePoint = (1,1)
        if temperatureInFahrenheit > 40 {
            somePoint = (0,2)
        }
        
        switch somePoint {
        case (0,0):
            print("(0,0) is at the origin")
        case(_,0):
            print("(\(somePoint.0),0) is on the x-axis")
        case(0,_):
            print("(0,\(somePoint.1) is on the y-axis")
        case(-2...2,-2...2):
            print("(\(somePoint.0),\(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
        }
        
    }
    
    func valueBingings()
    {
        // A switch case can bind the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as value binding, because the values are bound to tempoprary constants or variables within the case's body. 
        //The example below takes an (x,y) ponit,expressed as a tuple of type (Int,Int),and categorizes it on the graph that flowws:
        
        var  anotherPoint = (0,4)
        for index in  1...5
        {
            if index == 2
            {
                anotherPoint = (4,0);
                
            }else
            {
                anotherPoint = (0,index)
            }
            
            switch anotherPoint
            {
            case (let x,0):
                print("one the x-axis with an x value of \(x)")
            case (0,let y):
                print("on the y-axis with y value of \(y)")
            case(let x,let y):
                print("somewhere else at (\(x),\(y))")
            }
        }
       
       
    }
    
    func controlTransferStatments()
    {
        //Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements: continue break fallthrough return throw
        //the continue,break,and fallthrough statements are described below. The return statement is described in Functions,and the throw statement is described in Progagating errows using throwwing functions.and
        //the continue statement tells a loop to stop what it is doning and start again at the beginning of  the  next iteration throught the loop. It says "I am  done with the current loop iteration" without leaving the loop altogether. 
        //the following exaple removes all vowels and spaces from a lowercase string to create a cryptic puzzle phrase:
        
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        let charactersToRemove: [Character] = ["a","e","i","o","u"," "]
        for character  in puzzleInput.characters
        {
            if charactersToRemove.contains(character)
            {
                continue;
                
            }else
            {
                puzzleOutput.append(character)
            }
        }
        print("puzzleOutput \(puzzleOutput)")
        //The code above calls the continue keyword whennerver it matches a vowel or a space, causing the current iteration of the loop to end immediately and to jump staight to the start of the next iteration.
        
        //The breeak statement ends execcution of an entire control flow statement immediately. The break stament can be used inside a switch statement or loop statement when you want to terminate the execution of the switch or loop statement earlier than would otherwise be case.
        
        //The following example switches on a Character value and datermines whether it represents a number symbol in one of four languages. For brevity, multiple values are covered in a single switch case.
        
        //This example checks numberSymbol to determine whether it is a Latin,Chinese,If a match is found, one of the switch statement's cases sets an optional Int? variable called possibleIntegerValue to an appropriate integer value.
        //After the switch statement completes its execution, the example uses optional binding to determine whether a value was found. The possibleIntegerValue variable has an implicit initial value of nil by virtue of being an optional type, and so the optional binding will succeed only if possibleIntegerValue was set to an actual value by one of the switch statement's first four case.
        //Because it'st not practical to list ervey possible Character value in the example above, a default case handles any characters that are not matched. This default case does not need to perform any action, and so it is written with a single break statement as its body. As soon as the default case it matched, the break statement ends the switch statement's execution, and code execution continues from the if let statement.
        let numberSymbol: Character = "四"
        var possibleIntegerValue: Int?
        switch numberSymbol{
        case "1","一":
            possibleIntegerValue = 1
            
        case "2","二":
            possibleIntegerValue = 2;
            
        case "3","三":
            possibleIntegerValue = 3;
            
        case "4","四":
            possibleIntegerValue = 4;
            
        default:
            break;
        }
        
        if (possibleIntegerValue != nil) {
            
            print("The integer value of\(numberSymbol) is \(possibleIntegerValue).")
            
        }else
        {
            print("An integer value could not be found for \(numberSymbol)")
            
        }
        
        //Switch statements in Swift don't fall through the bottom of each case and into the next one. Instead, the entire switch statement completes its execution as soon as the first matching case is completed. By constrast, C requires you to insert an explicit break statement at the end of every switch case to prevent fallthrough. Avoiding default fallthrough means that Swift switch statements are much more concise and predicatable than their counterpats in C, and thus the avoid executing multiple switch cases by mistake.
        //If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with the fallthrough keyword. The example below uses fallthrough to create a textual description of a number.
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is "
        switch integerToDescribe {
        case 2,3,5,7,11,13,17,19:
            description += "a prime number, and also "
            fallthrough
        case 8:
            description += "just test "
            fallthrough
        default:
            description += "an integer."
        }
        print("description : \(description)")
        // fallthrough 一关通过 通到底
    
        
    }
    
    func labeledStatements()
    {
        //A labeled statement is indicated by placing a label on the same line as the statement's introducer keyword, followed by a colon. Here's an example of this syntax for a while loop, although the principle is the same ofr all loops and switch statements
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08;
        board[06] = +11
        board[09] = +09;
        board[10] = +02;
        board[14] = -10;
        board[19] = -11;
        board[22] = -02;
        board[24] = -08;
        
        var square = 0
        var diceRoll = 0
        print("Game Start")
        gameLoop: while square != finalSquare{
            diceRoll += 1
            if diceRoll == 7 {
                diceRoll = 1
            }
            switch square + diceRoll {
            case finalSquare:
                print("dicRoll will move us to the final square, so the game  is over")
                break gameLoop
                
            case let newSquare where newSquare > finalSquare:
                print("diceRoll will move us beyond the final square, so roll again")
                continue gameLoop
            default:
                print("this is a valid move, so find out its effect")
                square += diceRoll
                square += board[square]
            }
            
        }
        print("Game over!")
        
        //The dice is rolled at the start of each loop, Rather than moving the player immediately, the loop uses a switch statement to consider the result of the move and to determine whether the move is allowed
        //If the dice roll will move the player onto the final square, the game is over. The break gameLoop statement transfers control to the first line of code outside of the while loop,which ends the game.
        //If the dice roll will move the player beyond the final square, the move is invalid and the player needs to roll again.The continue gameLoop statement ends the current while loop iteration and begins the next iteration of the loop.
        //In all other cases, the dice roll is a valid move. The player moves forward by DiceRoll squares, and the game logic checks for any snakes and ladders. The loop then ends, and control returns to the while condition to decide whether another turn is required 
        //NOTE If the break statement above did not use the gameLoop label, it would break out of the switch statement,Using the gameLoop label makes it clear which control statement should be terminated.
        //It is not strictly necessary  to use the gameLoop label when calling continue gameLoop to jump to the next iteration of the loop. There is only one loop in the game, and therefore no ambiguity as to which loop the continue statement will affect. However, there is no harm in using the gameLoop label with the continue statement. Doing so is consistent with the label's use alongside the break statement and helps make the game's logic clearer to read and understand.
        
    }
    
    func earlyExit()
    {
        //A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require taht a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statemtnt always has an else clause - the code inside the else caluse is executed if the condition is not true 
        func greet(person:[String:String])
        {
            guard let name = person["name"] else
            {
                return;
            }
            
            print("Hello \(name)!")
            
            guard let location = person["location"] else{
                print("I hope the weather is nice near you.")
                return
            }
            
            print("I hope the whether is nice in \(location).")
            
            
        }
        greet(person: ["":""])
        greet(person: ["name":"John"])
        greet(person: ["name":"Jane","location":"Cuperino"])
        //IF the guared statement's condition is met, code execution continues after the guard statement's closing brace. Any variables or constants that were assigned values using an optional bingding as part of the condition are available for the rest of the code block that the guard statement appears in.
        //If that condition is not met, the code inside the else branch is executed. That branch must transfer control to exit the code block in which the guard statement appears. It can do this with a control transfer statement such as return,break,continue,or throw, or it can call a function or method that doesn't return, such as fatelError(_:file:line:).
        //Using a guard statement for requirements improves the readablility of your code, compared to doing the same check with an if statement. It lets you keep the code that handles a violated requirement next to the requirement.
        
        //Swift has built-in support for checking API availability, which ensures that you don't accidentally use APIs that are unavailable on a given deployment target.
        //The complier uses availablity information in the SDK to verify that all of the APIs used in your in your code are available on the deployment target specified by your project. Swift reports an error at compile time if you try to use an API that isn't available.
        //You use an availability condition in an if or guard statement to conditionallly execute a block of code, depending o whether the APIs you want to use are available at runtime. The compiler uses the information from the availability condition when it verifies that the APIs in that block of code are available.
        
        if #available(iOS 10, macOS 10.12, *)
        {
            print("Use IOS 10 APIs on IOS, and use macOS 10.12 APIs on macOS")
            
        }else
        {
            print("Fall back to earlier IOS and macOS APIs")
        }
        
    }
    
}
