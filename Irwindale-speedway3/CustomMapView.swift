import SwiftUI
import MapKit

struct CustomMapConfiguration {
    let uuid: UUID
    let cameraPosition: MKMapCamera
    let showsUserLocation: Bool
    let annotations: [IrwindaleLocation]
}

struct CustomMapView: UIViewRepresentable {
    var configuration: CustomMapConfiguration
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.camera = configuration.cameraPosition
        uiView.showsUserLocation = configuration.showsUserLocation
        
        uiView.mapType = .satelliteFlyover
        
        uiView.removeAnnotations(uiView.annotations)
        for annotation in configuration.annotations {
            let annot = MKPointAnnotation()
            annot.coordinate = CLLocationCoordinate2D(latitude: annotation.lon, longitude: annotation.lat)
            annot.title = annotation.name
            uiView.addAnnotation(annot)
        }
    }
    
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        // Coordinator class to handle delegate methods
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: CustomMapView
            
        init(_ parent: CustomMapView) {
            self.parent = parent
        }
            

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation {
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                let camera = MKMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 300, pitch: 45, heading: 294)
                mapView.setRegion(region, animated: true)
                mapView.setCamera(camera, animated: true)
            }
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !(annotation is MKUserLocation) else { return nil } // Return nil for user's location annotation
            
            let identifier = "CustomAnnotationView"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true // Enable callout
                let button = UIButton(type: .detailDisclosure)
                annotationView!.rightCalloutAccessoryView = button // Add accessory button to callout
            } else {
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    func checkIfLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            checkLocationAuth()
        }
    }
    
    private func checkLocationAuth() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted.")
        case .denied:
            print("You have denied access to your location.")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
}
