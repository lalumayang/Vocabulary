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
    let speaker = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance {
        AVSpeechUtterance(string: "try")
    }
    var body: some View {
        ZStack{
            Color(red:44/255,green:42/255,blue:60/255)
        VStack{
            Group{
                Spacer()
                Button(action:{}){Image(systemName: "trash.fill")}
                Text("try").font(.system(size: 90)).foregroundColor(Color.white)
                HStack{
                    Text("[trai]")
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
                    Button(action:{}){
                        Text("認識")
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .background(Color(red:235/255,green:117/255,blue:0))
                            .cornerRadius(5)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }.padding(.trailing, 15)
                    Button(action:{}){
                        Text("模糊")
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .background(Color(red:235/255,green:117/255,blue:0))
                            .cornerRadius(5)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }

                    Button(action:{}){
                        Text("不認識")
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .background(Color(red:235/255,green:117/255,blue:0))
                            .cornerRadius(5)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }.padding(.leading, 15)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    .edgesIgnoringSafeArea(.all)
    }
}

struct WordViewFirst_Previews: PreviewProvider {
    static var previews: some View {
        WordViewFirst()
    }
}
