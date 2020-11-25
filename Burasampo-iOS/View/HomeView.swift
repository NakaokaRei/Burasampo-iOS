//
//  HomeView.swift
//  Burasampo-iOS
//
//  Created by 中岡黎 on 2020/11/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @EnvironmentObject var buraViewModel: BuraViewModel
    var body: some View {
        NavigationView {
            List(buraViewModel.postList) { post in
                let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: post.location_lat, longitude: post.location_lng), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                let anotation: [AnnotationItemStruct] = [AnnotationItemStruct(coordinate: CLLocationCoordinate2D(latitude: post.location_lat, longitude: post.location_lng))]
                NavigationLink(destination: MapView(annotationItems: anotation, region: region)) {
                    RowView(post: post)
                }
            }
                .navigationBarTitle("Burasanpo", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        self.buraViewModel.logOut()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left.circle")
                            Text("Go Back")
                        }
                })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(BuraViewModel())
    }
}
