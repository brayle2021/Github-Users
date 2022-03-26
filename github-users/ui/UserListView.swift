import SwiftUI
import Foundation
import Combine

struct UserListView: View {
    let users: [User]
    let isLoading: Bool
    let refresh: () -> Void
    
    var body: some View {
        NavigationView {
            List {
                if isLoading {
                    ProgressView().scaleEffect(2.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                }
                userList
            }
            .refreshable {
                refresh()
            }
            .navigationTitle("Github")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var userList: some View {
        ForEach(users) { user in
            UserRowView(user: user)
        }
    }
}
