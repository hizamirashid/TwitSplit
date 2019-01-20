//
//  SplitMessageHelper.swift
//  TwitSplit
//
//  Created by Massive Infinity on 20/1/19.
//  Copyright © 2019 Hizami Rashid. All rights reserved.
//

import Foundation

class SplitMessageHelper {
    
    // MARK: - Split Message
    static func SplitMessage(stringToBeSplitted:String, By:Int) -> [String]
    {
        var newArray : [[String]] = []
        var totalSplittedArray : [[[String]]] = []
        var tempString : [String] = []
        var totalString = 0
        var total = 0
        
        for char in stringToBeSplitted {
            
            totalString += 1
            
            if char == " " {
                tempString.append(String(char))
                newArray.append(tempString)
                
                let count = tempString.count
                total += count
                
                tempString = []
                
            } else {
                tempString.append(String(char))
                
            }
            
            print(total)
            
            if total == By {
                print(newArray)
                totalSplittedArray.append(newArray)
                newArray = []
                total = 0
                
            } else if total > 46 {
                
                let lastStringArray = newArray.last
                
                // remove last array from current array
                newArray.removeLast()
                
                // add array into totalSplittedArray
                totalSplittedArray.append(newArray)
                
                // put last array into the new array
                newArray = []
                newArray.append(lastStringArray!)
                total = (lastStringArray?.count)!
                
            } else if totalString == stringToBeSplitted.count {
                
                let count = tempString.count
                total += count
                
                newArray.append(tempString)
                
                if total > 46 {
                    let lastStringArray = newArray.last
                    
                    // remove last array from current array
                    newArray.removeLast()
                    
                    // add array into totalSplittedArray
                    totalSplittedArray.append(newArray)
                    
                    // put last array into the new array
                    newArray = []
                    newArray.append(lastStringArray!)
                    total = (lastStringArray?.count)!
                }
                
                totalSplittedArray.append(newArray)
            }
            
        }
        
        for i in 1...totalSplittedArray.count {
            
            let index = i-1
            totalSplittedArray[index].insert(["\(i)/\(totalSplittedArray.count) "], at: 0)
        }
        
        let splittedString = totalSplittedArray
        var arrayOfString: [String] = []
        var strings = ""
        for item in splittedString {
            print(item)
            for stringArray in item {
                for string in stringArray {
                    strings.append(string)
                }
            }
            
            arrayOfString.append(strings)
            strings = ""
        }
        
        print(arrayOfString)
        arrayOfString.reverse()
        
        return arrayOfString
    }
}
