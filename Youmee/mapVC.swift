//
//  mapVC.swift
//  Youmee
//
//  Created by Wolfy on 30/01/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Mapbox
import CoreLocation



class mapVC: UIViewController, MGLMapViewDelegate {
    
    let ListPeoplesAroundMe: [(latitude: CLLocationDegrees, longitude: CLLocationDegrees, username: String)] = [(latitude: 43.1528 , longitude: 5.913555, username: "Julia Calzolari"), (latitude: 43.1529 , longitude: 5.9177, username: "Toto de la vega")]
    var userPinArray = [MGLPointAnnotation]()
    var manager = CLLocationManager()
    @IBOutlet weak var profilView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let mapView = MGLMapView(frame: view.bounds,
                                styleURL: MGLStyle.streetsStyleURL(withVersion: 10))
        // Tint the ℹ️ button and the user location annotation.
        mapView.tintColor = .darkGray
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.userTrackingMode = MGLUserTrackingMode.follow
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.showsUserLocation = true
        
        for onePeople in ListPeoplesAroundMe {
            let oneUserPin = MGLPointAnnotation()
            oneUserPin.coordinate.latitude = onePeople.latitude
            oneUserPin.coordinate.longitude = onePeople.longitude
            oneUserPin.title = "Hello world!"
            
            userPinArray.append(oneUserPin)
            
        }
        mapView.addAnnotations(userPinArray)
    }
    
    
    // MARK: - **************** MGLMapViewDelegate methodes *****************
    
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "test")
        
        if annotationImage == nil {
            var image = UIImage(named: "juju")!
            image = image.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: image.size.height/2, right: 0))
            let size: CGSize = CGSize(width: 40, height: 40)
            image = imageResize(imageObj: image, sizeChange: size)
            image = maskRoundedImage(image: image, radius: image.size.height/2)

            
            // Initialize the ‘pisa’ annotation image with the UIImage we just loaded.
            annotationImage = MGLAnnotationImage(image: image, reuseIdentifier: "test")
        }
        
        return annotationImage
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func mapView(_ mapView: MGLMapView, calloutViewFor annotation: MGLAnnotation) -> UIView? {
        // Only show callouts for `Hello world!` annotation
        if annotation.responds(to: #selector(getter: UIPreviewActionItem.title)) && annotation.title! == "Hello world!" {
            // Instantiate and return our custom callout view
            return CustomCalloutView(representedObject: annotation)
        }
        return nil
    }
    
    func mapView(_ mapView: MGLMapView, tapOnCalloutFor annotation: MGLAnnotation) {
        // Optionally handle taps on the callout
        print("Tapped the callout for: \(annotation)")
        
        // Hide the callout
        mapView.deselectAnnotation(annotation, animated: true)
    }
    
    
    //MARK*********** - Méthodes pour définir la taille de l'image et le border radius ***************
    func imageResize(imageObj:UIImage, sizeChange:CGSize)-> UIImage {
        
        let hasAlpha = false
        let scale: CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }
    
    func maskRoundedImage(image: UIImage, radius: CGFloat) -> UIImage {
        let imageView: UIImageView = UIImageView(image: image)
        var layer: CALayer = CALayer()
        layer = imageView.layer
        
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(radius)
        
        
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return roundedImage!
    }
    
}
