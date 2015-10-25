//
//  ViewController.swift
//  TintTest
//
//  Created by Ronald Fischer on 10/24/15.
//  Copyright (c) 2015 qpiapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var willImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let hsv = RGBtoHSV(1.0, g: 1.0, b: 0.0)
        changeToHue(hsv.h, saturation: hsv.s, brightness: hsv.v)
       
    }
    
    // Hmm, changes the entire image to a flat color (if no matte used)
    func tintImage() {
        let originalImage =  UIImage(named: "IMG_0300.JPG")
        //        let tintedImage = originalImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        let tintedImage = originalImage?.imageWithRenderingMode(UIImageRenderingMode.Automatic)
        
        let imageView = UIImageView(image: tintedImage)
        imageView.tintColor = UIColor.blueColor()
        
        willImage.image = imageView.image
    }
    
    func RGBtoHSV(r : CGFloat, g : CGFloat, b : CGFloat) -> (h : CGFloat, s : CGFloat, v : CGFloat) {
        var h : CGFloat = 0.0
        var s : CGFloat = 0.0
        var v : CGFloat = 0.0
        let col = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        col.getHue(&h, saturation: &s, brightness: &v, alpha: nil)
        return (h, s, v)
    }

    // Nice--changes the image to a different hue.  Just what I wanted
    func changeToHue(hue: CGFloat, saturation: CGFloat, brightness: CGFloat) {
        var imageSize = CGSize(width: willImage.bounds.width, height: willImage.bounds.height)
        UIGraphicsBeginImageContext(imageSize)
        
        let context = UIGraphicsGetCurrentContext()

        let hueBlend = UIView(frame: willImage.bounds)
        hueBlend.backgroundColor = UIColor(hue: CGFloat(hue), saturation: CGFloat(saturation), brightness: brightness, alpha: 1)
            
        
        CGContextDrawImage(context, willImage.bounds, willImage.image?.CGImage);
        CGContextSetBlendMode(context, kCGBlendModeHue);
        
        hueBlend.layer.renderInContext(context)
        
        willImage.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

