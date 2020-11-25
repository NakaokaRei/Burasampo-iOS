//
//  RowView.swift
//  Burasampo-iOS
//
//  Created by 中岡黎 on 2020/11/24.
//

import SwiftUI

struct RowView: View {
    var post: PostModel
    var body: some View {
        HStack {
            URLImage(url: "https://psf-ikoma-burasampo-datastore.s3-ap-northeast-1.amazonaws.com/public/posts/photos/original/" + post.photo_url)
            Text(post.title)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(post: PostModel(comment: "", created_at: "", is_liked: true, like: 1, location_lat: 1.1, location_lng: 1.1, panel_id: 1, photo_url: "", post_id: 1, timestamp: 1, title: "title", user_name: ""))
    }
}
