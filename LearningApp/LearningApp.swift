//
//  LearningApp.swift
//  LearningApp
//
//  Created by Sodhis on 4/13/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
