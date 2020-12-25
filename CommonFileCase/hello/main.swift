//
//  main.swift
//  hello
//
//  Created by Jz D on 2020/12/25.
//

import Foundation



if let src = URL(string: "/Users/jzd/Documents/Lalathon/src/ContentView.swift"){
    do {
        let contents = try String(contentsOfFile: src.path)
        print(contents)
    } catch {
        print(error)
    }
}


 
 
