//
//  ViewController.swift
//  MDraw
//
//  Created by zer0ne on 9/13/17.
//  Copyright © 2017 Hasanain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var swiped = false
    var lastPoint = CGPoint.zero
    private var landingScreen:LandingScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        landingScreen = LandingScreen()
        super.view.addSubview(landingScreen!.view)
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
