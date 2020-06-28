//
//  ReviewView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/19.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import AVFoundation

struct Word {
    let word: String
    let mean: String
}

struct ReviewView: View {
    let speaker = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance {
        AVSpeechUtterance(string: "\(words[index].word)")
    }
    @State private var finish = 0
    @State private var index = 0
    @State private var input = ""
    @State var words = [
        Word(word: "Try", mean: "試圖;考驗"),
        Word(word: "Toeic", mean: "多益"),
        Word(word: "Play", mean: "玩")
    ]
    //    @State var allWords = words.copy()
    var body: some View {
//        NavigationView {
            ZStack{
                Color(red:219/255,green:211/255,blue:188/255).edgesIgnoringSafeArea(.all)
                VStack{
                    TextField("Input", text: $input)
                        .font(.system(size: 30))
                        .multilineTextAlignment(TextAlignment.center)
                        .foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                        .padding(.all)
                    VStack{
                        Text(words[index].mean).font(.system(size: 24))
                            .foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                    }.padding(.top, 130.0)
                    
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            self.input = ""
                        }) {
                            Image(systemName: "multiply.circle").font(.system(size: 30))
                        }.foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
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
                        }.colorInvert()
                        Spacer()
                        Button(action: {
                            if self.index < self.words.count-1{
                                print(self.words.count)
                                if(self.input.lowercased() as AnyObject === self.words[self.index].word.lowercased() as AnyObject){
                                    print("good")
                                    //                                self.words.removeFirst()
                                    self.words.remove(at: self.index)
                                    print(self.words)
                                }
                                else{
                                    print("bad")
                                    self.index = self.index + 1
                                    print(self.words)
                                }
                                //                            self.index = self.index + 1
                                //                            self.index = 0
                                self.input = ""
                            }
                            else{
                                self.finish = 1
                                //
                                print("else")
                                self.input = ""
                                self.words.remove(at: self.index)
                                //                            self.words.remove(at: self.index)
                                self.index = 0
                            }
                            self.index = 0
                        }) {
                            Image(systemName: "chevron.down.circle").font(.system(size: 30))
                        }.foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                        Spacer()
                        if(self.finish == 1){
                            NavigationLink("", destination: FinishView())
                        }
                    }.padding(.bottom, 80.0)
                }
            }
//        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
