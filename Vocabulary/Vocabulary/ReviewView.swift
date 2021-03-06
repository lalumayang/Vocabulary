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
        AVSpeechUtterance(string: "\(words[index].word)")
    }
    @State var isActive = false
    @State private var finish = 0
    @State private var index = 0
    @State private var input = ""
    @State var words = [
        Word(counts:1,word: "apple", mean: "(n)蘋果",phonetic:"",example:"",define:"",chineseDef:""),
        Word(counts:1,word: "banana", mean: "(n)香蕉",phonetic:"",example:"",define:"",chineseDef:""),
        Word(counts:1,word: "cat", mean: "(n)貓咪",phonetic:"",example:"",define:"",chineseDef:"")
    ]
    let finishView = FinishView()
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255).edgesIgnoringSafeArea(.all)
            VStack{
                TextField("Input", text: $input)
                    .font(.system(size: 30))
                    .multilineTextAlignment(TextAlignment.center)
                    .foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                    .padding(.all)
                VStack{
                    if(self.words.count>0){
                        Text(words[index].mean).font(.system(size: 24))
                            .foregroundColor(Color(red:141/255,green:91/255,blue:70/255))}
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
                        if self.index < self.words.count{
                            if(self.input.lowercased() as AnyObject === self.words[self.index].word.lowercased() as AnyObject){
                                print("good")
                                self.words.remove(at: self.index)
                                print(self.words)
                                print(self.words.count)
                                if(self.words.count == 0){
                                    self.isActive=true
                                }
                            }
                            else{
                                print("bad")
                                self.index = self.index + 1
                                print(self.words)
                                print(self.words.count)
                            }
                            self.input = ""
                        }
                        self.index = 0
                    }) {
                        Image(systemName: "chevron.down.circle").font(.system(size: 30))
                    }.foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                    Spacer()
                }.padding(.bottom, 80.0)
                
                NavigationLink(destination: FinishView(), isActive: $isActive){Text("")}
            }
        }
    }
}

