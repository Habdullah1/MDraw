//
//  BrushModal.swift
//  MDraw
//
//  Created by zer0ne on 11/1/17.
//  Copyright © 2017 Hasanain. All rights reserved.
//

import Foundation
import UIKit


class brushModalController: UIViewController {
    
    var bModal : brushModal?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    func updateModLabel(color : UIColor){
        if let _ = bModal {
            bModal?.colorLabel?.backgroundColor = color
            print("updateModLabel gets called")
        }
        print("here")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
