//
//  ViewController.swift
//  WorldTrotter
//
//  Created by SB on 8/15/17.
//  Copyright © 2017 SB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
        
        let secondFrame = CGRect(x: 10, y: 10, width: 80, height: 130)
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = UIColor.red
        firstView.addSubview(secondView)
    }

}

