//
//  MapViewController.swift
//  HuntRestaurant
//
//  Created by Mengistayehu Mamo on 4/17/16.
//  Copyright © 2016 Mengistayehu Mamo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var makView: MKMapView!
    var resturant: Restuarant!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        makView.delegate = self
        
        makView.showsScale = true
        makView.showsCompass = true
        makView.showsTraffic = true
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(resturant.location, completionHandler:{ placemarks, error in
            if error != nil{
                print("error")
                return
            }
            if let placemarks = placemarks{
                let placemarks = placemarks[0]
                let annotation = MKPointAnnotation()
                annotation.title = self.resturant.name
                annotation.subtitle = self.resturant.type
                
                if let location = placemarks.location{
                    annotation.coordinate = location.coordinate
                    
               self.makView.showAnnotations([annotation], animated: true)
               self.makView.selectAnnotation(annotation, animated: true)
                }
            }
            
        })

        // Do any additional setup after loading the view.
    }
    
     func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "myPin"
        
        if(annotation.isKindOfClass(MKUserLocation)){
            return nil
        }
        var annoationView:MKPinAnnotationView? = makView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annoationView == nil{
            annoationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier:identifier)
            annoationView?.canShowCallout = true

        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: resturant.image)
        annoationView?.leftCalloutAccessoryView = leftIconView
        //annotation Customise
        annoationView?.pinTintColor = UIColor.orangeColor()
        return annoationView
    
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
