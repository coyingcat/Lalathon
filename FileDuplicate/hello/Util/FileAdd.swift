//
//  FileAdd.swift
//  hello
//
//  Created by Jz D on 2021/1/11.
//

import Foundation



public extension Location {
    
    
    var sheerName: String{
        let name = url.pathComponents.last!
        return (name as NSString).deletingPathExtension
    }
    
 
    
    
    
    
}
