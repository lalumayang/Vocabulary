//
//  ReviewView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/19.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ReviewView: View {
    let speaker = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance {
        AVSpeechUtterance(string: "try")
    }
    @State private var word = ""
    var body: some View {
        VStack{
            TextField("input", text: $word)
            .font(.system(size: 30))
            .multilineTextAlignment(TextAlignment.center)
//            .padding(.vertical, 50.0)
            VStack{
                Text("(v)試圖;考驗").font(.system(size: 24))
                Text("(n)設法;努力").font(.system(size: 24))
            }.padding(.top, 130.0)
            Spacer()
            HStack{
                Spacer()
                Image(systemName: "multiply.circle").font(.system(size: 30))
                Spacer()
                Button(action: {
                    if self.speaker.isPaused {
                        self.speaker.continueSpeaking()
                    } else {
                        self.speaker.speak(self.utterance)
                    }
                }) {
                    Image(systemName: "lightbulb")
                        .font(.system(size: 30))
                }
                Spacer()
                Image(systemName: "chevron.down.circle").font(.system(size: 30))
                Spacer()
            }.padding(.bottom, 80.0)
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
