//
//  landingScreen.swift
//  MDraw
//
//  Created by zer0ne on 9/13/17.
//  Copyright © 2017 Hasanain. All rights reserved.
//

import Foundation
import UIKit

var globals = Globals.init()

class LandingScreen: UIViewController {
    var brushButton : UIButton?
    var clearButton : UIButton?
    var saveButton : UIButton?
    var ads_view : UIView?
    var drawingView : drawView?
    var brushMod : brushModal?
    var isBrushPressed = false
    var bmc : brushModalController?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        bmc = brushModalController(nibName: nil, bundle: nil)

        //brush section
        brushButton = UIButton(frame: CGRect(x: 0.25 * globals.SCREEN_WIDTH, y: 0.05 * globals.SCREEN_HEIGHT, width: 0.05 * globals.SCREEN_WIDTH, height: 0.05 * globals.SCREEN_WIDTH))
        brushButton?.setBackgroundImage(UIImage(named:"color_palette"), for: .normal)
        brushButton?.addTarget(self, action: #selector(LandingScreen.brushPressed), for: .touchUpInside)
        super.view.addSubview(brushButton!)
        
        //clear button
        clearButton = UIButton(frame: CGRect(x: 0.5 * globals.SCREEN_WIDTH, y: 0.05 * globals.SCREEN_HEIGHT, width: 0.05 * globals.SCREEN_WIDTH, height: 0.05 * globals.SCREEN_WIDTH))
        clearButton?.setBackgroundImage(UIImage(named: "new"), for: .normal)
        clearButton?.addTarget(self, action: #selector(LandingScreen.clearPressed), for: .touchUpInside)
        super.view.addSubview(clearButton!)
        
        //save button
        saveButton = UIButton(frame: CGRect(x: 0.75 * globals.SCREEN_WIDTH, y: 0.05 * globals.SCREEN_HEIGHT, width: 0.05 * globals.SCREEN_WIDTH, height: 0.05 * globals.SCREEN_WIDTH))
        saveButton?.setBackgroundImage(UIImage(named:"saveIcon"), for: .normal)
        saveButton?.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
        super.view.addSubview(saveButton!)
        
        drawingView = drawView(frame: CGRect(x: 0, y: 0.2 * globals.SCREEN_HEIGHT, width: globals.SCREEN_WIDTH, height: globals.SCREEN_HEIGHT))
        drawingView?.isUserInteractionEnabled = true
        super.view.addSubview(drawingView!)
        
        
    }
    
    @objc func brushPressed() {
        if isBrushPressed {
            brushMod!.removeFromSuperview()
            isBrushPressed = false
        }
        else {
            brushMod = brushModal(frame: CGRect(x: 0.25 * globals.SCREEN_WIDTH, y: 0.15 * globals.SCREEN_HEIGHT, width: 0.5 * globals.SCREEN_WIDTH, height: 0.5 * globals.SCREEN_HEIGHT))
            super.view.addSubview(brushMod!)
            isBrushPressed = true
        }
    }
    
    @objc func savePressed() {
        
        UIImageWriteToSavedPhotosAlbum((drawingView?.image)!, nil, nil, nil)
        let alert = UIAlertController(title: "Saved", message: "Your drawing has been saved to camera roll", preferredStyle: .alert)
        let alertAction = UIAlertAction(title:"OK!", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true) {
            ()-> Void in
        }
    }
    
    @objc func clearPressed() {
        drawingView?.image = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
