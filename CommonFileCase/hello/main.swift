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

// 去除空格和换行
guard let info = contents?.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "") else{
    fatalError()
}


//  193
 




struct TargetInfo{
    let start = "Section"
    let second: Character = "{"
    let end: Character = "}"
}


let target = TargetInfo()



var rawInfo = extract(content: info)

// filter

rawInfo = rawInfo.filter { (piece) -> Bool in
    piece.contains("NavigationLink")
}
rawInfo.debug()

var i = 0
let cnt = rawInfo.count
// resultSecond
// 0, content zero
// 1, content one
var resultSecond = [[String]]()
while i < cnt{
    resultSecond.append(["\(i)", rawInfo[i]])
    i += 1
}


// resultThird
// 0_0, content zero zero
// 0_1, content zero one
// 1, content one
var resultThird = [[String]]()
print("-------")

for piece in resultSecond{
    
    if piece[1].contains(target.start){
        let list = extract(content: piece[1])
        // list.debug()
        let temp = list.enumerated().map({ (tmp) ->  [String] in
            ["\(piece[0])_\(tmp.offset)", tmp.element]
        })
        // temp.debug()
        resultThird.append(contentsOf: temp)
        
    }
    else{
        
        resultThird.append(piece)
    }
    
}

resultThird.debug()
