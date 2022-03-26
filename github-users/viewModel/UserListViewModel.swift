import Foundation
import SwiftUI
import Combine

class UserListViewModel: ObservableObject {
    @Published private(set) var state = State()
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchUsers() {
        guard !state.isLoading else { return }
        
        state.isLoading = true
        
        GithubAPI.getUsers()
            .sink(receiveCompletion: onReceive,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            state.isLoading = false
        }
    }

    private func onReceive(_ batch: [User]) {
        state.users = batch
        state.isLoading = false
    }

    struct State {
        var users: [User] = []
        var isLoading = false
    }
}
