//
//  RestaurantMapView.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/4/23.
//

import SwiftUI
import MapKit

struct RestaurantMapView: View {
	
	let restaurantCoordinate: CLLocationCoordinate2D
	
	var body: some View {
		Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: restaurantCoordinate, latitudinalMeters: 400, longitudinalMeters: 400))) {
			Marker("강강술래 늘봄농원점", coordinate: restaurantCoordinate)
		}
	}
}

#Preview {
	RestaurantMapView(restaurantCoordinate: CLLocationCoordinate2D(latitude: 37.6877324, longitude: 126.9013021))
		.padding()
		.clipShape(.rect(cornerRadius: 50))
		.frame(height: 200)
}
