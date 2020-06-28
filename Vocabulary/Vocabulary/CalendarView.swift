//
//  CalendarView.swift
//  Vocabulary
//
//  Created by 楊宸瑜 on 2020/5/19.
//  Copyright © 2020 楊宸瑜. All rights reserved.
//

import SwiftUI
import UIKit
import CVCalendar

struct CalendarView: UIViewRepresentable {

    @Binding var date: Date

    func makeUIView(context: Context) ->
    CVCalendarView {
        let view = CVCalendarView(frame: CGRect(x: 0, y: 500, width: 350, height: 450))
        view.calendarDelegate = context.coordinator
        view.commitCalendarViewUpdate()
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }

    func updateUIView(_ uiView: CVCalendarView, context: Context) {
        uiView.toggleViewWithDate(self.date)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(date: self.$date)
    }

    class Coordinator: NSObject, CVCalendarViewDelegate {

        @Binding var date: Date

        init(date: Binding<Date>) {
            self._date = date
        }

        func presentationMode() -> CalendarMode {
            .monthView
        }

        func firstWeekday() -> Weekday {
            Weekday(rawValue: Calendar.current.firstWeekday)!
        }

        func presentedDateUpdated(_ date: CVDate) {
            if let date = date.convertedDate() {
                self.date = date
            }
        }

    }

}

struct CalendarView_Previews: PreviewProvider {

    @State static var date = Date()

    static var previews: some View {
        CalendarView(date: $date)
    }
}
