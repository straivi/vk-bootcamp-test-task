//
//  ErrorView.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import SwiftUI

struct ErrorView: View {

    private let action: () -> Void

    init(refreshAction:  @escaping () -> Void) {
        action = refreshAction
    }

    var body: some View {
        VStack {
            Image(AppImageNames.error)
                .renderingMode(.template)
                .foregroundColor(AppColors.vkMagenta)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.vertical, 20)

            Text("Произошла ошибка")
                .multilineTextAlignment(.center)
                .foregroundColor(AppColors.vkMagenta)
                .font(Font.headline)
                .padding(.horizontal, 40)

            Button {
                action()
            } label: {
                Text("Попробовать снова")
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                    .background(AppColors.vkGreen)
                    .cornerRadius(10)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 40)
        }
    }
}
