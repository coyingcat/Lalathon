//
//  main.swift
//  hello
//
//  Created by Jz D on 2020/12/25.
//

import Foundation

var contents: String?

if let src = URL(string: "\(NSHomeDirectory())/Documents/Lalathon/src/ContentView.swift"){
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
// rawInfo.debug()

var i = 0
let cnt = rawInfo.count
// midData
// 0, content zero
// 1, content one
var midData = [[String]]()
while i < cnt{
    midData.append(["\(i)", rawInfo[i]])
    i += 1
}


// handledData
// 0_0, content zero zero
// 0_1, content zero one
// 1, content one
var handledData = [[String]]()
print("-------")

for piece in midData{
    
    if piece[1].contains(target.start){
        let list = extract(content: piece[1])
        // list.debug()
        let temp = list.enumerated().map({ (tmp) ->  [String] in
            ["\(piece[0])_\(tmp.offset)", tmp.element]
        })
        // temp.debug()
        handledData.append(contentsOf: temp)
        
    }
    else{
        
        handledData.append(piece)
    }
    
}

var result = [[String]]()
// index, file list


for piece in handledData{
    if let list = regex(with: piece[1]){
       // list.debug()
        let tmp = [piece[0]] + list
        result.append(tmp)
    }

}

result.debug()
