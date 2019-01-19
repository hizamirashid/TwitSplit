//
//  TabBarViewController.swift
//  TwitSplit
//
//  Created by Massive Infinity on 19/1/19.
//  Copyright © 2019 Hizami Rashid. All rights reserved.
//

import UIKit
import RevealingSplashView

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initUI()
    }
    
    func initUI() {
        
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "twitter_logo_transparent")!,iconInitialSize: CGSize(width: 100, height: 100), backgroundColor: UIColor(red:0.11, green:0.63, blue:0.95, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
    }

}
