//
//  FinishView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/6/28.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255).edgesIgnoringSafeArea(.all)
            VStack{
                Text("🥳")//👏🏻👍🏻
                    .padding(.bottom, 30.0)
                    .font(.system(size: 80))
                Text("完成複習")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                    .padding(.bottom, 200.0)
                NavigationLink(destination: ContentView()) {
                    Text("回首頁")
                        .font(.system(size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 180, height: 50)
                        .background(Color(red:141/255,green:91/255,blue:70/255))
                        .cornerRadius(40)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red:141/255,green:91/255,blue:70/255), lineWidth: 3)
                            
                    )
                }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .padding(.top, 50.0)
            }
        }
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
