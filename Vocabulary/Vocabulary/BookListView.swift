//
//  BookListView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/19.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI

struct Book {
    let bookTitle: String
    let totalWords: Int
    var wordList: [String]
}

struct BookListView: View {
    var books = [
        Book(bookTitle: "TOEFL", totalWords: 500, wordList: ["abandon", "abbreviation","ability","able","above","abuse","absent","absolute","abuse","accept","access","accident","accommodate","accommodation","accompany","accomplish","account","accumulate","accurate","achieve"]),
        Book(bookTitle: "TOEIC", totalWords: 200, wordList: ["broad", "blue"]),
        Book(bookTitle: "GRE", totalWords: 100, wordList: ["code", "cry"])
    ]
    var body: some View {
        ZStack{
            //            Color(red: 48/255, green: 62/255, blue: 67/255).edgesIgnoringSafeArea(.all)
            NavigationView {
                List(books.indices) {
                    (item) in NavigationLink(destination:BookDetail(book: self.books[item])){
                        BookRow(book: self.books[item])
                    }
                    .navigationBarTitle("書庫")
                    //                    .navigationViewStyle(StackNavigationViewStyle())
                }
            }
            .padding()
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}

struct BookRow: View {
    let book: Book
    @State var isMarked:Bool = false
    @State var isDownload: Bool = false
    var body: some View {
        HStack {
            Image(systemName: self.isMarked ? "checkmark.square" : "square")
                .onTapGesture {
                    self.isMarked.toggle()
                    print("isMarked:\(self.isMarked)")
            }
            Image(book.bookTitle)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(book.bookTitle)
                Text("單字量：\(String(book.totalWords))")
            }
            Spacer()
            Image(systemName:self.isDownload ? "" : "icloud.and.arrow.down").onTapGesture {
                self.isDownload.toggle()
                print("isDownload:\(self.isDownload)")
                //TODO:download the book vocabulary in database
            }
        }
    }
}

struct BookDetail: View {
    var book: Book
    var body: some View {
        //        ZStack {
        //            Color(red: 48/255, green: 62/255, blue: 67/255).edgesIgnoringSafeArea(.all)
        VStack{
            //                List(book.wordList.indices) {word in
            //                    Text(self.book.wordList[word])
            //                    .font(.system(size: 20))
            //                }
            
            List {
                ForEach(book.wordList, id: \.self) {
                    Text("\($0)").font(.system(size: 22))
                }
                .onDelete(perform: deleteItem)
            }
        }
            //        .navigationBarItems(leading: EditButton())
            .navigationBarTitle(book.bookTitle)
    }
    
    
    private func deleteItem(at indexSet: IndexSet) {
        //TODO:deleteItem
        
        print("delete:\(indexSet)")
        //        book.wordList.remove(atOffsets: IndexSet)
    }
}

