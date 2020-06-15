//
//  CalendarPage.swift
//  Vocabulary
//
//  Created by wendy on 2020/6/15.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI

struct CalendarPage: View {
    @State static var date = Date()
    var body: some View {
            VStack {
                Text("每日簽到")
                    .background(Color(red:223/255,green:214/255,blue:200/255))
                    .cornerRadius(5)
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                CalendarView(date: CalendarPage.$date).offset(x: 28, y: 50)
                Text("連續簽到 0 天")
                .offset(x: 0, y: -180)
                .foregroundColor(Color(red:165/255,green:153/255,blue:136/255))

        }
    }
}

struct CalendarPage_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPage()
    }
}
