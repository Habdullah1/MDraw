//
//  DrawView.swift
//  MDraw
//
//  Created by zer0ne on 11/2/17.
//  Copyright © 2017 Hasanain. All rights reserved.
//

import Foundation
import UIKit

class drawView : UIImageView {
    var swiped = false
    var lastPoint : CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self)
        }
    }
    
    func drawLines(fromPoint:CGPoint, toPoint:CGPoint) {
        
        UIGraphicsBeginImageContext(self.frame.size)
        self.image?.draw(in: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        
        context?.addLine(to: CGPoint(x:toPoint.x, y: toPoint.y))
        context?.setLineWidth(globals.BRUSH_SIZE)
        context?.setBlendMode(.normal)
        context?.setLineCap(.round)
        context?.setStrokeColor(globals.BRUSH_COLOR)
        context?.strokePath()
        
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            drawLines(fromPoint: lastPoint!, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint!, toPoint: lastPoint!)
        }
    }

}
