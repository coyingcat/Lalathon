//
//  Extern.swift
//  hello
//
//  Created by Jz D on 2020/12/25.
//

import Foundation





extension String {
    subscript(range: ClosedRange<Int>) -> String? {
        guard let startIdx = index(startIndex, offsetBy: range.lowerBound,limitedBy: endIndex), let endIdx = index(startIndex, offsetBy: range.upperBound,limitedBy: endIndex) else { return nil }
        return String(self[startIdx...endIdx])
    }
    
    
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}




extension UInt64{
    var sheerSize: String{
        let m: UInt64 = self/(1024 * 1024)
        var k: UInt64 = 0
        if self > m * (1024 * 1024){
            k = self/1024 - m * 1024
        }
        var b: UInt64 = 0
        if self > m * (1024 * 1024) + k * 1024{
            b = self - m * (1024 * 1024) - k * 1024
        }
        var result = "\(b) B"
        if k > 0{
            result = "\(k) KB" + " \(result)"
        }
        if m > 0{
            result = "\(m) MB" + "         \(result)"
        }
        return result
        
    }
    
}
