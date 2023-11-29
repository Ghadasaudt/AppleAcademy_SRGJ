import SwiftUI

struct UserProfile {
    let profileImage: String
    let email: String
    let name: String
    let bio: String
    let interests: [String]
    let goals: [String]
    let id = UUID()
}
 struct Post {
     let Postname: String
     let text: String
     let likes: Int
     let replies: [Reply]
     let id = UUID()
}

struct Reply {
    var Replyname: String
    var text: String
    var profileImage: String
}

struct ContentView: View {
    var profiles: [UserProfile] = [
       UserProfile(profileImage:"Ahmed-pic",email: "Ahmed@example.com", name: "Ahmed", bio: "Life enthusiast. Dream big!", interests: ["Photography", "Traveling"], goals: ["Learn a new language", "Start a business"]),
      UserProfile(profileImage: "Fatima-pic",email: "Fatima@example.com", name: "Fatima", bio: "Passionate about art and literature", interests: ["Painting", "Reading"], goals: ["Write a book", "Exhibit artwork"]),
      UserProfile(profileImage: "Ali-pic",email: "Ali@example.com", name: "Ali", bio: "Tech geek and gamer", interests: ["Coding", "Video Games"], goals: ["Build a gaming PC", "Create a game"]),
        UserProfile(profileImage: "Nora-pic",email: "Nora@example.com", name: "Nora", bio: "Animal lover and nature enthusiast", interests: ["Hiking", "Wildlife Photography"], goals: ["Volunteer at an animal shelter", "Visit all national parks"]),
        UserProfile(profileImage: "Assma-pic",email: "Assma@example.com", name: "Assma", bio: "Sports fanatic and fitness junkie", interests: ["Basketball", "Weightlifting"], goals: ["Run a marathon", "Achieve a new PR"]),
        UserProfile(profileImage: "Sarah-pic",email: "Sarah@example.com", name: "Sarah", bio: "Fashionista and style icon", interests: ["Fashion", "Shopping"], goals: ["Start a fashion blog", "Attend fashion week"]),
        UserProfile(profileImage: "Khalid-pic",email: "Khalid@example.com", name: "Khalid", bio: "Music lover and aspiring guitarist", interests: ["Playing guitar", "Songwriting"], goals: ["Record an album", "Perform live"]),
        UserProfile(profileImage: "Lana-pic",email: "Lana@example.com", name: "Lana", bio: "Foodie and culinary explorer", interests: ["Cooking", "Food Photography"], goals: ["Master French cuisine", "Open a restaurant"]),
        UserProfile(profileImage: "Turki-pic",email: "Turki@example.com", name: "Turki", bio: "Tech entrepreneur and innovator", interests: ["Artificial Intelligence", "Blockchain"], goals: ["Build a successful startup", "Disrupt an industry"]),
        UserProfile(profileImage: "Omer-pic",email: "Omer@example.com", name: "Omer", bio: "Bookworm and literature lover", interests: ["Reading", "Writing"], goals: ["Read 100 books in a year", "Publish a novel"])
    ]
    
   var posts: [Post] = [
        Post(Postname: "Ahmed", text: "Hello, world!", likes: 10, replies: [
            Reply(Replyname: "Fatima", text: "Nice to meet you!", profileImage: "Fatima-pic"),
            Reply(Replyname: "Ali", text: "Welcome!", profileImage: "Ali-pic")
        ]),
        Post(Postname: "Fatima", text: "Enjoying a beautiful sunset", likes: 5, replies: [
            Reply(Replyname: "Ahmed", text: "Have a good night", profileImage: "Ahmed-pic"),
            Reply(Replyname: "Ali", text: "Nice", profileImage: "Ali-pic")
        ]),
        Post(Postname: "Ali", text: "Just finished coding my latest project", likes: 15, replies: [
            Reply(Replyname: "Ahmed", text: "Great job!", profileImage: "Ahmed-pic"),
            Reply(Replyname: "Fatima", text: "Bravo Ali!", profileImage: "Fatima-pic")
        ]),
        Post(Postname: "Nora", text: "Spotted a rare bird on my hike today", likes: 7, replies: [
            Reply(Replyname: "Assma", text: "Amazing find!", profileImage: "Assma-pic"),
            Reply(Replyname: "Sarah", text: "Beautiful photo!", profileImage: "Sarah-pic")
        ]),
        Post(Postname: "Assma", text: "Just hit a new personal record at the gym", likes: 12, replies: [
            Reply(Replyname: "Sarah", text: "You're killing it!", profileImage: "Sarah-pic"),
            Reply(Replyname: "Lana", text: "Impressive!", profileImage: "Lana-pic")
        ]),
        Post(Postname: "Sarah", text: "Check out my latest fashion haul", likes: 8, replies: [
            Reply(Replyname: "Assma", text: "Love those outfits!", profileImage: "Assma-pic"),
            Reply(Replyname: "Lana", text: "You have a great sense of style!", profileImage: "Lana-pic")
        ]),
        Post(Postname: "Turki", text: "Working on a new song", likes: 3, replies: [
            Reply(Replyname: "Nora", text: "Can't wait to hear it!", profileImage: "Nora-pic"),
            Reply(Replyname: "Omer", text: "Music is life!", profileImage: "Omer-pic")
        ]),
        Post(Postname: "Lana", text: "Trying out a new recipe tonight", likes: 6, replies: [
            Reply(Replyname: "Khalid", text: "Let me know how it turns out!", profileImage: "Khalid-pic"),
            Reply(Replyname: "Omer", text: "I love cooking too!", profileImage: "Omer-pic")
        ]),
        Post(Postname: "Khalid", text: "Excited about the potential of blockchain technology", likes: 9, replies: [
            Reply(Replyname: "Nora", text: "It's going to revolutionize many industries", profileImage: "Nora-pic"),
            Reply(Replyname: "Turki", text: "Agreed, it's a game-changer", profileImage: "Turki-pic")
        ]),
        Post(Postname: "Omer", text: "Just finished reading an amazing book", likes: 4, replies: [
            Reply(Replyname: "Sarah", text: "What's the title? I need a new read", profileImage: "Sarah-pic"),
            Reply(Replyname: "Turki", text: "I'm always looking for book recommendations", profileImage: "Turki-pic")
        ])
    ]
    
    var body: some View {
            VStack {
                Text("User Profiles")
                    .font(.title)
                    .padding()
                
                List(profiles, id: \.id) { profile in
                    VStack {
                        Text("Name: \(profile.name)")
                            .font(.headline)
                        Text("Email: \(profile.email)")
                            .foregroundColor(.gray)
                        Text("Bio: \(profile.bio)")
                        Text("Interests: \(profile.interests.joined(separator: ", "))")
                        Text("Goals: \(profile.goals.joined(separator: ", "))")
                    }
                    .padding()
                }
                
                Text("Posts")
                    .font(.title)
                    .padding()
                
                List(posts, id: \.id) { post in
                    VStack {
                        Text("Post Name: \(post.Postname)")
                            .font(.headline)
                        Text("Text: \(post.text)")
                        Text("Likes: \(post.likes)")
//                        List(post.replies, id: \.Replyname) { reply in
//                            HStack {
//                                Image(reply.profileImage)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 50, height: 50)
//                                Text("\(reply.replyName): \(reply.text)")
//                            }
//                        }
                    }
                    .padding()
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
