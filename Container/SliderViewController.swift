//
//  SliderViewController.swift
//  Container
//
//  Created by Ackshaey Singh on 3/23/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import UIKit

@objc protocol SliderViewControllerDelegate {
    func sliderViewController(vc: SliderViewController, didChangeZoomValue value: Float)
}

class SliderViewController: UIViewController {
    
    weak var delegate: SliderViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChanged(sender: AnyObject){
        let slider = sender as UISlider
        let value = slider.value
        // Use a delegate
        // self.delegate?.sliderViewController(self, didChangeZoomValue: value)
        
        // Use notifications
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName("NotificationChangeZoom", object: nil, userInfo: ["Zoom" : value])
        
    }

}
