//
//  MapViewController.swift
//  Container
//
//  Created by Ackshaey Singh on 3/23/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification center registering
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "changeZoomFromNotification:", name: "NotificationChangeZoom", object: nil)
        
        let center = CLLocationCoordinate2D(latitude: 37.56776, longitude: -122.26312)
        let region = MKCoordinateRegionMakeWithDistance(center, 1000, 1000)
        self.map.region = region
        
        //    37.56789, -122.26192 - Home
        //    37.56823, -122.26947 - Mcdonalds
        //    37.57150, -122.25951 - Beer
        
        let annotation1 = Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.56789, longitude: -122.26192), title: "Home", subTitle: "Beach Park")
        let annotation2 = Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.56823, longitude: -122.26947), title: "Home", subTitle: "Beach Park")
        let annotation3 = Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.57150, longitude: -122.25951), title: "Home", subTitle: "Beach Park")
        
        self.map.addAnnotations([annotation1, annotation2, annotation3])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeMapZoom(zoomValue: Float) {
        let center = self.map.region.center
        let region = MKCoordinateRegionMakeWithDistance(center, Double(zoomValue), Double(zoomValue))
        self.map.region = region
        
        println("Zoom changed to \(zoomValue)")
    }
    
    // Change zoom from notification
    func changeZoomFromNotification(notif: NSNotification){
        let dict: [String : Float] = notif.userInfo as [String : Float]
        if let zoomValue = dict["Zoom"]{
            let center = self.map.region.center
            let region = MKCoordinateRegionMakeWithDistance(center, Double(zoomValue), Double(zoomValue))
            self.map.region = region
        }
    }

    // This will be called for each pin!
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("myPin")
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
        }
        (annotationView as MKPinAnnotationView).pinColor = MKPinAnnotationColor.Green
        (annotationView as MKPinAnnotationView).animatesDrop = true
        annotationView.canShowCallout = true
        annotationView.enabled = true
        return annotationView
    }
    
    // Good practice if we implement notifications
    deinit {
        let notifCenter = NSNotificationCenter.defaultCenter()
        notifCenter.removeObserver(self)
    }
}
