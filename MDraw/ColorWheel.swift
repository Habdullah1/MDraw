//
//  ColorWheel.swift
//  MDraw
//
//  Created by zer0ne on 11/1/17.
//  Copyright © 2017 Hasanain. All rights reserved.
//

import Foundation
import UIKit

class colorWheel : UIImageView {
    var swiped = false
    var lastPoint : CGPoint?
    var bmc : brushModalController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "color_wheel")
        self.isUserInteractionEnabled = true
        
    }
    convenience init (frame: CGRect, bmc : brushModalController) {
        self.init(frame: frame)
        self.bmc = bmc
    }
    func getPixelColorAtLocation(point:CGPoint) -> UIColor {
        let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context!.translateBy(x: -point.x, y: -point.y)
        self.layer.render(in: context!)
        let color: UIColor = UIColor(red: CGFloat(pixel[0])/255.0, green: CGFloat(pixel[1])/255.0, blue: CGFloat(pixel[2])/255.0, alpha: CGFloat(pixel[3])/255.0)
        
        pixel.deallocate(capacity: 4)
        return color
    }
    func updateColor(point: CGPoint) {
        let color = getPixelColorAtLocation(point: point)
        globals.BRUSH_COLOR = color.cgColor
        if bmc != nil {
            bmc!.updateModLabel(color: color)
            bmc!.bModal?.draws?.image = nil
            bmc!.bModal?.draws?.drawLines(fromPoint: CGPoint(x:(bmc!.bModal?.draws?.frame.width)!/2 - 4, y: (bmc!.bModal?.draws?.frame.height)!/2 - 4), toPoint: CGPoint(x:(bmc!.bModal?.draws?.frame.width)!/2 - 4, y: (bmc!.bModal?.draws?.frame.height)!/2 - 4))

        }
        print("update color gets called")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self)
            updateColor(point: lastPoint!)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            updateColor(point: lastPoint!)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            updateColor(point: lastPoint!)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
