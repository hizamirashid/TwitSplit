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
        var newArray : [[String]] = [] // track string by splitting by space
        var totalSplittedArray : [[[String]]] = [] // total splitted by 50 max character
        var tempString : [String] = [] // each string splitted by space
        var totalString = 0 // count total string length
        var total = 0 // count for each loop for max 50
        
        // looping for whole string by character
        for char in stringToBeSplitted {
            
            totalString += 1 // increase count of string length
            
            // if the character is space, then split then and add in new array
            if char == " " {
                tempString.append(String(char))
                newArray.append(tempString)
                
                let count = tempString.count
                total += count
                
                tempString = []
                
            } else { // combine the charcter because no space yet
                tempString.append(String(char))
                
            }
            
            print(total)
            
            // if totalString equal to 46 put then new array into totalSplittedArray (final outcome array)
            if total == By {
                print(newArray)
                totalSplittedArray.append(newArray)
                newArray = []
                total = 0
                
            } else if total > 46 { // if string array is > 46, we add current string to next array
                
                let lastStringArray = newArray.last
                
                // remove last array from current array
                newArray.removeLast()
                
                // add array into totalSplittedArray
                totalSplittedArray.append(newArray)
                
                // put last array into the new array
                newArray = []
                newArray.append(lastStringArray!)
                total = (lastStringArray?.count)!
                
            } else if totalString == stringToBeSplitted.count { // reach end of total string
                
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
        
        // here we loop so we can add indicator "1/2 " .... to the array so that the maximum character is 50.. (46 + 4)
        for i in 1...totalSplittedArray.count {
            
            let index = i-1
            totalSplittedArray[index].insert(["\(i)/\(totalSplittedArray.count) "], at: 0)
        }
        
        //  here we combine back the totalSplittedArray to become to [String]
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
        // we reverse the array so that we will post the "2/2 " then "1/2 ",
        // so that in tableview we will see the post in correct position
        
        arrayOfString.reverse()
        
        return arrayOfString
    }
}
