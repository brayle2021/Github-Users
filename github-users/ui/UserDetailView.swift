import SwiftUI

struct UserDetailView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.avatar_url)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .clipShape(Circle())
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(user.login)
            .font(.system(size: 25))
            .bold()
            
            Spacer()
            Divider().background(.black).padding()
            
            Text("DETAILS")
            .font(.system(size: 15))
            .bold()
            .padding()
            
            Group{
                Text(user.html_url)
                Text(user.node_id)
                Text(user.followers_url)
                Text(user.subscriptions_url)
                Text(user.organizations_url)
                Text(user.repos_url)
                Text(user.received_events_url)
                Text(user.type)
                Text(String(user.site_admin))
            }
            .font(.system(size: 13))
            
            Spacer()
            Spacer()
            Spacer()
            
//            let html_url: String
//            let node_id: String
//            let followers_url: String
//            let subscriptions_url: String
//            let organizations_url: String
//            let repos_url: String
//            let received_events_url: String
//            let type: String
//            let site_admin: Bool
            
            
            
            
        }
        .navigationTitle(String(user.id))
        .navigationBarTitleDisplayMode(.automatic)
    }
}
