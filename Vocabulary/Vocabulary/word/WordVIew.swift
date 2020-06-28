//
//  WordVIew.swift
//  Vocabulary
//
//  Created by wendy on 2020/6/29.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//


import SwiftUI

struct WordView: View {
    @State var words = [Word(counts: 1,word: "apple", mean: "蘋果",phonetic:""),Word(counts: 2,word: "banana", mean: "香蕉",phonetic:""),Word(counts: 3,word: "cat", mean: "貓咪",phonetic:"")]
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
        getWordDetail(word: word ?? Word(counts: 0,word: "", mean: "",phonetic: ""))
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
            
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
