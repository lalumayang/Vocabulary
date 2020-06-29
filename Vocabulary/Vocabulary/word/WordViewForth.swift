//
//  WordViewThird.swift
//  Vocabulary
//
//  Created by wendy on 2020/5/24.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI

struct WordViewForth: View {
    var word: Word
    init(word: Word) {
        self.word = word
    }
    
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255)
            VStack{
                Spacer()
                HStack{
                    Text(word.word).font(.system(size: 50))
                }
                .padding(.bottom, 30.0)
                //                .foregroundColor(Color.white)
                
                NavigationLink(destination: WordView()) {
                    Text("(1) 帽子")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }.navigationBarTitle("").padding(.bottom, 15.0)
                NavigationLink(destination: WordView()) {
                    Text("(2) 香蕉")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }.navigationBarTitle("").padding(.bottom, 15.0)
                NavigationLink(destination: WordView()) {
                    Text("(3) 柴犬")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }.navigationBarTitle("").padding(.bottom, 15.0)
                NavigationLink(destination: WordView()) {
                    Text("(4) 飛鏢")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }.navigationBarTitle("").padding(.bottom, 15.0)
                
                
                
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "house")
                        .foregroundColor(Color.white)
                }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .padding(.top, 50.0)
                Spacer()
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
