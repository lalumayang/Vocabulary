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
        AVSpeechUtterance(string: "to attempt to do something")
    }
    var body: some View {
        ZStack{
            Color(red:44/255,green:42/255,blue:60/255)
            VStack{
                Button(action:{}){Image(systemName: "speaker.2.fill")}
                Group{
                    Text("try").font(.system(size: 60))
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

                }                        .foregroundColor(Color.white)
                Button(action:{}){
                    Text("好")
                }
                .padding(.top, 80.0)

            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WordViewSecond_Previews: PreviewProvider {
    static var previews: some View {
        WordViewSecond()
    }
}
