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
        
        let originalImage =  UIImage(named: "IMG_0300.JPG")
//        let tintedImage = originalImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        let tintedImage = originalImage?.imageWithRenderingMode(UIImageRenderingMode.Automatic)
        
        let imageView = UIImageView(image: tintedImage)
        imageView.tintColor = UIColor.blueColor()
        
        willImage.image = imageView.image
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

