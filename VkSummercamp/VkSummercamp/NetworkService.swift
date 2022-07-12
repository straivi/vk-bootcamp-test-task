//
//  NetworkService.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import Combine
import Foundation

class NetworkService: ObservableObject {

    private static let dataUrl = "https://publicstorage.hb.bizmrg.com/sirius/result.json"

    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func request() -> AnyPublisher<[AppData], Error> {
        guard let url = URL(string: NetworkService.dataUrl) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }

        let publisher = session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Responce.self, decoder: JSONDecoder())
            .map { $0.body }
            .map { $0.services }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()

        return publisher
    }
}

