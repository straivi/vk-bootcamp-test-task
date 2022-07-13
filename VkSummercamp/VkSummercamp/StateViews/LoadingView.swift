//
//  LoadingView.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ActivityIndicator()
            .frame(width: 100, height: 100, alignment: .center)
    }
}

struct ActivityIndicator: View {
    let style = StrokeStyle(lineWidth: 10, lineCap: .round)

    @State var animate = false

    let color1 = AppColors.vkBlue
    let color2 = AppColors.vkMagenta

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.1, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [color1, color2]), center: .center), style: style)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: false), value: animate)
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}
