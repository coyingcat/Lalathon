//
//  main.swift
//  hello
//
//  Created by Jz D on 2020/12/25.
//

import Foundation


let path = "\(NSHomeDirectory())/Downloads"

let folder = try Folder(path: path)
var i = 0
let cnt = folder.files.count
for file in folder.files {
    if file.name.contains("(1"){
        print(file.name)
    }
    
}
