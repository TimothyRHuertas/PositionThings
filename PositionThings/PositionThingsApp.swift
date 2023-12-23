//
//  PositionThingsApp.swift
//  PositionThings
//
//  Created by Timothy Huertas on 12/22/23.
//

import SwiftUI

@main
struct PositionThingsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
