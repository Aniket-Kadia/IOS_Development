//
//  MapViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 24/05/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var mapView: MKMapView!
    @IBOutlet weak private var btnChangeLocation: UIButton!
    
    //MARK: - Variables
    let pickerViewLocation = UIPickerView()
    let locationManager = CLLocationManager()
    let annonate = MKPointAnnotation()
    let placeCollection = PlaceInformation.getPlaceWithCoordinates()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        setDirection()
    }
}

//MARK: - Setup View
extension MapViewController {
    func setupview() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        pickerViewLocation.delegate = self
        pickerViewLocation.dataSource = self
        pickerViewLocation.center = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2)
        pickerViewLocation.isHidden = true
        view.addSubview(pickerViewLocation)
    }
}

//MARK: Set Direction
extension MapViewController {
    func setDirection() {
        let request = MKDirections.Request()
        let firstPlace = MKPlacemark(coordinate: placeCollection[Places.Home.rawValue].coordinateOfPlace)
        request.source = MKMapItem(placemark: firstPlace)
        let secondPlace = MKPlacemark(coordinate: placeCollection[Places.Simform.rawValue].coordinateOfPlace)
        request.destination = MKMapItem(placemark: secondPlace)
        
        let direction = MKDirections(request: request)
        direction.calculate { response, error in
            guard let response = response else { return }
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline)
        }
    }
}

//MARK: - IBAction Methods
extension MapViewController {
    @IBAction func tapOnChangeLocation(_ sender: UIButton) {
        pickerViewLocation.isHidden = false
        mapView.isHidden = true
    }
}

//MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        annonate.coordinate = location.coordinate
        mapView.addAnnotation(annonate)
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: CLLocationDistance(AppConstants.minimumRegionMetersValue), longitudinalMeters: CLLocationDistance(AppConstants.minimumRegionMetersValue)), animated: true)
    }
}

//MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationview = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: AppConstants.reuseIdentifier)
        annotationview.markerTintColor = .blue
        annotationview.glyphImage = UIImage.named("location")
        annotationview.glyphTintColor = .cyan
        return annotationview
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .green
        return renderer
    }
}

//MARK: - UIPickerViewDataSource
extension MapViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        AppConstants.oneComponentforPickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return placeCollection.count
    }
}

//MARK: - UIPickerViewDelegate
extension MapViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return placeCollection[row].placeName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        annonate.coordinate = placeCollection[row].coordinateOfPlace
        annonate.title = placeCollection[row].annotationTitle
        mapView.setRegion(MKCoordinateRegion(center: placeCollection[row].coordinateOfPlace, latitudinalMeters: CLLocationDistance(AppConstants.minimumRegionMetersValue), longitudinalMeters: CLLocationDistance(AppConstants.minimumRegionMetersValue)), animated: true)
        mapView.addAnnotation(annonate)
        pickerViewLocation.isHidden = true
        mapView.isHidden = false
    }
}
