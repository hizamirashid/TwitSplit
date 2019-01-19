//
//  HomeViewController.swift
//  TwitSplit
//
//  Created by Massive Infinity on 19/1/19.
//  Copyright © 2019 Hizami Rashid. All rights reserved.
//

import UIKit
import RevealingSplashView

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [String] = []
    
    // MARK: - Instance
    static func getInstance() -> HomeViewController {
        let sb = UIStoryboard.init(name: Constants.Storyboard.home, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return vc;
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initUI()
    }
    
    func initUI() {
        
    }
    
    // MARK: - Actions
    @IBAction func newTweetAction(_ sender: Any) {
        let vc = NewTweetViewController.getInstance()
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.nameLbl.text = "Hizami"
        cell.hashtagNameLbl.text = "@hizameey"
        cell.messageLbl.text = dataSource[indexPath.row]
        
        cell.mainIV.image = UIImage(named: "default_profile")
        
        return cell
    }
    
    
    
}

extension HomeViewController: NewTweetDelegate {
    func passDataFromNewTweetDelegate(data: [String]) {
        for item in data {
            dataSource.insert(item, at: 0)
        }
        
        self.tableView.reloadData()
    }
    
    
}
