import SwiftUI

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        NavigationLink(destination: UserDetailView(user: user)) {
            HStack {
                AsyncImage(url: URL(string: user.avatar_url)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }.padding(.trailing, 20)
                
                VStack{
                    Text(user.login).font(.system(size: 12))
                    Text(user.html_url).font(.system(size: 12))
                }.padding()
            }
        }
    }
}
