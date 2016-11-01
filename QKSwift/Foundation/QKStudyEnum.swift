//
//  QKStudyEnum.swift
//  QKSwift
//
//  Created by ChiCo on 16/10/28.
//  Copyright © 2016年 一米阳光. All rights reserved.
//

import UIKit

class QKStudyEnum: NSObject {
    
    //An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.
    //If you are familiar With C, you will know that C enumerations assign related names to a set of integer values. Enumerations in Swift are much more flexible, and  do not have to provide a value for each case of the enumeration. If a value (know as a "raw" value) is provided for each enumeration case, the value can be a string, a character, or a value of any integer or floating-point type.
    //Alternatively, enumeration cases can specify associated values of any type to be stored along with each different case value, much as unions or variants do in other languages. You can define a common set of related cases as part of one enumeration, each of which has a different set of values of appropriate types associated with it.
    //Enumerations in Swift are first-class types in their own right. The adopt many features traditionally supported only by classes, such as computed properties to provide additional information about the enumeration's current value, and instance methods to provide functionality related to the values the enumeration represents, Enumerations can also define initializers to  provide an initial case value,; can be extended to expand their functionality beyond their original implementation; and can conform to protocols to provide standard functioanlity.
    //Enumeration Syntax
    //You introduce enumerations with the enum keyword and place their entire definition within a pair of brances:
    enum SomeEnumeration {
       
        
    }
    
    enum CompassPoint {
        case  north
        case  south
        case  east
        case  west
    }
    
    //The values defined in an enumeration (such as north,south,east,and west) are its enumeration cases. You use the case keyword to introduce new enumeration cases.
    //NOTE Unlike C and Object-c, Swift enumeration cases are not assigned a default integer value when they are created. In the CompassPoint expample above, north, south, east and west do not implicityly equal 0,1,2 and 3. Instead,the different enumeration cases are fully-fledged values in their own right, with an explicityly-defined type of CompassPoint. 
    //Multiple cases can appear on a single line, separated by commas：
    enum Plant: Int{
        case mercury = 1, venus, earth, mars, jupiter, staturn, uranus, neptune
    }
    
    //Each enumeration definition defines a brand new type. Like other types in Swift, their names (such as CompassPoint and Planet) should start with a capital letter. Give enumeration types singular raher than plural names, so that they read as self-evident:
    func test(){
        var directionToHead = CompassPoint.west
        print(directionToHead)
        //The type of directionToHead is inferred when it is initialized with one of the possible values of CompassPoint. Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax:
        directionToHead = .east
        print(directionToHead)
        
        //Matching Enumeration Values with a Switch Statement
        //You can mathc individual enumeration values with a switch statement:
        directionToHead = .south
       
        
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
        //You can read this code as:
        //"Consider the value of directionToHead. In the case where it equals .north, print  'Lots of plants have a north'. In The case where it equals .south, print "Watch out for penguins", and so on."
        //As described in Control Flow, a switch statement must be exhaustive when considering an enumeration's cases. If the case for .west is omitted, this code does not compile, because it does not consider the complete list of CompassPoint cases. Requiring exhaustiveness ensures that enumeration cases are not accidentally omitted.
        //When it is not appropriate to provide a case for every enumeration case, you can provide a default case to cover any cases that are not addressed explicitly:
        let somePlant = Plant.earth
        switch somePlant {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
        
        
        //New barcodes can then be created using either type:
        var  productBarcode = Barcode.upc(8, 85909, 543, 435)
        print(productBarcode)
        productBarcode = .qrCode("asdfsdaf")
        
        //At this point, the original Barcode.upc and its integer values are replaced by the new Barcode.qrCode and its string value. Constants and variables of type Barcode can store either a.upc or a.qrCode (together with their associated values), but they can only store one of them at any given time.
        //The different barcode types can be checked using a switch statement, as before. This time, however, the associated values can be extracted as part of the switch statement. You extract each associated value as a constant (with the let prefix) or a variable (with the var prefix) for use within the switch case's body:
        
        switch productBarcode {
        case .upc(let numberSystem, let manufacturer, let product, let ckeck):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(ckeck)")
        case .qrCode(let productCode):
            print("QR code: \(productCode)")
        }

        //If all of the asscoated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:
        switch productBarcode {
        case let .upc(numberSystem, manufacturer, product, ckeck):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(ckeck)")

        case let .qrCode(productCode):
            print("QR code : \(productCode)")
        }
        
        //You access the raw value of an enumeration case with its rawValue property:
        let earthOrder = Plant.earth.rawValue
        print("earthOrder : \(earthOrder)")
        
        //This example identifies Uranus from its raw value of 7:
        let possiblePlant = Plant(rawValue:7)
        print("possiblePlant :\(possiblePlant)")
        //Not all possible Int values will find a matching plant, however. Bacause of this, the raw value initializer always returns an optional enumeration case. In the example above, possiblePlant is of type Plant?, or "optional Planet."
        //NOTE The raw value initializer is failable initializer, because not every raw value will return an enumeration case.
        //If you try to find a plant with a position of 11, the optioanl Plant value returned by the raw value initializer will be nil:
        
        let positionToFind = 11
        if let somePlant = Plant(rawValue: positionToFind){
            
            switch somePlant {
            case .earth:
                print("Mostly harmless")
                
            default:
                print("Not a safe place for humans")
            }
            
        } else {
            print("There isn't a planet at position \(positionToFind)")
        }
        //This example uses optional binding to try to access a plant with a raw value of 11. The statement if let somePlanet = Planet(rawVlue: 11) creates an optional Planet, adn sets somePlanet to the value of that optional Planet if it can be retrieved. In this case, it is not possible to retrieve a planet with a position of 11, and so the else branch is executed instead.
        
        
    }
    
    //Associated Values
    //The example in the previous section show how the cases of an enumeration are a defined(and typed) value in their own right. You can set a constant or variable to Plant. earth, and check for this value later, However, it is sometimes useful to be able to store associated values of other types alongside these case values, This enables you to store additional custom information along with the case value, and permits this information to vary each time you use that case in your code.
    //You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed. Enumerations similar to these are known as discriminated unions, tagged unions, or variants in other programeing languages.
    //For example, suppose an inventory tracking system needs to track products by two different types of barcode. Some products are labeled with 1D barcodes in UPC format, which uses the number 0 to 9. Each barcode has a "number system" digit, followed by five "manufacturer code" digits and five "product code" digits.  These are followed by a "check" digit to verify that the code has been scanned correctly:
    //Other products are labeled with 2D barcodes in QR code format, which can use any ISO 8859-1 character and can encode  a string up to 2953 characters long:
    //It would be convenient for an inventory tracking system to be able to store UPC barcodes as a tuple of four integers, and QR code barcodes as a string of any length.
    //In Swift, an enumeration to define product barcodes of either type might look like this:
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    //This can be read as:
    //"Define an enumeration type called Barcode, which can take either a value of upc with an associated value of type (Int, Int, Int, Int), or a vlaue of qrCode with an associated value of type String"
    //This definition does not provide any actual Int or String values - it just defines the type of associated values that Barcode constants and variables can store when they are equal to Barcode. upc or Barcode.qrCode.
    
   
    //Raw Values
    //The barcode example in Associated Values shows how cases of an enumeration can declare that htey store assocaited values of different types. As an alternative  to associated values, enumeration cases can come prepopulated with default values (called raw values),which are all of the same type.
    //Here's an example that stores raw ASCII values alongside named enumeration cases:
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    
    //Here, the raw values for an enumeratin called ASCIIControlCharacter are defined to be of type Character, and are set to some of the more common ASCII control characters. Character values are described in Strings and Characters.
    //Raw values can be strings, characters, or any of the integer of floating-point number types. Each raw value must be unique within its enumeration declaration.
    //NOTE Raw values are not the same as associated values. Raw values are set to prepopulated values when you first define the enumeration in your code, like the tree ASCII codes avove. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration's cases, and can be different each time you do so.
    //Implicitly Assigned Raw Values
    //When you're working with enumerations that store integer or string raw values, you don't have to explicitly assign a raw value for each case. When you don't, Swift wil automatically assign the values for you.
    //For instance, when integers are used for raw values, the implicit value for eache case is one more than the previous case. If the first case doesn't have a value set, its value is 0.
    //The enumberation below is a refinement of the earlier Plant enumeration, with integer raw values to represent each planet's order from the sun:
    enum Planet: Int{
        case mercury = 1, vernus, earth, mars, jupiter, saturn, unranus, neptune
    }
    //In the example above, Plant.mercury has an explicit raw value of 1, Plant.venus has an implicit raw value of 2, and so on.
    //When strings are used for raw values, the implicit value for each case is the text of that case's name.
    //The enumeration below is a refinement of the earlier CompassPoint enumeration, with string raw values to represent each direction's name:

    //Initializing from a Raw value 
    //If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value's type (as a parameter called rawValue) and returns either an enumeration case or nil. You can use this initializer to try to create a new instance of the enumeration.
    
    

}
