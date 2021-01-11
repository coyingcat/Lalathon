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
var current: File? = nil
for file in folder.files {
    if let c = current{
        if c.sheerName.contains(file.sheerName){
            print(c.name)
            print(file.name)
            do {
                //return [FileAttributeKey : Any]
                let attr = try FileManager.default.attributesOfItem(atPath: c.path)
                let fileSize : UInt64 = attr[FileAttributeKey.size] as! UInt64
                print("fileSize: \(fileSize.sheerSize)")
                
            } catch {
                print("Error: \(error)")
            }
            print("----\n")
            
        }
        current = nil
    }
    if file.name.contains("(1"){
        current = file
    }
}




