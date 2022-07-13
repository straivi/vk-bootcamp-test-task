//
//  Shimmering.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 14.07.2022.
//

import SwiftUI

struct Shimmering: ViewModifier {
    @State private var phase: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .modifier(AnimatedMask(phase: phase)
                .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false)))
            .onAppear {
                phase = 0.8
            }
    }
}

private struct AnimatedMask: AnimatableModifier {
    var phase: CGFloat = 0

    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }

    func body(content: Content) -> some View {
        content.mask(GradientMask(phase: phase).scaleEffect(1.5))
    }
}

private struct GradientMask: View {
    let phase: CGFloat
    let centerColor = Color.black
    let edgeCOlor = Color.black.opacity(0.3)

    var body: some View {
        LinearGradient(gradient: Gradient(stops: [
            Gradient.Stop(color: edgeCOlor, location: phase),
            Gradient.Stop(color: centerColor, location: phase + 0.1),
            Gradient.Stop(color: edgeCOlor, location: phase + 0.2)]),
                        startPoint: .topLeading,
                        endPoint: .topTrailing)
    }
}

extension View {
    @ViewBuilder func shimmering() -> some View {
        modifier(Shimmering())
    }
}
