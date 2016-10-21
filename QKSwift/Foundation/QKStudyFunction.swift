//
//  QKStudyFunction.swift
//  QKSwift
//
//  Created by ChiCo on 16/10/20.
//  Copyright © 2016年 一米阳光. All rights reserved.
//
// Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to "call" the function to perform its task when needed
// Swift's unifiend function syntax is flexible enough to express anything from a simple C-style function with no parameter names to a complex Objective-C-style method with names and argument labels for each parameter. Parameters can provide default values to simplify function calls and can be passed as in-out parameters, which modify a passed variable once the function has completed it execution
//Evevy function in Swift has a type, consisting of the function's parameter types and return type, You can use this type like an other type in Swift, shich makes it easy to pass functions as parameters to other functions, and to return functions from functinos. Functions can also be written within other functins to encapsulate useful functinality within a nested functin scope.
//When you define a function, you can optionally define one or more named, typed values that the fuction takes as input, known as parameters. You can also optionally define a type of value that the function will pass back as output when it is done, known as its return type.
//Every functions has a function name, which describes the task that the function performs. To use a function, you "call" that function with its name and pass it input values(known as arguments) that match the types of the function's parameters. A function's arguments must always be providd in the same order as the function's paramter list.
import UIKit

/**
 * 学习Functions
 */
class QKStudyFunction: NSObject {

    func test()
    {
        print(greet(person: "Xiao ming"))
        print(greetAgain(person: "Anna"))
        print(sayHelloWorld())
        print(greet(person: "Tim", alreadyGreeted: true))
        
        //The minMax(array:) function startes by setting two working variables called currentMin and currentMax to the value of the first integer in the array. The function then iterates over the remaining values in the array and checks each value to see if it is smaller or larger than the values of currentMin and currentMax respecitively. Finally, the overall minimum and maximum values are returned as a tuple of two Int values.
        //Because the tuple's member values are named as part of the function's return type, they can be accessed with dot syntax to retrieve the minimum and maximum found values
        let minAndMax =  minMax(array: [3,5,9,15,9,3,10])
        print("min = \(minAndMax.min) max = \(minAndMax.max))")
        
        if let safeMinAndMax = safeMinMax(array: []) {
            print("min = \(safeMinAndMax.min) max = \(safeMinAndMax.max))")
        }
        
        
        someFounction(argumentLabel: 3)
        print(greetWithArgumentLabel(person: "Bill", from: "Cupertino"))
        
        //If a parameter has an argument label, the argument must be labeled when you call the function.
        omitFunction(1, secondParameterName: 2)
        
        //Place parameters that have don't default values at the beginning of a function's parameter list, before the parameters that have default values. Parameters that don't have default values are usually more important to the function's meaning - writing them first makes it easier to recognize that the same function is beging called, regardless of whether any default parameters are omitted.
        paramDefult(parameterWithoutDefault: 3)
        paramDefult(parameterWithoutDefault: 3,parameterWithDefault: 6)
    
       
        print(arithmeticMean(1,2,3,4,5,6,7,8))
        
        //The example shows that the original values of someInt and anotherInt are modified by swapTwoInts(_:_:) function,even though they were originally defined outside of the function
        var someInt = 3
        var anotherInt = 108
        print("before swip,someInt = \(someInt), anotherInt = \(anotherInt)")
        swapTwoInts(&someInt, &anotherInt)
        print("after swip,someInt = \(someInt), anotherInt = \(anotherInt)")
        
        //You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
        var matchFunction: (Int, Int) -> Int = addTwoInts
        //This can be read as:
        //Define a variable called matchFunction, which has a type of 'a function that takes two Int values, and returns an Int value.' Set this new variable to refer to the function called addTwoInts."
        //The addTwoInts(_:_:) function has the same type as the mathFunction variable, and so this assignment is allowed by Swift's type-checker.
        //You can now call the assigned function with the name mathfunction:
        print("Result: \(matchFunction(2,3))")
        matchFunction = multiplyTwoInts
        print("Result: \(matchFunction(2,3))")
    
        let anotherMathFunction = addTwoInts
        print("Result: \(anotherMathFunction(2,3))")
        
        //This example defines a function called printMathResult(_:_:_:), which has three parameters. The first parameter is called mathFunction, and is of type (Int,Int)->Int. You can pass any function of that type as the argument for this parameter. The second and third parameters are called a and b, and are both of type Int. These are used as the two input values for the provided math function. 
        //When printMathResult(_:_:_:) is called, it is passed the addTwoInts(_:_:) function, and the integer values 3 and 5. it calls the provided function with the values 3 and 5, and prints the result of 8.
        printMathResult(addTwoInts, 4, 5)
        
        
        //You can now use chooseStepFunction(backward:) to obtain a function that will step in one direction or the other:
        var currentValue = 3
        let moveNearToZero = chooseStepFunction(backward: currentValue > 0)
        print("Counting to zero:")
        while currentValue != 0 {
            print("\(currentValue)...")
            currentValue = moveNearToZero(currentValue);
        }
        print("zero !")
    }
    
    //The functin in the example below is called greet(person:),because that's what it does - it takes a person's name as input and returns a greeting for that person. To accomplish this, you define one input parameter - a String value called person - and a return type of String, which will contain a greeting for that person:
    func greet(person: String) -> String {
        
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    
    //All of this information is rolled up into the function's definition, which is prefixed with the func keyword. You indicate the function;s return type with the return arrow -> (a hyphen followed by a right angle bracket), which is followed by the name of the type to return.
    //The definition describes what the functinon does, what it expects to receive, and what it returns when it is done. The definition makes it easy for the function to be called unambiguously from elsewhere in your code:
    
    //To make the body of this functin shorter, you can combine the message creation and the return statement into one line:
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    
    //Function parameters and return values are extremely flexible in Swift. You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.
    //Functions are not required to define  input parameters. Here's a function with no input parameters, which always returns the same String message whenever it is called:
    func sayHelloWorld() -> String {
        return "hello , world"
    }
    //The function definition still needs parentheses after the function's name, even though it does not take any parameters. The function name is also followed by an empty pair of parentheses when the function is called.
    //Functions can have multiple input parameters, which are written within the function's parentheses, separated by commas.
    //This function takes a person's name and whether they have already been greeted as input, and returns an appropriate greeting for that person:
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        }else{
            return greet(person: person)
        }
    }
    
    //You can use a tuple type as the type for a function to return multiple values as part of one compound return value. 
    //The example below defines a function called minMax(array:),which finds the smallest and largest numbers in an array of Int values:
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            }else if value > currentMax{
                currentMax = value
            }
        }
        return (currentMin,currentMax)
    }
    
    //If the tuple type to be returned from a function has the potential to have "no value" for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type's closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.
    //The minMax(array:) function above returns a tuple containing two Int values. However, the function does not perform any safety checks on the array it is passed. If the array argument contains an empty array, the minMax(array:) function, as defined above, will trigger a runtime error when attempting to access array[0].
    //To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of ni when the array is empty:
    func safeMinMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty {
            return nil
        }
        
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            }else if(value > currentMax){
                currentMax = value
            }
        }
        
        return (currentMin,currentMax)
    }
    
    //Each function parmmeter has both an argument lable and a parameter name. The argument lable is used when calling the functing; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.
    //All parameters must have unique names. Although it's possible for multiple parameters to have the same argument lable, unique argument labels help make your code more readable.
    //You write an argument lable before the parameter name, separated by a space
    func someFounction(argumentLabel parameterName: Int)  {
        
        print("someFounction \(parameterName)")
    }
    
    
    //The use of argument labels can allow a function to be called in an expressive, setence-like manner, while still providing a function body that is readable and clear in intent.
    func greetWithArgumentLabel(person: String, from hometown: String) -> String{
        return "Hello \(person)! Glad you could visit from \(hometown)."
    }
    
    //Omitting Argument Labels : If you don't want an argument label for a parameter, write an underscore(_) instead of an explicit argument label for that paramter.
    func omitFunction(_ firstParameterName: Int, secondParameterName: Int)  {
        print("first parameter is \(firstParameterName), second parameter is \(secondParameterName)")
    }
    
    //Default Parameter Values: You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter's type. If a default value is defined, you can omit that parameter when calling the function.
    func paramDefult(parameterWithoutDefault: Int, parameterWithDefault: Int = 12)
    {
        print("parameter without default = \(parameterWithoutDefault), parameter with default = \(parameterWithDefault)")
    }
    
    //Variadic parameters : A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed varying number of input values when the function is called.Write variadic parameters by inserting three period characters(...) after the parameter's type name.
    //The values passed to a variadic parameter are made available within the function's body as an array of the appropriate type. For example, a variadic parameter with a name of numbers and a type of Double... is made available within the function's body as a constant array called numbers of type [Double].
    //The example below caculates the arithmetic mean(also known as the average) for a list of numbers of any length:
    func arithmeticMean(_ numbers: Double...) -> Double {
        
        var total: Double = 0
        for number in numbers{
            total += number
        }
        return total/Double(numbers.count)
    }
    
    //In-Out Parameters
    //Function parameters are constants by defult. Trying to change the value of a function parameterfrom within the body of that function results in a compile-time error, This means that you can't change the value of a parameter by mistake. If you want a function to modify a parameter's value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.
    //You write an in-out parameter by placing the inout keyword right before a parameter's type. An in-out parameter has a value that is passed in to the function, is modified by the function, and is passed back out of the function to replace the original value. 
    
    func swapTwoInts(_ a: inout Int, _ b: inout Int)  {
        
        let temp = a
        a = b
        b = temp
    }
    
    
    //Function Types
    //Every function has a specific function type, made up of the parameter types and the return type of the function. For example:
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    
    //Function Types as Parameter Types
    //You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function's implementation for the function's caller to provide when the function is called
    //Here's an example to print the results of the math functions from avove:
    func printMathResult (_ mathFunction:(Int,Int) -> Int, _ a: Int, _ b: Int){
        print("Result:\(mathFunction(a,b))")
    }
    
    //You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returing function.
    //The next example defines two simple functions called stepForward(_:) and stepBackward(_:). The stepForward(_:) and stepBackward(_:). The stepForward(_:) function returns a value one more than its input value, and the stepBackward(_:) function returns a value one less than its input value. Both functions have a type of (Int) -> Int:
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
    
    
    //Nested Functions 
    //All of the functions you have encountered so far in this chapter have been examples of global functions, which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions. 
    //Nested functions are hidden from the outside wold by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope. 
    //You can rewrite the chooseStepFunction(backward:) example above to use and return nested functions:
    func stepOther(backward: Bool) -> (Int) ->Int {
        func stepForward(input: Int) -> Int {return input + 1}
        func stepBackWard(input: Int) -> Int {return input - 1}
        return backward ? stepBackWard : stepForward
    }
}
