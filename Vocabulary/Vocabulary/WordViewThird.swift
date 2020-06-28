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
        print("third")
    }
    
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255)
            VStack{
                HStack{
                    Text("[trai]").font(.system(size: 30))
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
                Button(action:{}){
                    Text("(1) 嘗試")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }.padding(.bottom, 15.0)
                Button(action:{}){
                    Text("(2) 認識")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }.padding(.bottom, 15.0)
                Button(action:{}){
                    Text("(3) 放棄")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }.padding(.bottom, 15.0)
                Button(action:{}){
                    Text("(4) 品嚐")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red:236/255,green:108/255,blue:75/255))
                        .cornerRadius(5)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }.padding(.bottom, 15.0)
                
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WordViewThird_Previews: PreviewProvider {
    static var previews: some View {
        WordViewThird(word: Word(counts:3,word: "apple",mean: "蘋果"))
    }
}
