//
//  TargetViewController.swift
//  archery app
//
//  Created by Ian Gristock on 18/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
    
    let colorArray: [UIColor] = [UIColor.yellowColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.redColor(), UIColor.blueColor(), UIColor.blueColor(), UIColor.blackColor(), UIColor.blackColor(), UIColor.whiteColor(), UIColor.whiteColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.width
        let step = width/10
        let centerPoint = view.center // dunno if that actually works
        
        for idx in (1...10).reverse() {
            let curRadius = Int(step) * Int(idx)
            UIGraphicsBeginImageContextWithOptions(CGSize(width: curRadius, height: curRadius), false, 0)
            let context = UIGraphicsGetCurrentContext()
            let rectangle = CGRect(x: 0, y: 0, width: curRadius, height: curRadius)
            
            CGContextSetFillColorWithColor(context, colorArray[Int(idx) - 1].CGColor)
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
            CGContextSetLineWidth(context, 1)
            
            CGContextAddEllipseInRect(context, rectangle)
            CGContextDrawPath(context, .FillStroke)
            
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageView = UIImageView(image: img!)
            imageView.center = centerPoint
            let tapGestureRecognizer = UILongPressGestureRecognizer(target:self, action:#selector(TargetViewController.imageTapped(_:)))
            imageView.userInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            view.addSubview(imageView)
            // draw circle with     curRadius and same center as the rest
            // fill background of circle with colour of ring, adding the outer layers first builds up a layers of colour so bullseye will be very top
        }
        // Do any additional setup after loading the view.
    }
    
    func imageTapped(img: AnyObject)
    {
        let curRadius = 10
        UIGraphicsBeginImageContextWithOptions(CGSize(width: curRadius, height: curRadius), false, 0)
        let context = UIGraphicsGetCurrentContext()
        let rectangle = CGRect(x: 0, y: 0, width: curRadius, height: curRadius)
        
        CGContextSetFillColorWithColor(context, UIColor.brownColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 1)
        
        CGContextAddEllipseInRect(context, rectangle)
        CGContextDrawPath(context, .FillStroke)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageView = UIImageView(image: image!)

        let touchLocation = img.locationInView(img.view.window)
        print(touchLocation)
        imageView.center = touchLocation
        imageView.meta
        view.addSubview(imageView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
