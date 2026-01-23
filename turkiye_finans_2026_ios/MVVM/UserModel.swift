//
//  UserModel.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 23.01.2026.
//

import Foundation
import Combine

struct Todo: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}


class UserModel: ObservableObject {
    
    @Published var title: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUser() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Todo.self, decoder: JSONDecoder())
            .map { $0.title }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        print("Hata:", error.localizedDescription)
                    }
                },
                receiveValue: { [weak self] title in
                    self?.title = title
                }
            )
            .store(in: &cancellables)
    }
}


