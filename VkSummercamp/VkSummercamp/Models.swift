//
//  Models.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import Foundation

extension NetworkService {
    struct Responce: Decodable {
        let body: Body
    }

    struct Body: Decodable {
        let services: [AppData]
    }
}

struct AppData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let link: String
    let iconUrl: String
}

extension AppData: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case link
        case iconUrl = "icon_url"
    }
}
