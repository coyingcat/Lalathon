//
//  DebugInfo.swift
//  hello
//
//  Created by Jz D on 2020/12/26.
//

import Foundation


extension Array where Element == String{
    func debug(){
        forEach { (ele) in
            print(ele, "\n\n")
        }
    }
}


extension Array where Element == [String]{
    func debug(){
        forEach { (ele) in
            print("\(ele[0]) : \(ele[1...]) \n")
        }
    }
}
