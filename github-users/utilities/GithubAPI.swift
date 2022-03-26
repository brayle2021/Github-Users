import Foundation
import Combine

enum GithubAPI {    
    static func getUsers() -> AnyPublisher<[User], Error> {
        let url = URL(string: "https://api.github.com/users")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { data, response -> [User] in
                return try JSONDecoder().decode([User].self, from: data)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
