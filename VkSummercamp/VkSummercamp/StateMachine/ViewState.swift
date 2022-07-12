//
//  ViewState.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import Foundation

enum ViewState<T> {
    case content(T)
    case loading
    case error
    case empty
}
