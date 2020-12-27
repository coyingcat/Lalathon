//
//  main.swift
//  hello
//
//  Created by Jz D on 2020/12/25.
//

import Foundation


let start = Date()
// 性能

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
    
    let cnt: Int
    
    init() {
        cnt = start.count
    }
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

var classNameResult = [[String]]()
// index, file list


for piece in handledData{
    if let list = regex(with: piece[1]){
       // list.debug()
        let tmp = [piece[0]] + list
        classNameResult.append(tmp)
    }

}

classNameResult.debug()


// 性能

let end = Date()


let val = end.timeIntervalSince(start)

// print(val)

//  0.808 -> 0.812

// print(val.runtime)



// go on
let outCnt = classNameResult.count

var result = [[File]](repeating: [File](), count: outCnt)

let path = "\(NSHomeDirectory())/Downloads/Cookbook-main 2/Cookbook/Cookbook/Recipes"

let folder = try Folder(path: path)


    
i = 0

while i < outCnt {
    var j = 1
    let innerCnt = classNameResult[i].count
    while j < innerCnt{
        third: for file in folder.files {
            do {
                let content = try String(contentsOfFile: file.path, encoding: .utf8)
                if content.contains("struct \(classNameResult[i][j])"){
                    result[i].append(file)
                    break third
                }
            } catch {
                print(error)
            }
        }
        j += 1
    }
    i += 1
}


i = 0
let manager = FileManager.default
while i < outCnt {
    let folderPath = path + "/\(classNameResult[i][0])"
    do {
        try manager.createDirectory(atPath: folderPath, withIntermediateDirectories: false, attributes: nil)
    } catch {
        fatalError()
    }
    
    let destinationFolder = try Folder(path: folderPath)
    for tbdFile in result[i]{
        if manager.fileExists(atPath: tbdFile.path){
            try tbdFile.move(to: destinationFolder)
        }
    }
    i += 1
}

