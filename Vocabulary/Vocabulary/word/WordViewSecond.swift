//
//  WordViewSecond.swift
//  Vocabulary
//
//  Created by wendy on 2020/5/23.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import AVFoundation

struct WordViewSecond: View {
    let speaker = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance {
        AVSpeechUtterance(string: word.word)
    }
    var word: Word
    
    init(word: Word) {
        self.word = word
    }
    
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255)
            VStack{
                Spacer()
                Group{
                    Text(word.word).font(.system(size: 60))
                    HStack{
                        Text("/ bәˋnænә /")
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
                    .padding(.bottom, 10.0)
                    
                    Text("(n)香蕉")
                        .padding(.bottom, 10.0)
                    Text("The tropical and subtropical palmlike plant that bears bananas, having very large leaves but lacking a woody trunk.")
                        .padding(.bottom, 10.0)
                    Text("Example:")
                    Text("The banana bears two crops every year .")
                    Text("香蕉一年收成兩噸。")

                }
//                .foregroundColor(Color.white)
                NavigationLink(destination: WordView()) {
                    Text("好")
                        .font(.system(size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 180, height: 50)
                        .background(Color(red:141/255,green:91/255,blue:70/255))
                        .cornerRadius(40)
                        .padding(5)
                }.navigationBarTitle("")
//                    .navigationBarHidden(true)
                    .padding(.top, 50.0)
                
                
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

struct WordViewSecond_Previews: PreviewProvider {
    static var previews: some View {
        WordViewSecond(word: Word(counts:2,word: "apple",mean: "蘋果",phonetic:"",example:"",define:"",chineseDef:""))
    }
}
