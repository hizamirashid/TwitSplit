//
//  NewTweetViewController.swift
//  TwitSplit
//
//  Created by Massive Infinity on 19/1/19.
//  Copyright © 2019 Hizami Rashid. All rights reserved.
//

import UIKit

protocol NewTweetDelegate {
    func passDataFromNewTweetDelegate(data: [String])
}

class NewTweetViewController: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var tweetBtn: RoundedButton!
    @IBOutlet weak var mainIV: RoundedImageView!
    @IBOutlet weak var textView: UITextView!
    
    var delegate: NewTweetDelegate?
    
    // MARK: - Instance
    static func getInstance() -> NewTweetViewController {
        let sb = UIStoryboard.init(name: Constants.Storyboard.home, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NewTweetViewController") as! NewTweetViewController
        return vc;
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initUI()
    }
    
    func initUI() {
        
        textView.placeholder = "What's Happening?"
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetNowAction(_ sender: Any) {
        guard let message = textView.text else {
            print("No message")
            return
        }
        
        if let hasWhiteSpace = message.rangeOfCharacter(from: CharacterSet.whitespaces) {
            let msg = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
            let splittedString = SplitString(stringToBeSplitted: message, By: 46) // why?? split by 46 only? because we need to add 4 more character="1/2 " to the splitted string which make the total character is 50.

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
            
            self.delegate?.passDataFromNewTweetDelegate(data: arrayOfString)
            self.dismiss(animated: true, completion: nil)
        }
        else {
            print("String has no whitespace")
        }
        
    }
    
}


extension NewTweetViewController {
    
    // MARK: - Functions
    func SplitString(stringToBeSplitted:String, By:Int) -> [[[String]]]
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
                newArray.append(tempString)
                totalSplittedArray.append(newArray)
            }
            
        }
        
        for i in 1...totalSplittedArray.count {
            
            let index = i-1
            totalSplittedArray[index].insert(["\(i)/\(totalSplittedArray.count) "], at: 0)
        }
        
        return totalSplittedArray
    }
}
