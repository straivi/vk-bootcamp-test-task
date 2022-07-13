//
//  EmptyView.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import SwiftUI

struct EmptyView: View {

    private let action: () -> Void

    init(refreshAction:  @escaping () -> Void) {
        action = refreshAction
    }

    var body: some View {
        VStack {
            Image(AppImageNames.empty)
                .renderingMode(.template)
                .foregroundColor(AppColors.vkBlue)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.vertical, 20)

            Text("Ничего неть(")
                .foregroundColor(AppColors.vkBlue)
                .font(Font.headline)

            Button {
                action()
            } label: {
                Text("Обновить")
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                    .background(AppColors.vkBlue)
                    .cornerRadius(10)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 40)

        }
    }
}
