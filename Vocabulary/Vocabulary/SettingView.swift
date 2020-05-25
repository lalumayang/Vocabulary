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
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
    var body: some View {
        ZStack{
            Color(red:44/255,green:42/255,blue:60/255).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 30){
                
                
                //固定時間發送提醒通知
                VStack {
                    Toggle(isOn: $isReminder){
                        Text("開啟通知：")
                            .font(Font.system(size: 20))
                            .foregroundColor(Color.white)
                    }.padding(.trailing, 200.0)
                    
//                    Button("start"){
//                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                            if success {
//                                print("All set!")
//                            } else if let error = error {
//                                print(error.localizedDescription)
//                            }
//                        }
//                    }
                    
//                    Button("Schedule Notification") {
//                        var dateComponents = DateComponents()
//                        dateComponents.calendar = Calendar.current
//
//                        dateComponents.hour = 11
//                        dateComponents.minute = 51
//
//                        let content = UNMutableNotificationContent()
//                        content.title = "懶人單字"
//                        content.subtitle = "該背單字咯！"
//                        content.sound = UNNotificationSound.default
//
//                        // show this notification five seconds from now
//                        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//                        //                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//                        // choose a random identifier
//                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//                        // add our notification request
//                        UNUserNotificationCenter.current().add(request)
//                    }
                    
                }
                
                
                
                
                
                HStack{
                    Text("提醒時間：").font(Font.system(size: 20)).foregroundColor(Color.white)
                    Spacer()
                    DatePicker("提醒時間：", selection: $dateTime, displayedComponents: .hourAndMinute)
                        .frame(width: 250, height: 45)
                        .colorInvert()
                        .clipped()
                }
                //                Text("\(dateFormatter.string(from: Date()))").foregroundColor(Color.white)
                //                Text(dateFormatter.string(from: dateTime)).foregroundColor(Color.white)
                
                HStack{
                    Text("每組學習單字量：").font(Font.system(size: 20)).foregroundColor(Color.white)
                    Picker(selection: $selectedIndex, label: Text("每組學習單字量：")) {
                        ForEach(0..<words.count) { (index) in
                            Text(self.words[index])
                        }
                    }.labelsHidden()
                        .frame(width: 150, height: 45)
                        .colorInvert()
                        .clipped()
                }
                //                Text(words[selectedIndex]).foregroundColor(Color.white)
            }
            .padding(.top, -350.0)
            .padding(.leading, 30.0)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
