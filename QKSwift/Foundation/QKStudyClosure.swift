//
//  QKStudyClosure.swift
//  QKSwift
//
//  Created by ChiCo on 16/10/21.
//  Copyright © 2016年 一米阳光. All rights reserved.
//
// Closure Expression syntax
// The parameters in closure expression syntax can be in-out parameters, but they can't have a default value. Variadic parameters can be used if you name the variadic parameter. Tuples can also be used as parameter types and return types.

import UIKit

class QKStudyClosure: NSObject {
    
    func syntaxClosure(){
        
        // The example below shows a closure expression version of the backward(_:_:) function from earlier:
        let names = ["Chirs","Alex","Ewa","Barry","Daniella"]
        
        func backward(_ s1: String, _ s2: String) -> Bool{
            return s1 > s2
        }
        
        
        //The sort(by:) method accepts a closure that takes two arguments of the same type as the array's contents, and returns a Bool value to say whether the first value should appear before or after the second value once the values are sorted. The sorting closure needs to return  true if the first value should appear before the second value, and false otherwise.
        var reversedNames = names.sorted(by:backward)
        print("reversedName : \(reversedNames)")
        //This example is sorting an array of String values, and so the sorting closure needs to be a function of type (String,String) -> Bool.
        //One way to provide the sorting closure is to write a normal function of the correct type, and to pass it in as an argument to the sorted(by:) method
        //If the first string (s1) is greater than the second sting (s2), the backward(_:_:) function will return true, indicating that s1 should appear before s2 in the sorted array. For characters in strings, "greater than" means "appears later in the alphabet than". This means that te letter "B" is "greater than" the letter "A", and the string "Tom" is greater than the sring "Tim", This gives a reverse alphabetical sort, with "Barry" being placed before "Alex", and so on.
        //Howerver, this is a rather long-winded way to write what is essentially a sigle-expression function (a > b). In this example, it would be preferable to write the sorting closure inline, using closure expession syntax.
        //The example below shows a closure expression verion of the backward(_:_:）function from earlier:
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print("reversedName : \(reversedNames)")
        
        //Note that the declaration of parameters and return type for this inline closure is identical to the declaration from the backward:(:_:_) function, In both cases, it is written as (s1: String, s2: String) -> Bool. However, for the inline closure experssion , teh parameters and return type are written inside the curly brances, not outside of them.
        //The start of the closure's body is introduced by the in keyword. This keyword indicates that the definition of the closure's parameters and return type has finished, and the body of the closure is about to beging.
        //Because the body of the closure is so short, it can even be written on a single line
        
    }
    
    func interring(){
        
        //Because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns. The sorted:(by:_ method is being called on an array of stings, so its argument must be a function of type (String, String) -> Bool. This means that the (String, String) and Bool types do not need to be written as part of the closure expression's definition. Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be ommited:
        let names = ["Chirs","Alex","Ewa","Barry","Daniella"]
        let reversedNames = names.sorted(by: {
            s1,s2 in return s1 > s2
        })
        print("reversdNames : \(reversedNames)")
        
        //It is always possible to infer the parameter types and return type when passing a closure to a function or method as an inline closure expression. As a result, you never need to write an inline closure its fullest form when the closure is used as a function or method argument.
        //Nonetheless, you can still make the types explicit if you wish, and doing so is encouraged if it avoids ambiguity for readers of your code. In the case of the sorted(by:) method, the purpose of the closure is clear from the fact that sorting is taking place, and it is safe for a reder to assume that the closure is likely to be working with String values, because it is assisting with the sorting of an array of strings.
        
    }
    
    func shorthandArgumentNames(){
        
        //Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure's agruments by the names $0, $1, $2, and so on.
        //If you use these shorthand argument names within your closure expression, you can omit the closure's argument list from its definition, and the number and type of the shothand argument names will be inferred from the expected functiontype. The in keyword can also be omitted,because the closure expression is made up entirely of its body:
        let names = ["Chirs","Alex","Ewa","Barry","Daniella"]
        var reversedNames = names.sorted(by: {$0 > $1})
        print("reversedNames : \(reversedNames)")
        
        //Here, $0 and $1 refer to the closure's first and second String arguments.
        
        //Operator Methods
        //There's actually an even shoter way to write the closure expression above. Swift's String type defines its string=specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool. This exactly matches the method type needed by the sorted(by:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation:
        reversedNames = names.sorted(by: >)
        print("reversedNames : \(reversedNames)")

    
    }
    
    func trailingClosures(){
        //If you need to pass a closure expression to a function as the function's final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A trailing closure is written after the function call's parentheses, even though it is still an argument to the function. When you use the trailing closure syntax, you don't write the argument label for the closure as part of the funcation call.
        
        let names = ["Chirs","Alex","Ewa","Barry","Daniella"]
        func someFunctionThatTakesAClosure(closure:() ->Void){
            
        }
        
        someFunctionThatTakesAClosure(closure:{
                
        })
        
        someFunctionThatTakesAClosure() {
                
        }
        var reversedNames = names.sorted(){ $0 > $1}
        print("reversedNames : \(reversedNames)")
        reversedNames = names.sorted {$0 > $1}
        print("reversedNames : \(reversedNames)")
        
        //Trailing closures are most useful when the closure is sufficiently long that it is not possible to write it inline on a single line. As an example, Swift's Array type has a map(_:) method which takes a closure expression as its single argument. The closure is called once for each item in the array, and returns an alternative mapped value (possible of some other type) for that item. The nature of the mapping and the type of the returned value is left up to the closure to specify.
        //After applying the provided closure to each array element, the map(_:) method returns a new array containing all of the new mapped values, in the same order as their corresponding values in the original array.
        //Here's how you can use the map(_:) method with a trailing closure to convert an array of Int values into an array of String values. The array [16,58,510] is used to create the new array ["OneSix","FiveEight","FiveOneZero"]:  String values. The array [16,58,510] is used to create the new array ["OneSix","FiveEight","FiveOneZero"]:
        
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        //The code above creates a dictionary of mappings between the integer digits and English-language versions of their names. It also defines an array of integers, ready to be converted into strings.
        //You can now use the numbers array to create an array of STrings values, by passing a closure expression to the array's map(_:_ method as a tailing closure:
        //The code above crates a dictionary of mappings between the integer digits and English-language versions of their names. It also defines an array of integers, ready to be converted into strings.
        //You can now use the numbers array to create an array of String values,by passing a closure expression to the array's map(_:_ method as a trailing closure:
        let strings = numbers.map{
            (number) -> String in
            var number = number
            var output = ""
            repeat{
                output = digitNames[number % 10]! + output
                number /= 10
                
            }while number > 0
            
            return output
        }
        
        print("strings \(strings)")
        //The map(_:) method calls the closure expression once for each item in the array. You do not need to specify the type of the closure's input parameter,number,because the type can be inferrred from the values in the array to be mapped.
        //In this example, the variable number is initialized with the value of the closure's number parameter, so that the value can be modified within the closure body.(The parameters to functions and closures are always constans.)The closure expression also specifies a returen type of String. to indicate the type that will be stored in the mapped output array.
        //The closure expression builds a string called output each time it is called. It calculates the last digit of number by using the remainder opreator (number%10),and uses this digit to look up an appropriate string in the digitNames dictionary. The closure can be used to create a string representationof an integer greater than zero.
        //Note The call to the digiNames dictionary's subscript is followed by an exclamation mark (!), because dictionary subscripts return an optional value to indicate that the dictionary lookup can fail if the key does not exist. In the example above, it is guaranteed that number % 10 will always be a valied subscript key for the sigitNames dictionary, and so an exclamation mark is used to force-unwrap the String value stored in the subscrip's optioanl return value.
        //The string retrieved from the digitNames dictionary is added to the front of output,effectively building a string version of the number in reverse.(The expression number % 10 gives a value of 6 for 16,8 for 58,and o for 510)
        //The process is repeated until number is equal to 0, at which point string is returned by the closure,and is added to the output array by the map(_:)method.
        //The use of trailing closure syntax in the example above neatly encapsulates the closure's functionality immediately after the function that closure supports,without needing to wrap the entire closure within the map:(_:) method's outer parentheses.
        
 
        
        
    }
    
    func capturingValues(){
        //A Closure can capture constants and variables from the surrounding context in which it is defined.The closure can then refer to and modify the values of those constants and variables from within its body,even if the original scope that defined the constants and variables no longer exists.
        //In Swift,the simplest form of a closure that can capture values is a nested function,written within the body of another funcion. A nested function can capture any of its outer function's arguments and can also capture any constants and variables defined within the outer function.
        //Here's an example of a function called makeIncrementer,which contains a nested function called incrementer.The nested incrementer() function captures two values,runningTotal and amount,from its surrounding context.After capturing these values,incrementer is returned by makeIncrementer as a closure that increments rungingTotal by amout each time it is called.
        func makeIncrementer(forIncrement amount: Int) ->() ->Int{
            var runningTotal = 0
            func incrementer() -> Int{
                runningTotal += amount
                return runningTotal
            }
            
            func test() ->(){
                
            }
            
            test();
            return incrementer
        }
        
        //The return type of makeIncrementer is () -> Int. This means that it returns a function, rather than a simple value. The function it returns has no parameters, and returns an Int value each time it is called. 
        //The makeIncrementer(forIncrement:) function defines an integer variable called runningTotal, to store the current running total of the incrementer that will be returned. This variable is initialized with a value of 0.
        //The makeIncrementer(forIncrement:) function has a single Int parameter with an argument lable of forIncrement, and a parameter name of amount. The argument value passed to this parameter specifies how much runningToTal defines a nested function called incrementer,which performs the actual incrementing. This function simply adds amount to runningTotal,and returns the result.
        //When considered in isolation,the nested incrementer() function might seem unsual
        //The incrementer() function doesn't have any parameters, adn yet it refers to runningTotal and amount from within its function body. It does this by capturing a reference to runningTotal and amount from the surrounding function and disappear when the call to makeIncermenter ends, and also ensures that runningTotal is available the next time the incrementer function is called.
        //NOTE As an optimization, Swift may instead capture and store a copy of a value if that value is not mutated by a closure,and if the value is not mutated after the closure is created.
        //Swift also handles all memory management involved in disposing of variables when they are no longer neeeded
        //Here's an example of makeIncrementer in action:
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print("incrementByTen \(incrementByTen)")
        
        //This example sets a constant called incrementByTen to refer to an incrementer function that adds 10 to its runningTotal variable each time it is called. Calling the function multiple times shows this behavior in action:
        print(incrementByTen())
        
        
    }
}
