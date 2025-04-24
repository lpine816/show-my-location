//
//  ContentView.swift
//  show-my-location-swift
//
//  Created by Karla Mazariego on 4/24/25.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var locationManager = CLLocationManager()

    func setUpManager(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        setUpManager( )
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context){
    }
}

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
            return
        
        VStack{
            Text("Show My Location")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            MapView()
            
            Text("Your Coordinates")
                .font(.title)
                .padding(.top, 10)
            
            HStack {
                Text("Latitude:")
                    .fontWeight(.bold)
                Text("\(coordinate.latitude)")
                    .fontWeight(.bold)
            }
            .foregroundColor(.blue)
            .padding(.top, 10)
            
            HStack{
                Text("Longitude:")
                    .fontWeight(.bold)
                Text("\(coordinate.longitude)")
                    .fontWeight(.bold)
            }
            .foregroundColor(.blue)
            .padding(.top, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
