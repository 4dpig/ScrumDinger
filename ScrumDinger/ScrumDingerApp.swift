//
//  ScrumDingerApp.swift
//  ScrumDinger
//
//  Created by siweiZhu on 2021/1/20.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
