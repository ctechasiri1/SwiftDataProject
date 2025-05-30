//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Chiraphat Techasiri on 5/21/25.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // this is for the User object in Learning file
        .modelContainer(for: User.self)
    }
}
