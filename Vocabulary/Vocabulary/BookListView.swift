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
    let wordList: String
}

struct BookListView: View {
    let books = [
        Book(bookTitle: "TOEFL", totalWords: 500, wordList: "apple, apply"),
        Book(bookTitle: "TOEIC", totalWords: 200, wordList: "broad, blue"),
        Book(bookTitle: "GRE", totalWords: 100, wordList: "code, cry")
    ]
    var body: some View {
        NavigationView {
            List(books.indices) { (item) in
                
                NavigationLink(destination:BookDetail(book: self.books[item])){
                    BookRow(book: self.books[item])
                }
                .navigationBarTitle("教科書")
            }
        }
        .padding()
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}

struct BookRow: View {
    let book: Book
    var body: some View {
        HStack {
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
        }
    }
}

struct BookDetail: View {
    let book: Book
    var body: some View {
        VStack {
//            Image(book.bookTitle)
//                .resizable()
//                .scaledToFill()
//                .frame(height: 300)
//                .clipped()
            Text(book.wordList)
                .padding()
        }
        .navigationBarTitle(book.bookTitle)
    }
}
