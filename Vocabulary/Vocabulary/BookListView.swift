//
//  BookListView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/19.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct Book {
    let bookTitle: String
    let totalWords: Int
    var wordList: [String]
}

struct BookListView: View {
    //    func aaa()->String{
    //        var ref: DatabaseReference!
    //        ref = Database.database().reference()
    //        return "Ans"
    //    }
    
    var ref: DatabaseReference = Database.database().reference()
    
    @Environment(\.presentationMode) var presentation
    @State var books = [
        Book(bookTitle: "TOEFL", totalWords: 500, wordList: ["abandon", "abbreviation","ability","able","above","abuse","absent","absolute","abuse","accept","access","accident","accommodate","accommodation","accompany","accomplish","account","accumulate","accurate","achieve"]),
        Book(bookTitle: "TOEIC", totalWords: 200, wordList: ["broad", "blue"]),
        Book(bookTitle: "GRE", totalWords: 100, wordList: ["code", "cry"])
    ]
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        //        UITableView.appearance().separatorStyle = .none//不要row分隔线
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().tintColor = UIColor(red:141/255,green:91/255,blue:70/255,alpha: 255/255)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red:141/255,green:91/255,blue:70/255,alpha: 255/255)]
    }
    
    var body: some View {
        NavigationView {
            VStack{
                //                Text(aaa())
                //                Button(action: {
                //                    self.ref.child("vocabulary-50f3c").child("items")
                //                        .observeSingleEvent(of: .value, with: { (snapshot) in
                //
                //                            let value = snapshot.value as? NSDictionary
                //
                //                            var hp = 0
                //                            let number : NSNumber? = value?["totalWords"] as? NSNumber
                //                            if let integerValue = number?.intValue {
                //                                hp = integerValue
                //                            }
                //
                //                            print("hp:\(hp)")
                //                        }) { (error) in
                //                            print(error.localizedDescription)
                //                    }
                //                self.ref.child("vocabulary-50f3c").child("items").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                //                  let value = snapshot.value as? NSDictionary
                //                  let username = value?["bookTitle"] as? String ?? ""
                //                  let user = User(username: username)
                //                    print("username:\(username)")
                //
                // ...
                //                  }) { (error) in
                //                    print(error.localizedDescription)
                //                }
                //                }) {
                //                    Text("print")
                //                }
                
                
                List(books.indices) {
                    (item) in NavigationLink(destination:BookDetail(book: self.books[item])){
                        BookRow(book: self.books[item])
                    }
                    .navigationBarTitle("書庫")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button("Back"){
                        self.presentation.wrappedValue.dismiss()
                    })
                }.background(Color(red:219/255,green:211/255,blue:188/255).edgesIgnoringSafeArea(.all))
            }.padding()
                .background(Color(red:219/255,green:211/255,blue:188/255).edgesIgnoringSafeArea(.all))
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}

struct BookRow: View {
    var book: Book
    @State var isMarked:Bool = false
    @State var isDownload: Bool = false
    var body: some View {
        HStack {
            Image(systemName: self.isMarked ? "checkmark.square" : "square")
                .onTapGesture {
                    self.isMarked.toggle()
                    print("isMarked:\(self.isMarked)")
            }.foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
            Image(book.bookTitle)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(book.bookTitle).foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                    .fontWeight(.bold)
                Text("單字量：\(String(book.totalWords))").foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                    .fontWeight(.bold)
            }
            Spacer()
            Image(systemName:self.isDownload ? "" : "icloud.and.arrow.down").onTapGesture {
                self.isDownload.toggle()
                print("isDownload:\(self.isDownload)")
                //TODO:download the book vocabulary in database
            }.foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
        }
    }
}

struct BookDetail: View {
    var book: Book
    var body: some View {
        ZStack{
            
            List {
                ForEach(book.wordList, id: \.self) {
                    Text("\($0)")
                        .font(.system(size: 22))
                        .foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                        .listRowBackground(Color(red:219/255,green:211/255,blue:188/255))
                }
                .onDelete(perform: deleteItem)
            }
        }.padding(.horizontal, 25.0)
            //                    .navigationBarItems(leading: EditButton())
            .navigationBarTitle(Text("\(book.bookTitle)"),displayMode: .inline)//,displayMode: .inline
            .background(Color(red:219/255,green:211/255,blue:188/255).edgesIgnoringSafeArea(.all))
    }
    func deleteItem(at offsets: IndexSet) {
        print(book.wordList)
        print(offsets)
        //        TODO:deleteItem
        //        book.wordList.remove(atOffsets: offsets)
        //            print("delete:\(offsets)")
        
    }
}


