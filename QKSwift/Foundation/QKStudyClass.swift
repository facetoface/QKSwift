//
//  QKStudyClass.swift
//  QKSwift
//
//  Created by ChiCo on 16/11/1.
//  Copyright © 2016年 一米阳光. All rights reserved.
//
// Clas and Structures

import UIKit

//Class and structures are general-purpose, flexible constructs that become the building blocks of your program's code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.
//Unlike other programming languages, Swift does not require you to create separate interface and implementation files for custome classes and structures. In Swift, you define a class or a structure in a single file, and the exterrnal interface to that class or structure is automatically made available for other code to use.
//NOTE An instance of a class is traditionally known as an object. However, Swift classes and structures are much closer in functionality than in other languages,and much of this chapter describes functionality that can apply to instances of either a class or a structure type. Because of this, the more genearl term instance is used.

//Comparing Classes and Structures
//Class and structures in Swift have many things in common.Both can:
//Define properties to store values
//Define methods to provide functionality
//Define subscripts to provide access to their values using subscript syntax
//Define initializers to set up their initial state
//Be extended to expand their functionality beyond a default implementation
//Conform to protocols to provide standard functionality of a certain kind

//Class have additional capabilities that stuctures do not:
//Inheritance enables one class to inherit the characteristics of another.
//Type casting enables you to check and interpret the type of a class instance at runtime.
//Deinitializers enable an instance of a class to free up any resources it has assigned.
//Reference counting allows more than one reference to a class instance.
//Classes and structures have a similare definition syntax. You introduce classes with he class keywork and structures with the struct keyword. Both place place entire definition within a pair of brances
//NOTE Whenever you define a new class or structure ,you effectively define a brand new Swift type. Give types UpperCameCase names(such as SomeClass and SomeStructure here) to match the capitalization of standard Swift types (suche as String, Int, and Bool). Conversely, always give properties and methods loverCameCase names (such as frameRate and incrementCount_ to differentiate them from type names.
//Here's example of structure definition and a class definition:
struct Resolution {
    var  width = 0
    var  height = 0
}

class VideoModel {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//The example above defines a new structure called Resolution, to describe a pixel-based display resolution. This structure has two stored properties called width and height. Stored properties are constants or variables that are bundled up and stored as part of the class or structure. Thes two properties are inferred to be of type Int by setting them to an initial integer value of 0.
//The example above also defines a new class called VideoMode, to describe a specific video mode for video display. This class has four variable stored properties. The first, resolution, is initialized with a new Resolution stucture instance, which infers a property type of Resolution, For the other three properties, new VideoMode instances will be initialized with an interlaced setting of false(meaning "noninterlaced video"), a playback frame rate of 0.0, and an optional String value called name. The name property is automatically given a default value of nil, or "no name value", because it is of an optional type.
//Class and Structure Instances
//The Resolution structure definition and the VideoMode class definition only describe what a Resolution or VideoMode will look like. They themselves do not describe a specific resolution or video mode. To do that, you need to create an instance of the structure or class.
//The synatax for creating instances is very similar for both stuctures and classes

class QKStudyClass: NSObject {

    //Structures and classes both use initializer syntax for new instances. The simplest from of initializer syntax uses the type name of the class or structure followed by empty parentheses, such as Resolution() or VideoMode(). This creates a new instance of the class or structure, with any properties initialized to their default values.
    let someResolution = Resolution()
    let someVideoMode = VideoModel();
    
    //Accessing Properties
    //You can access the properties of an instance using dot syntax. in dot syntax., you write the property name immediately after the instance name, separated by a period (.), without any spaces:
    
    func test(){
    
        //In this example, someResolution.width refers to the width property of someResolution, and returns its default initial value of 0.
        print("The width of someResolution is \(someResolution.width)")
        //You can drill down into sub-properties, such as the width property in teh resolution property of a VideoMode:
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        //You can also use dot syntax to assign a new value to a variable property:
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        
        //NOTE
        //Unlike Objective-C, Swift enables you to set sub-properties of a structure property directly. In the last example aboves, the width property of the resolution property of someVideoMode is set directly, without your needing to set the entire resolution property to a new value.
        //Memberwise Initializers for Structure Types
        //All structures have an automatically-generated memberwise initializer,which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the mebberwise initializer by name:
        
        let vga = Resolution(width:640, height:480)
        print("vga \(vga)")
        //Unlike structures, class instances do not receive a default memberwise initializer. Initializers are described in more detail in initialization.
        //Stuctures and Enumerations Are Value Types
        //A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.
        //You've actually been using value types extensively throughout the previous chapters. In fact, all of the basic types in Swift-integers, floating-point numbers, Booleans, strings, arrays and dictionaries - are value types, and are implemented as structures behind the scenes.
        //All structures and enumerations are value types in Swift. This means that any structure an denumeration instances you create - and any value types they have as properties - are always copied when they are passed around in your code.
        //Consider this example, which uses the Resolution structure from the previous example:
        let hd = Resolution(width: 1920, height: 1090)
        var cinema = hd
        print("cinema \(cinema) hd \(hd)")
       //This example declares a constant called hd and sets it to a Resolution instance initialized with the width and height of full HD video(192- pixels wide by 1080 pixels high).
        //It then declares a variable called cinema and sets it to the current value of hd. Because Resolution is a structure, a copy of the existing instance is made, and this new copy is assigned to cinema. Even though hd and cinema now have the same width and height, they are two completely different instances behind the scenes.
        cinema.width = 1230
        print("cinema \(cinema) hd \(hd)")
        //Next, the width property of cinema is amended to be the width of the slightly-wider 1230 
        //However, the width property of the original hd instance still has the old value of 1920
        //When cinema was given the current value of hd, the values stored in hd wer copied into the new cinema instance. The end result is two completely separate instances, which just happened to contain the same numeric values. Because they are separate instances, setting the width of cinema to 1230 doesn't affect the width stored in hd.
        //The same behavior applies to enumerations:
        enum CompassPoint{
            case north, south, east, west
        }
        
        var currentDirection = CompassPoint.west
        let remeberedDirection = currentDirection
        currentDirection = .east
        if remeberedDirection == .west {
            print("The remebered direction is still .west")
        }
        
        //When remeberedDirection is assigned the value of currentDirection, it is actually set to a copy of that value. Changing the value of currentDirection thereafter does not affect the copy of the original value that was stored in remeberedDirection.
        //Classes Are Reference Types
        //Unlike value types, reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead.
        //Here;s an example, using the VideoMode class define above:
        let tenEighty = VideoModel()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        //This example declares a new constant called tenEighty and sets it to refer to a new instance of the VideoMode class. The video mode is assigned a copy of the HD resolution of 1920 by 1080 from before. It is set to be interlaced, and is given a name of "1080i", Finally, it is set to a frame rate of 25.0 frames per second.
        //Next, tenEighty is assigned to a new constant, called alsoTenEighty, and the frem rate of alsoTenEighty is modified:
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        //Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance. Effectively, they are just two different names for the same single instance.
        //Checking the frameRate property of tenEighty shows that it correctly reports the new frame rate of 30.0 from the underlying VideoMode instance:
        print("The frameRat property of tenEighty is now \(tenEighty.frameRate)")
        //Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. However, you can still change tenEighty. frameRate and alsoTenEighty.framRate because the values of the tenEighty and alsoTenEighty constants themselves do not actually change. tenEighty and alsoTenEighty themeslves do not "store" the VideoMode instance - instead, they both refer to a VideoMode instance behind the scenes. It is the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.
        
        
        //Identity Operators
        //Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same is not true for structures and enumerations, because they are always copied when they are assigned to a constant or variable, or passed to a function.)
        //It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:
        //Identical to (===)
        //Not identical to (!==)
        //Use these operators to check whether two constants or variables refer to the same single instance:
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer the same VideoMode instance.")
        }
        //Note that "identical to"(represented by three equals signs, or ===) does not mean the same thing as "eauql to" (represented by two equals signs, or ==):
        //"Identical to" means that two constants or variables of class type refer to exactly the same class instance.
        //"Equal to" means that two instances are considered "equal" or "equivalent" in value, for some appropriate meanning of "equal", as defined by the type's designer.
        //When you define your own custome classes and stuctures, it is your responsibility to decide what qualifies as two  instances being "equal". The process of defining your own implementations of the "equal to" and "not equal to" opreators is described in Equivalence Operators.
        
        //Pointers
        //If you have experience with C, C++, or Objective-C, you may know that these languages use pointers to refer to addresses in memory. A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, but is not a direct pointer to an address in memory, and does not require you to write an asterisk(*) to indicate that you are creating a reference. Instead, these references are defined like any other constant or variable in Seift.
        //Choosing Between Classes and Structures
        //You can use both classes and structures to define custom data types to use as the building blocks of your program's code.
        //Howerver, structure instances are always passed by values, and class instances are always passed by reference. This means that they are suited to different kinds of tasks. As you consider the data constructs and functionality that you need for a project,decide whether each data construct should be defined as a class or as a structure.
        //As a general guideline, consider creating a structure when one or more of these conditions apply:
        //The structure's primary purpose is to encapsulate a few relatively simple data values.
        //It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.
        //Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.
        //The structure does not need to inherit properties or behavior from another existing type.
        //Examples of good candidates for structures include:
        //The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
        //A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
        //A point in a 3D corrdinate system, perhaps encapsulating x, y and z properties, each of type Double.
        //In all other cases, define a class, and create instances of theat class to be managed and passed by reference. In practice, this means that most custom data constructs should be classes, not structures.
        //Assignment and Copy Behavior for Strings, Arrays, and Dictionaries
        //In Swift, may basic data types such as String, Array, and Dictionary are implemented as structures. This means that data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.
        //This behavior is different from Foundation:NSString,NSArray,and NSDictionary are implemented as classes, not structures, Strings, arrays, and dictionaries in Foundation ary alays assigned and passed around as a reference to an existing instance, rather than as a copy.
        //NOTE The description above refers to the "copying: of strings , and dictionaries. The behavior you see in your code will always be as if a copy took place. However, Swift only performs an actual copy behind the scenes when it is absolutely necessary to do so. Swift manges all value copying to ensure optimal perfomance, and you should not avoid assignment to try to preempt this optimization.
        
        
    }
    
}







