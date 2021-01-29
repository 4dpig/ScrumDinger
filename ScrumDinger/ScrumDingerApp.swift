//
//  ScrumDingerApp.swift
//  ScrumDinger
//
//  Created by siweiZhu on 2021/1/20.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    // App的入口。这里存储着Scrums数据源，并沿着视图层次结构将其向下传递
    @State private var scrums: [DailyScrum] = DailyScrum.data
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
