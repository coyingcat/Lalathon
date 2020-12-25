//
//  main.swift
//  hello
//
//  Created by Jz D on 2020/12/25.
//

import Foundation

var contents: String?

if let src = URL(string: "/Users/jzd/Documents/Lalathon/src/ContentView.swift"){
    do {
        contents = try String(contentsOfFile: src.path)
        print(contents ?? "")
    } catch {
        print(error)
    }
}


guard let info = contents else{
    fatalError()
}


//  193
 
var i = 0



struct TargetInfo{
    let start = "Section"
    let second: Character = "{"
    let end: Character = "}"
}


let target = TargetInfo()

let total = info.count
while i < total {
    
    
    let endIndex = i + target.start.count - 1
    if endIndex >= total{
        break
    }
    if let temp = info[i...endIndex], temp == target.start{
        
        i += target.start.count - 1
        inner: while i < total {
            var notMet = true
            if notMet{
                if info[i] == target.second{
                    notMet = false
                }
            }
            else{
                if info[i] == target.end{
                    break inner
                }
            }
            i += 1
        }
        
        
    }
    
    
    
    
    i += 1
}



extension String {
    subscript(range: ClosedRange<Int>) -> String? {
        guard let startIndex = index(startIndex, offsetBy: range.lowerBound,limitedBy: endIndex), let endIndex = index(startIndex, offsetBy: range.upperBound,limitedBy: endIndex) else { return nil }
        return String(self[startIndex...endIndex])
    }
    
    
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
