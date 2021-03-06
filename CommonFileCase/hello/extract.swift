//
//  extract.swift
//  hello
//
//  Created by Jz D on 2020/12/26.
//

import Foundation




func extract(content info: String) -> [String]{
    var i = 0
    let total = info.count

    var result = [String]()

    while i < total {
        let endIndex = i + target.cnt - 1
        if endIndex >= total{
            break
        }
        if info.isValid(from: i){
            var bracketCount = 0
            i += target.cnt - 1
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



func regex(with content: String) -> [String]?{
    

    let pattern = #"destination:(.+?)\("# //Swift 5+ only
    //let pattern = "(?:\\w+)(?:\\s+\\w+)*"
    do {
        let regex = try NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: content, range: NSRange(0..<content.utf16.count))
        let matchingWords = matches.map {
            String(content[Range($0.range(at: 1), in: content)!])
        }
       // print(matchingWords) //(test:3)->["key", "value", "comment"]
        return matchingWords
    } catch {
        print("Regex was bad!")
        return nil
    }

}




extension String{
    
    func isValid(from index: Int) -> Bool{
        var i = 0
        while i < target.cnt {
            if self[index + i] != target.start[i]{
                return false
            }
            i += 1
        }
        return true
    }
    
}
