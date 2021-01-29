//
//  ScrumEditView.swift
//  ScrumDinger
//
//  Created by siweiZhu on 2021/1/26.
//

import SwiftUI

struct ScrumEditView: View {
    
    @Binding var scrumData: DailyScrum.EditableData
    
    @State private var newAttendee: String = ""
    
    var body: some View {
        List {
            Section(header: Text("MEETING INFO")) {
                TextField("Title", text: $scrumData.title)
                HStack {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("length")
                    }
                    .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ColorPicker("color", selection: $scrumData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self) { attendee in
                    Text(attendee)
                }
                .onDelete(perform: { (indices: IndexSet) -> Void in
                    scrumData.attendees.remove(atOffsets: indices)
                })
                
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    })
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
    
}

struct ScrumEditView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumEditView(scrumData: .constant(DailyScrum.data[0].editableData))
    }
}
