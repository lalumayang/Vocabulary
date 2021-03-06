//
//  WordViewThird.swift
//  Vocabulary
//
//  Created by wendy on 2020/5/24.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import AVFoundation

struct WordViewThird: View {
    let speaker = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance {
        AVSpeechUtterance(string: word.word)
    }
    var word: Word
    init(word: Word) {
        self.word = word
        if self.speaker.isPaused {
            self.speaker.continueSpeaking()
        } else {
            self.speaker.speak(self.utterance)
        }
    }
    
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255)
            VStack{
                Spacer()
                HStack{
                    Text(word.phonetic).font(.system(size: 30))
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

struct WordViewThird_Previews: PreviewProvider {
    static var previews: some View {
        WordViewThird(word: Word(counts:3,word: "apple",mean: "蘋果",phonetic:"",example:"",define:"",chineseDef:""))
    }
}
