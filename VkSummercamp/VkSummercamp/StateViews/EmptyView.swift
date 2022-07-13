//
//  EmptyView.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import SwiftUI

struct EmptyView: View {

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
        }
    }
}
