//
//  MapViewController.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.delegate = self
        return map
    }()
    
    var annotations: [MKAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        loadMonuments()
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.layoutMarginsGuide)
        }
    }
    
    private func loadMonuments() {
        MonumentsDatabase.sharedInstance.loadMounments { [weak self] monuments in
            guard let self = self else { return }
            
            self.mapView.removeAnnotations(self.annotations)
            self.annotations.removeAll()
            
            for monument in monuments {
                let annotation = MonumentMapAnnotation(monument: monument)
                self.annotations.append(annotation)
            }
            
            self.mapView.addAnnotations(self.annotations)
            
            self.mapView.showAnnotations(self.annotations, animated: true)
        }
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        
        let identifier = "MonumentAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "07-map-marker")
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
}
