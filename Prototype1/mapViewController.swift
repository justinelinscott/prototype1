//
//  mapViewController.swift
//  Prototype1
//
//  Created by Carly Cameron on 6/6/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    
    var parks : [MKMapItem] = []
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        locationManager.delegate = self
        mapView.delegate = self;
        locationManager.requestWhenInUseAuthorization()
        
        
        
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//        let center = currentLocation.coordinate
//        let region = MKCoordinateRegion(center: center, span: span)
//        mapView.setRegion(region, animated: true)
//
        
        addPins()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
    }
    
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let center = location?.coordinate
        let region = MKCoordinateRegion(center: center!, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    
    func addPins() {
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 41.2577684, longitude: -96.0106565)
        annotation1.title = "Name"
        mapView.addAnnotation(annotation1)
//
//        let annotation2 = MKPointAnnotation()
//        annotation2.coordinate = CLLocationCoordinate2D(latitude: 41.2577800, longitude: -96.0106600)
//        mapView.addAnnotation(annotation2)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let alertController = UIAlertController(title: "Name of Art", message: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ninfo about art", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        let moreInfoAction = UIAlertAction(title: "Details", style: .default) { (UIAlertAction) in
            self.performSegue(withIdentifier: "pinSegue", sender: nil)
        }
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "chihuly")
        alertController.view.addSubview(imageView)
        alertController.addAction(okAction)
        alertController.addAction(moreInfoAction)
        self.present(alertController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
