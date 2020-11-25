//
//  responseModel.swift
//  Burasampo-iOS
//
//  Created by 中岡黎 on 2020/11/24.
//

import Foundation
import MapKit

struct BuraResModel: Codable {
    let message: String
    let posts: [PostModel]
    //let other_posts: [PostModel]
}

struct PostModel: Codable, Identifiable {
    let id = UUID()
    let comment: String
    let created_at: String
    let is_liked: Bool
    let like: Int
    let location_lat: Double
    let location_lng: Double
    let panel_id: Int
    let photo_url: String
    let post_id: Int
    let timestamp: Int
    let title: String
    let user_name: String
}

struct AnnotationItemStruct:Identifiable{
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
