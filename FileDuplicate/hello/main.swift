//
//  main.swift
//  hello
//
//  Created by Jz D on 2020/12/25.
//

import Foundation


let path = "\(NSHomeDirectory())/Downloads"
let folder = try Folder(path: path)
var current: File? = nil
for file in folder.files {
    if let c = current{
        if c.sheerName.contains(file.sheerName){
            print(c.name)
            print(file.name)
            do {
                let attr = try FileManager.default.attributesOfItem(atPath: c.path)
                let fileSize = attr[FileAttributeKey.size] as! UInt64
                print("fileSize: \(fileSize.sheerSize)")
                
            } catch { fatalError()}
            print("----\n")
            
        }
        current = nil
    }
    if file.name.contains("(1"){
        current = file
    }
}




