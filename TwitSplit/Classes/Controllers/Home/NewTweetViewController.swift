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
            
            if message.count <= 50 {
                
                self.delegate?.passDataFromNewTweetDelegate(data: [message])
                self.dismiss(animated: true, completion: nil)
            }
            
            
            let arrayOfString = SplitMessageHelper.SplitMessage(stringToBeSplitted: message, By: 46) // why?? split by 46 only? because we need to add 4 more character="1/2 " to the splitted string which make the total character is 50.

            self.delegate?.passDataFromNewTweetDelegate(data: arrayOfString)
            self.dismiss(animated: true, completion: nil)
        }
        else {
            print("String has no whitespace")
            self.showErrorAlert(message: "Message has no whitespace")
        }
        
    }
    
}
