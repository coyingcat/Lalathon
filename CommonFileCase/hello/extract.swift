//
//  extract.swift
//  hello
//
//  Created by Jz D on 2020/12/26.
//

import Foundation




func extract(content info: String) -> [String]{
    let total = info.count

    var result = [String]()

    while i < total {
        
        
        let endIndex = i + target.start.count - 1
        if endIndex >= total{
            break
        }
        
        if let temp = info[i...endIndex], temp == target.start{

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
    return result
}
