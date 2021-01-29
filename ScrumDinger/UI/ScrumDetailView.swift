//
//  DetailView.swift
//  ScrumDinger
//
//  Created by siweiZhu on 2021/1/25.
//

import SwiftUI

struct ScrumDetailView: View {
    @Binding var scrum: DailyScrum
    @State private var editableData: DailyScrum.EditableData = DailyScrum.EditableData()
    @State private var isPresented = false
    
    var body: some View {
        List {
            Section(header: Text("METTING INFO")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .accessibilityLabel(Text("Start meeting"))
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
            // 根据当前scrum中的数据来获取一个editableData，将其作为用户编辑的初始值
            editableData = scrum.editableData
        })
        .fullScreenCover(isPresented: $isPresented, content: {
            NavigationView {
                ScrumEditView(scrumData: $editableData)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                        // 更新scrum数据
                        scrum.update(from: editableData)
                    })
            }
        })
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumDetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
