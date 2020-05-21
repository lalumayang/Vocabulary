//
//  WordView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/19.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import AVFoundation

struct WordView: View {
    let speaker = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance {
        AVSpeechUtterance(string: "to attempt to do something")
    }
    var body: some View {
       VStack{
            Button(action:{}){Image(systemName: "speaker.2.fill")}
            Group{
                Text("try").font(.custom("Snell Roundhand", size: 30)) .fontWeight(.heavy)
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
                Text("to attempt to do something")
                Text("(v)試圖;考驗")
                Text("(n)設法;努力")
                Text("Example:")
                Text("Keep trying and you'll find a job eventually.")
                Text("不斷努力，你最終會找到工作的。")
                HStack{
                    Button("認識"){}
                    Button("模糊"){}
                    Button("不認識"){}
                    Button(action:{}){Image(systemName: "trash.fill")}
                }
                Button(action:{}){Image(systemName: "plus.circle.fill")}
            }
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
