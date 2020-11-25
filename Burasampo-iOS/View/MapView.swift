//
//  MapView.swift
//  Burasampo-iOS
//
//  Created by 中岡黎 on 2020/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var annotationItems: [AnnotationItemStruct] = []
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.655164046, longitude: 139.740663704), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        var body: some View {
            Map(coordinateRegion: $region, annotationItems: annotationItems) { annotationItem in
                MapPin(coordinate: annotationItem.coordinate)
            }
                .edgesIgnoringSafeArea(.all)
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
