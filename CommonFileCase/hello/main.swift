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
    
    if let temp = info[i...endIndex], temp == target.start{
        
        if debug == 1{
            debug += 1
          //  print(temp)
        }
        var bracketCount = 0
        
        i += target.start.count - 1
        var beginIndex = 0
        first: while i < total {
            inner: switch info[i] {
            case target.second:
                if bracketCount == 0{
                    beginIndex = i
                }
                bracketCount += 1
            case target.end:
                bracketCount -= 1
                if bracketCount == 0{
                    result.append(info[(beginIndex+1)...(i-1)] ?? "")
                    break inner
                }
            default:
                ()
            }
            i += 1
        }
        
    }
    
    
    
    
    i += 1
}

result.forEach { (ele) in
    print(ele, "\n\n")
}




