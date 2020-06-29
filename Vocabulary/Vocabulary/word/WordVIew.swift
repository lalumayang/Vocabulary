//
//  WordVIew.swift
//  Vocabulary
//
//  Created by wendy on 2020/6/29.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//


import SwiftUI

struct WordView: View {
    @State var words = [Word(counts: 1,word: "banana", mean: "(n)香蕉",phonetic:"/ bәˋnænә /",example: "The banana bears two crops every year .",define: "The tropical and subtropical palmlike plant that bears bananas, having very large leaves but lacking a woody trunk.",chineseDef: "香蕉一年收成兩噸。"),Word(counts: 2,word: "banana", mean: "(n)香蕉",phonetic:"/ bәˋnænә /",example: "The banana bears two crops every year .",define: "The tropical and subtropical palmlike plant that bears bananas, having very large leaves but lacking a woody trunk.",chineseDef: "香蕉一年收成兩噸。"),Word(counts: 3,word: "banana", mean: "(n)香蕉",phonetic:"/ bәˋnænә /",example: "The banana bears two crops every year .",define: "The tropical and subtropical palmlike plant that bears bananas, having very large leaves but lacking a woody trunk.",chineseDef: "香蕉一年收成兩噸。"),Word(counts: 4,word: "banana", mean: "(n)香蕉",phonetic:"/ bәˋnænә /",example: "The banana bears two crops every year .",define: "The tropical and subtropical palmlike plant that bears bananas, having very large leaves but lacking a woody trunk.",chineseDef: "香蕉一年收成兩噸。")]
    @State var wordMeta = [WordMeta]()
    func getWordDetail(word: Word) {
        if let url = URL(string: "https://api.dictionaryapi.dev/api/v1/entries/en/\(word.word)") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let dog = try JSONDecoder().decode([WordMeta].self, from: data)
                        self.wordMeta = dog
                        print(self.wordMeta)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
    }

    var body: some View {
        var word = words.randomElement()
        getWordDetail(word: word ?? Word(counts: 0,word: "", mean: "",phonetic: "",example:"",define:"",chineseDef:""))
        return ZStack{
            if (word?.counts == 1){
                WordViewFirst(word: word!)
            }
            else if (word?.counts == 2){
                WordViewSecond(word: word!)
            }
            else if (word?.counts == 3){
                WordViewThird(word: word!)
            }
            else if(word?.counts == 4){
                WordViewForth(word: word!)
            }
            
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
