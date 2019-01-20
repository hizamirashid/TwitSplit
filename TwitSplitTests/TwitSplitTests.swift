//
//  TwitSplitTests.swift
//  TwitSplitTests
//
//  Created by Massive Infinity on 17/1/19.
//  Copyright © 2019 Hizami Rashid. All rights reserved.
//

import XCTest
@testable import TwitSplit

class TwitSplitTests: XCTestCase {

    func testSplitMessage() {
        let msg = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        let checker = ["2/2 my messages, so I don't have to do it myself.", "1/2 I can't believe Tweeter now supports chunking "]
        
        let arrayOfString = SplitMessageHelper.SplitMessage(stringToBeSplitted: msg, By: 46)
        
        for i in 0..<arrayOfString.count {
            XCTAssertEqual(arrayOfString[i], checker[i])
        }
    }

}
