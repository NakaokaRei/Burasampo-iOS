//
//  LoginView.swift
//  Burasampo-iOS
//
//  Created by 中岡黎 on 2020/11/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var buraViewModel: BuraViewModel
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Burasanpo App")
                    .font(.system(size: 48,
                                  weight: .heavy))

                VStack(spacing: 24) {
                    TextField("nickname", text: $buraViewModel.nickname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                    TextField("loginkey", text: $buraViewModel.loginkey)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                }
                .frame(height: 200)

                Button(action: {
                    self.buraViewModel.loginFlag = true
                    self.buraViewModel.request()
                },
                label: {
                    Text("Login")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                })
                    .fullScreenCover(isPresented: $buraViewModel.loginFlag,
                                                     content: HomeView.init)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
