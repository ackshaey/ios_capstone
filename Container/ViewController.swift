//
//  ViewController.swift
//  Container
//
//  Created by Ackshaey Singh on 3/23/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SliderViewControllerDelegate {
    
    var mapVC: MapViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate the three VCs
        let mapVC = MapViewController(nibName: "MapViewController", bundle: nil)
        self.mapVC = mapVC
        let tableVC = TableViewController(nibName: "TableViewController", bundle: nil)
        let sliderVC = SliderViewController(nibName: "SliderViewController", bundle: nil)
        
        // Set parent as delegate of slider VC
        sliderVC.delegate = self
        
        // Add each to this controller
        self.addChildViewController(mapVC)
        self.addChildViewController(tableVC)
        self.addChildViewController(sliderVC)
        
        // Add the view of each child to the current view
        self.view.addSubview(mapVC.view)
        self.addConstraintsToMapView(mapVC.view)
        
        self.view.addSubview(tableVC.view)
        self.addConstraintsToTableView(tableVC.view)
        
        self.view.addSubview(sliderVC.view)
        self.addConstraintsToSliderView(sliderVC.view)
        
        // We are done moving to parent
        mapVC.didMoveToParentViewController(self)
        tableVC.didMoveToParentViewController(self)
        sliderVC.didMoveToParentViewController(self)
    }
    
    func sliderViewController(vc: SliderViewController, didChangeZoomValue value: Float) {
        mapVC?.changeMapZoom(value)
    }
    
    func addConstraintsToMapView(mapView: UIView){
        // Remove all constraints
        mapView.setTranslatesAutoresizingMaskIntoConstraints(false)
        // Create top constraints
        // x = my + c.
        let topConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        let leftConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
    }
    
    func addConstraintsToTableView(tableView: UIView){
        // Remove all constraints
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        // Create top constraints
        // x = my + c.
        let topConstraint = NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        let leftConstraint = NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
    }
    
    func addConstraintsToSliderView(sliderView: UIView){
        // Remove all constraints
        sliderView.setTranslatesAutoresizingMaskIntoConstraints(false)
        // Create top constraints
        // x = my + c.
        let topConstraint = NSLayoutConstraint(item: sliderView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: sliderView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        let leftConstraint = NSLayoutConstraint(item: sliderView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: sliderView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

