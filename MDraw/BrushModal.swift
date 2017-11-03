//
//  BrushModal.swift
//  MDraw
//
//  Created by zer0ne on 11/1/17.
//  Copyright © 2017 Hasanain. All rights reserved.
//

import Foundation
import UIKit

class brushModal: UIView {
    
    var sizeSlider: UISlider?
    var colorLabel : UILabel?
    var wheel : colorWheel?
    var bmc : brushModalController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.35)
        self.layer.cornerRadius = 0.25 * frame.width
        bmc = brushModalController(nibName: nil, bundle: nil)
        bmc?.bModal = self
        //size slier
        sizeSlider = UISlider(frame: CGRect(x: 0.1 * frame.width,y: 0.65 * frame.height,width: 0.8 * frame.width,height: 0.3 * frame.height))
        sizeSlider?.maximumValue = 35
        sizeSlider?.minimumValue = 4
        sizeSlider?.setValue(Float(globals.BRUSH_SIZE), animated: false)
        sizeSlider?.addTarget(self, action: #selector(numChanged), for: .valueChanged)
        
        //colorLabel
        colorLabel = UILabel(frame: CGRect(x: 0.70 * frame.width,y: 0.15 * frame.height, width: 0.2 * frame.width, height: 0.3 * frame.height))
        colorLabel?.text = String(Int((sizeSlider?.value)!))
        colorLabel?.backgroundColor = UIColor(cgColor: globals.BRUSH_COLOR)
        colorLabel?.textColor = UIColor.white
        
        
        wheel = colorWheel(frame: CGRect(x: 0.1 * frame.width, y: 0.1 * frame.height, width: 0.55 * frame.width, height: frame.height * 0.55), bmc: self.bmc!)
        
        
        //add views to main view
        self.addSubview(sizeSlider!)
        self.addSubview(colorLabel!)
        self.addSubview(wheel!)
        
    }
    @objc func numChanged(sender: UISlider) {
        
        sizeSlider?.setValue(Float(Int((sizeSlider?.value)!)), animated: true)
        updateLabel(num: sizeSlider?.value)
    }
    
    func updateLabel(num : Float?) {
        if let nm = num {
            
            self.colorLabel?.text = "\(nm)"
            globals.BRUSH_SIZE = CGFloat(nm)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
