//
//  CustomMapView.swift
//  MapLottieThree
//
//  Created by labadmin on 22/03/23.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    var body: some View {
        DisplayMap()
    }
}
private struct DisplayMap: View {
    let locationManager = CLLocationManager()
    
    @ObservedObject var mapManger = MapViewManager()
    
    var body: some View {
        Map(coordinateRegion: $mapManger.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .frame(width: 400, height: 900)
            .onAppear {
                mapManger.checkForLocationManagerPermission()
            }
    }
}

class MapViewManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 45.4654219, longitude: 9.1859243), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var locationManager: CLLocationManager?
    
    func checkForLocationManagerPermission() {
        if(CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        }
        else{
            print("Avvisa l'utente di attivare i servizi")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
        case .notDetermined:
            print("No auth")
        case .restricted:
            print("No auth")
        case .denied:
            print("No auth")
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        @unknown default:
            print("No auth")
        }
    }
    
}

struct CustomMapView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapView()
    }
}
