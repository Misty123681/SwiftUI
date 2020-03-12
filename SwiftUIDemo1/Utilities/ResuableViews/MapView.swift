//
//  MapView.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 03/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    let cordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(
            latitude: cordinate.latitude, longitude: cordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}


