import SwiftUI

struct Reply: Identifiable {
    let id = UUID()
    let Replyname: String
    let text: String
    let profileImage: String
}

struct Post: Identifiable {
    let id = UUID()
    let Postname: String
    let text: String
    let likes: Int
    let replies: [Reply]
}

struct MyTimelineView: View {
    let posts: [Post] = [
        Post(Postname: "JohnDoe", text: "Hello, world!", likes: 10, replies: [
            Reply(Replyname: "JaneSmith", text: "Hi there!", profileImage: "profile1"),
            Reply(Replyname: "DavidJohnson", text: "Nice post!", profileImage: "profile2")
        ]),
        Post(Postname: "JaneSmith", text: "SwiftUI is awesome!", likes: 20, replies: [
            Reply(Replyname: "JohnDoe", text: "I agree!", profileImage: "profile3")
        ]),
        Post(Postname: "DavidJohnson", text: "Just posted a new blog article.", likes: 8, replies: [
            Reply(Replyname: "JohnDoe", text: "Great article!", profileImage: "profile1"),
            Reply(Replyname: "JaneSmith", text: "Looking forward to reading it!", profileImage: "profile2")
        ]),
        // Add more posts as needed
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(posts) { post in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(post.Postname)
                            .font(.headline)
                        Text(post.text)
                            .font(.body)
                        
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("\(post.likes)")
                            Image(systemName: "bubble.right.fill")
                            Text("\(post.replies.count)")
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                        
                        ForEach(post.replies) { reply in
                            HStack {
                                Image(reply.profileImage)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(reply.Replyname)
                                        .font(.subheadline)
                                    Text(reply.text)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct MyTimelineView_Previews: PreviewProvider {
    static var previews: some View {
        MyTimelineView()
    }
}
