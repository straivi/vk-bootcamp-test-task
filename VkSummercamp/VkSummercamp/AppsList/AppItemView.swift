//
//  AppItemView.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 14.07.2022.
//

import SwiftUI
import UIKit

struct AppItemView: View {

    let viewModel: AppItemViewModel

    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string: viewModel.appData.iconUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Rectangle()
                        .aspectRatio(1, contentMode: .fill)
                        .foregroundColor(.gray)
                        .cornerRadius(12)
                        .shimmering()
                }
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.top, 12)

                Spacer()
            }

            VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.appData.name)
                        .font(.headline)
                        .padding(EdgeInsets(top: 12, leading: 4, bottom: 4, trailing: 0))

                    Text(viewModel.appData.description)
                        .font(.body)
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 8, trailing: 0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .layoutPriority(1)

            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16, alignment: .center)
        }
        .onTapGesture {
            guard let url = URL(string: viewModel.appData.link) else {
                return
            }
            UIApplication.shared.open(url)
        }
    }
}
