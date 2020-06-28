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
        print("second")
    }
    
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255)
            VStack{
                Group{
                    Text(word.word).font(.system(size: 60))
                    HStack{
                        Text("[trai]")
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
                    
                    Text("(v)試圖;考驗")
                    Text("(n)設法;努力")
                        .padding(.bottom, 10.0)
                    Text("to attempt to do something")
                        .padding(.bottom, 10.0)
                    Text("Example:")
                    Text("Keep trying and you'll find a job eventually.")
                    Text("不斷努力，你最終會找到工作的。")

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

            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WordViewSecond_Previews: PreviewProvider {
    static var previews: some View {
        WordViewSecond(word: Word(counts:2,word: "apple",mean: "蘋果"))
    }
}
