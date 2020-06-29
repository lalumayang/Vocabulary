//
//  WordView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/19.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import AVFoundation


struct WordViewFirst: View {
    var word: Word
    let speaker = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance {
        AVSpeechUtterance(string: word.word)
    }
    @State private var showSecondView = false
    
    init(word: Word) {
        self.word = word
    }
    var body: some View {
        
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255)
            VStack{
                Group{
                    Spacer()
                    //                Button(action:{}){Image(systemName: "trash.fill")}
                    Text(word.word).font(.system(size: 90)).foregroundColor(Color.white)
                    HStack{
                        Text(word.phonetic)
                            .font(.system(size: 26))
                            .foregroundColor(Color.white)
                        Button(action: {
                            if self.speaker.isPaused {
                                self.speaker.continueSpeaking()
                            } else {
                                self.speaker.speak(self.utterance)
                            }
                        }) {
                            Image(systemName: "speaker.2.fill")
                        }
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: WordView()) {
                            Text("認識")
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                                .background(Color(red:141/255,green:91/255,blue:70/255))
                                .cornerRadius(5)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            
                        }.navigationBarTitle("")
                        
                        NavigationLink(destination: WordView()) {
                            
                            Text("不認識")
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                                .background(Color(red:141/255,green:91/255,blue:70/255))
                                .cornerRadius(5)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            
                        }.navigationBarTitle("")
                        //                    .navigationBarHidden(true)
                        
                        Spacer()
                    }
                    
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                    }.navigationBarTitle("")
                        .navigationBarHidden(true)
                        .padding(.top, 50.0)
                    Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WordViewFirst_Previews: PreviewProvider {
    static var previews: some View {
        WordViewFirst(word: Word(counts:1,word: "apple",mean: "蘋果",phonetic:"",example:"",define:"",chineseDef:""))
    }
}
