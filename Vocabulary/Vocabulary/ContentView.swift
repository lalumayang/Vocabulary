//
//  ContentView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/16.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var currentDate = Date()
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MM/dd")
        return formatter
    }()
    var body: some View {
        NavigationView {
            ZStack {
                Image("sea")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 35){
                    NavigationLink(destination: SettingView()) {
                        Image(systemName: "gear").font(Font.system(size: 35, weight: .heavy))
                            .foregroundColor(.white)
                            .padding(.leading, 240.0)
                            .padding(.top, -20.0)
                    }
                    Spacer()
//                    NavigationLink(destination: FinishView()) {Text("sfs")}
                    NavigationLink(destination: CalendarPage()) {
                        VStack {
                            Text("簽到").font(.custom("YuppyTC-Regular", size: 25))
                            Text(" \(currentDate, formatter: Self.dateFormat)").font(.custom("YuppyTC-Regular", size: 25))
                        }
                        .foregroundColor(.white)
                        .padding(25.0)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                    }
                    Spacer()
                    NavigationLink(destination: WordView()) {
                        Text("Learn").fontWeight(.bold)
                            .font(.system(size: 30))
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .frame(width: 180.0, height: 40.0)
                            .font(.title)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    NavigationLink(destination: ReviewView()) {
                        Text("Review").fontWeight(.bold)
                            .font(.system(size: 30))
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .frame(width: 180.0, height: 40.0)
                            .font(.title)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    //Spacer()
                    NavigationLink(destination: BookListView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    ) {
                            Image(systemName: "book.fill").font(Font.system(size: 35, weight: .heavy))
                                .foregroundColor(.white)
                                .padding(.leading, 240.0)
                                .padding(.vertical, 50.0)
                    }
                }
            }
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
#endif


//模糊用法
//呼叫方式：BlurView(style: .light)
//struct BlurView: UIViewRepresentable {
//    let style: UIBlurEffect.Style
//    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
//        let view = UIView(frame: .zero)
//        view.backgroundColor = .clear
//        let blurEffect = UIBlurEffect(style: style)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.translatesAutoresizingMaskIntoConstraints = false
//        view.insertSubview(blurView, at: 0)
//        NSLayoutConstraint.activate([
//            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
//        ])
//        return view
//    }
//    func updateUIView(_ uiView: UIView,
//                      context: UIViewRepresentableContext<BlurView>) {
//    }
//}
