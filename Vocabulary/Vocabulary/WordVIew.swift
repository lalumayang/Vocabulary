//
//  WordVIew.swift
//  Vocabulary
//
//  Created by wendy on 2020/6/29.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//


import SwiftUI

struct WordView: View {
    @State var words = [Word(counts: 1,word: "apple", mean: "蘋果"),Word(counts: 2,word: "banana", mean: "香蕉"),Word(counts: 3,word: "cat", mean: "貓咪")]
    var body: some View {
        let word = words.randomElement()
        print(word!.counts)
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
