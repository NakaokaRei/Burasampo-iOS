//
//  BuraViewModel.swift
//  Burasampo-iOS
//
//  Created by 中岡黎 on 2020/11/24.
//

import Foundation
import Alamofire

class BuraViewModel: ObservableObject {
    @Published var nickname: String = "Rei"
    @Published var loginkey: String = "orz2"
    @Published var loginFlag: Bool = false
    @Published var postList: [PostModel] = []

    func request() {
        let url = "https://app.ikoma.burasampo.jp/api/naist/"
        //let headers: HTTPHeaders = ["Contenttype": "application/json"]
        let parameters:[String: String] = [
            "nickname": nickname,
            "loginkey": loginkey
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            guard let data = response.data else { return }
            let buraRes: BuraResModel = try! JSONDecoder().decode(BuraResModel.self, from: data)
            self.postList = buraRes.posts
            print(self.postList)
        }
    }
    
    func logOut() {
        loginFlag = false
    }
}
