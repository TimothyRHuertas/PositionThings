//
//  ImmersiveView.swift
//  PositionThings
//
//  Created by Timothy Huertas on 12/22/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                let skull = scene.children.first!
                skull.transform.translation = skull.visualBounds(relativeTo: nil).center
                scene.transform.translation = [0, 1, -3]
                
                scene.transform.rotation *= simd_quatf(angle: Float(Angle(degrees: 180).radians), axis: [0,0,1])
                content.add(scene)
                
                let line = FromToByAnimation<Transform>(
                    name: "line",
                    from: .init(translation: simd_float(scene.transform.translation)),
                    to: .init(rotation: scene.transform.rotation, translation: scene.transform.translation + [0,1,1]),
                    duration: 10,
                    bindTarget: .transform
                )
                
                let animation = try! AnimationResource
                    .generate(with: line)
                
                scene.playAnimation(animation)
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
