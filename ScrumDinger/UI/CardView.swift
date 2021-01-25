//
//  CardView.swift
//  ScrumDinger
//
//  Created by siweiZhu on 2021/1/21.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            
            Spacer()
            
            HStack {
                Label(
                    String(scrum.attendees.count),
                    systemImage: "person.3"
                )
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Attendees"))
                .accessibilityValue(
                    Text(String(scrum.attendees.count))
                )
                
                Spacer()
                
                Label(
                    String(scrum.lengthInMinutes),
                    systemImage: "clock"
                )
                .padding(.trailing, 20)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Meeting length"))
                .accessibilityValue(
                    Text("\(scrum.lengthInMinutes) minutes")
                )
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
