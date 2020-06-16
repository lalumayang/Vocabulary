//
//  SettingView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/21.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import UserNotifications

struct SettingView: View {
    var words = ["10", "15", "20", "25", "30"]
    @State private var isReminder: Bool = false
    @State private var selectedIndex = 0
    @State private var dateTime = Date()
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }()
    var body: some View {
        ZStack{
            Color(red:219/255,green:211/255,blue:188/255).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 30){
                
                //固定時間發送提醒通知
                VStack {
                    Toggle(isOn: $isReminder){
                        Text("開啟通知：")
                            .font(Font.system(size: 20))
                            .foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                        if(isReminder){
                            Text("\(self.isNotifaction())")
                        }
                    }.padding(.trailing, 200.0)
                }
                
                HStack{
                    if(isReminder){
                        Text("提醒時間：").font(Font.system(size: 20)).foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                        Spacer()
                        DatePicker("提醒時間：", selection: $dateTime, displayedComponents: .hourAndMinute)
                            .frame(width: 250, height: 45)
                            .clipped()
                            .accentColor(Color(red:141/255,green:91/255,blue:70/255))
                    }
                }
                //                Text("\(dateFormatter.string(from: Date()))").foregroundColor(Color.white)
                //                Text(dateFormatter.string(from: dateTime)).foregroundColor(Color.white)
                //                Text("\(dateTime)")
                HStack{
                    Text("每組學習單字量：").font(Font.system(size: 20)).foregroundColor(Color(red:141/255,green:91/255,blue:70/255))
                    Picker(selection: $selectedIndex, label: Text("每組學習單字量：")) {
                        ForEach(0..<words.count) { (index) in
                            Text(self.words[index])
                        }
                    }.labelsHidden()
                        .frame(width: 150, height: 45)
                        .clipped()
                        .accentColor(Color(red:141/255,green:91/255,blue:70/255))
                }
                //                Text(words[selectedIndex]).foregroundColor(Color.white)
            }
            .padding(.top, -350.0)
            .padding(.leading, 30.0)
        }
    }
    func isNotifaction() -> String{
        print("isNotifaction")
        isReminder = true
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        let content = UNMutableNotificationContent()
        content.title = "懶人單字"
        content.subtitle = "該背單字咯！"
        content.sound = UNNotificationSound.default
        let triggerDaily = Calendar.current.dateComponents([. hour,. minute], from: self.dateTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        //        dateComponents.hour = 13
        //        dateComponents.minute = 44
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        return ""
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
