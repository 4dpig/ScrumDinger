//
//  DailyScrum.swift
//  ScrumDinger
//
//  Created by siweiZhu on 2021/1/21.
//

import SwiftUI

struct DailyScrum: Identifiable {
    var id: UUID = UUID()
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(
                title: "Design",
                attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                lengthInMinutes: 10,
                color: Color("Design")
            ),
            DailyScrum(
                title: "App Dev",
                attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                lengthInMinutes: 5,
                color: Color("App Dev")
            ),
            DailyScrum(
                title: "Web Dev",
                attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                lengthInMinutes: 1,
                color: Color("Web Dev")
            )
        ]
    }
}

extension DailyScrum {
    struct EditableData {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = Color.random
    }
    
    var data: EditableData {
        return EditableData(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
}
