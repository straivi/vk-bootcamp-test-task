//
//  ErrorView.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import SwiftUI

struct ErrorView: View {

    var body: some View {
        VStack {
            Image(AppImageNames.error)
                .renderingMode(.template)
                .foregroundColor(AppColors.vkMagenta)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.vertical, 20)

            Text("Произошла ошибка, потяните чтобы обновить")
                .multilineTextAlignment(.center)
                .foregroundColor(AppColors.vkMagenta)
                .font(Font.headline)
                .padding(.horizontal, 40)
        }
    }
}
