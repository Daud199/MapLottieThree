//
//  ContentView.swift
//  MapLottieThree
//
//  Created by labadmin on 22/03/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 45.4654219, longitude: 9.1859243), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [.zoom, .pan])
            .frame(width: 400, height: 900)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
