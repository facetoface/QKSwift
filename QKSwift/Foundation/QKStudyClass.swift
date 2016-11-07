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
    //YOu can access the properties of an instance using dot syntax. in dot syntax., you write the property name immediately after the instance name, separated by a period (.), without any spaces:
    
    func test(){
    
        print("The width of someResolution is \(someResolution.width)")
    
    }
}

