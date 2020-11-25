//
//  URLImage.swift
//  Burasampo-iOS
//
//  Created by 中岡黎 on 2020/11/24.
//

import SwiftUI

struct URLImage: View {

    let url: String
    @ObservedObject private var imageDownloader = ImageDownloader()

    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }

    var body: some View {
        if let imageData = self.imageDownloader.downloadData {
            let img = UIImage(data: imageData)
            return VStack {
                Image(uiImage: img!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        } else {
            return VStack {
                Image(systemName: "icloud.and.arrow.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://i.gzn.jp/img/2018/01/15/google-gorilla-ban/00.jpg")
    }
}
