import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var selectedAnnotation: MKPointAnnotation?
    
    var mapView = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        
        let gestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.didTapView))

        mapView.addGestureRecognizer(gestureRecognizer)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(self)
    }
    
    func onCoordinateSelected(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        if let lastAnnotation = selectedAnnotation {
            mapView.removeAnnotation(lastAnnotation)
        }
        
        mapView.addAnnotations([annotation])
        selectedAnnotation = annotation
    }
    
    class MapCoordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        private var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        @objc func didTapView(_ sender: UITapGestureRecognizer) {
            let location = sender.location(in: parent.mapView)
            let coordinate = parent.mapView.convert(location, toCoordinateFrom: parent.mapView)

            self.parent.onCoordinateSelected(coordinate: coordinate)
        }
    }
}
