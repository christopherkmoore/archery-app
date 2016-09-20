//
//  TargetViewController.swift
//  archery app
//
//  Created by Ian Gristock on 18/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
    
    let colorArray: [UIColor] = [UIColor.yellow, UIColor.yellow, UIColor.red, UIColor.red, UIColor.blue, UIColor.blue, UIColor.black, UIColor.black, UIColor.white, UIColor.white]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.width
        let step = width/10
        let centerPoint = view.center // dunno if that actually works
        
        for idx in (1...10).reversed() {
            let curRadius = Int(step) * Int(idx)
            UIGraphicsBeginImageContextWithOptions(CGSize(width: curRadius, height: curRadius), false, 0)
            let context = UIGraphicsGetCurrentContext()
            let rectangle = CGRect(x: 0, y: 0, width: curRadius, height: curRadius)
            
            context?.setFillColor(colorArray[Int(idx) - 1].cgColor)
            context?.setStrokeColor(UIColor.black.cgColor)
            context?.setLineWidth(1)
            
            context?.addEllipse(in: rectangle)
            context?.drawPath(using: .fillStroke)
            
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageView = UIImageView(image: img!)
            imageView.center = centerPoint
            let tapGestureRecognizer = UILongPressGestureRecognizer(target:self, action:#selector(TargetViewController.imageTapped(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            view.addSubview(imageView)
            // draw circle with     curRadius and same center as the rest
            // fill background of circle with colour of ring, adding the outer layers first builds up a layers of colour so bullseye will be very top
        }
        // Do any additional setup after loading the view.
    }
    
    func imageTapped(_ img: AnyObject)
    {
        let curRadius = 10
        UIGraphicsBeginImageContextWithOptions(CGSize(width: curRadius, height: curRadius), false, 0)
        let context = UIGraphicsGetCurrentContext()
        let rectangle = CGRect(x: 0, y: 0, width: curRadius, height: curRadius)
        
        context?.setFillColor(UIColor.brown.cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(1)
        
        context?.addEllipse(in: rectangle)
        context?.drawPath(using: .fillStroke)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageView = UIImageView(image: image!)

        let touchLocation = img.location(in: img.view.window)
        print(touchLocation)
        imageView.center = touchLocation
        view.addSubview(imageView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
