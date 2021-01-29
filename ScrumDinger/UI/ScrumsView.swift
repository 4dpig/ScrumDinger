//
//  ScrumsView.swift
//  ScrumDinger
//
//  Created by siweiZhu on 2021/1/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(
                    destination:
                        ScrumDetailView(scrum: getScrumBinding(for: scrum))
                ) {
                    ScrumCardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "plus")
        })
    }
    
    private func getScrumBinding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        // 获得被点击的scrum的Binding
        if let scrumIndex = scrums.firstIndex(where: {$0.id == scrum.id}) {
            return $scrums[scrumIndex]
        }
        else {
            fatalError("Can't find scrum in the scrums array.")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
