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
