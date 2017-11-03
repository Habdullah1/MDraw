//
//  landingScreen.swift
//  MDraw
//
//  Created by zer0ne on 9/13/17.
//  Copyright © 2017 Hasanain. All rights reserved.
//

import Foundation
import UIKit

let globals = Globals.init()

class LandingScreen: UIViewController {
    var brushButton : UIButton?
    var clearButton : UIButton?
    var saveButton : UIButton?
    var ads_view : UIView?
    var drawView : UIImageView?
    var brushModal : UIView?
    var isBrushPressed = false
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        //brush section
        brushButton = UIButton(frame: CGRect(x: 0.25 * globals.SCREEN_WIDTH, y: 0.05 * globals.SCREEN_HEIGHT, width: 0.05 * globals.SCREEN_WIDTH, height: 0.05 * globals.SCREEN_WIDTH))
        brushButton?.backgroundColor = UIColor.red
        brushButton?.addTarget(self, action: #selector(LandingScreen.brushPressed), for: .touchUpInside)
        super.view.addSubview(brushButton!)
        
        //clear button
        clearButton = UIButton(frame: CGRect(x: 0.5 * globals.SCREEN_WIDTH, y: 0.05 * globals.SCREEN_HEIGHT, width: 0.05 * globals.SCREEN_WIDTH, height: 0.05 * globals.SCREEN_WIDTH))
        clearButton?.backgroundColor = UIColor.green
        clearButton?.addTarget(self, action: #selector(LandingScreen.clearPressed), for: .touchUpInside)
        super.view.addSubview(clearButton!)
        
        //save button
        saveButton = UIButton(frame: CGRect(x: 0.75 * globals.SCREEN_WIDTH, y: 0.05 * globals.SCREEN_HEIGHT, width: 0.05 * globals.SCREEN_WIDTH, height: 0.05 * globals.SCREEN_WIDTH))
        saveButton?.backgroundColor = UIColor.blue
        super.view.addSubview(saveButton!)
        
        drawView = UIImageView(frame: CGRect(x: 0, y: 0, width: globals.SCREEN_WIDTH, height: globals.SCREEN_HEIGHT))
        super.view.addSubview(drawView!)
        
        
    }
    
    func brushPressed() {
        if isBrushPressed {
            brushModal!.removeFromSuperview()
            isBrushPressed = false
        }
        else {
            brushModal = UIView(frame: CGRect(x: 0.25 * globals.SCREEN_WIDTH, y: 0.15 * globals.SCREEN_HEIGHT, width: 0.5 * globals.SCREEN_WIDTH, height: 0.5 * globals.SCREEN_HEIGHT))
            brushModal?.backgroundColor = UIColor.white
            super.view.addSubview(brushModal!)
            isBrushPressed = true
        }
    }
    
    func clearPressed() {
        drawView?.image = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
