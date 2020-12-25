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
       // print(contents ?? "")
    } catch {
        print(error)
    }
}


guard let info = contents?.replacingOccurrences(of: " ", with: "") else{
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

var result = [String]()
var debug = 1
while i < total {
    
    
    let endIndex = i + target.start.count - 1
    if endIndex >= total{
        break
    }
    
    if let temp = info[i...endIndex]{
//        print(temp)
//        print(i)
//        print(info[i])
//        print(endIndex)
//        print(info[endIndex])
//        print("\n\n")
    }
    
    
    if let temp = info[i...endIndex], temp == target.start{
        
        if debug == 1{
            debug += 1
          //  print(temp)
        }
        
        
        i += target.start.count - 1
        var beginIndex = 0
        first: while i < total {
            if info[i] == target.second{
                beginIndex = i
                break first
            }
            i += 1
        }
        second: while i < total{
            if info[i] == target.end{
                result.append(info[beginIndex...i] ?? "")
                break second
            }
            i += 1
        }
        
    }
    
    
    
    
    i += 1
}

result.forEach { (ele) in
    print(ele, "\n")
}


extension String {
    subscript(range: ClosedRange<Int>) -> String? {
        guard let startIdx = index(startIndex, offsetBy: range.lowerBound,limitedBy: endIndex), let endIdx = index(startIndex, offsetBy: range.upperBound,limitedBy: endIndex) else { return nil }
        return String(self[startIdx...endIdx])
    }
    
    
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
