//
//  QKBasics.swift
//  QKSwift
//
//  Created by 一米阳光 on 16/9/3.
//  Copyright © 2016年 一米阳光. All rights reserved.
//

import UIKit

class QKBasics: NSObject {
    
    func test()
    {
        letOrVarTest()
        
        floatTest()
        
        strTest()
    }
    
    func letOrVarTest() -> Void  {
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

}
