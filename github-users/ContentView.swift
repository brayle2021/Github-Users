import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = UserListViewModel()
    
    
    var body: some View {
        UserListView(users: viewModel.state.users, isLoading: viewModel.state.isLoading, refresh: viewModel.fetchUsers)
        .onAppear(perform: viewModel.fetchUsers)
    }
}
