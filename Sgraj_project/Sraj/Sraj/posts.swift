//
//  posts.swift
//  Sraj
//
//  Created by Foundation 20 on 07/05/1445 AH.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    let id: Int
    let name: String
    let profileImageName: String
}

struct Post: Identifiable {
    let id: Int
    let user: User
    let text: String
    var likes: Int
    var replies: Int
}

class DataStore: ObservableObject {
    @Published var users: [User] = [
        User(id: 1, name: "Ahmed", profileImageName: "profile1"),
        User(id: 2, name: "Fatima", profileImageName: "profile2"),
        User(id: 3, name: "Mohammed", profileImageName: "profile3"),
        // Add more users as needed
    ]
    
    @Published var posts: [Post] = []
    
    @Published var postTables: [String] = [
        "General",
        "News",
        "Events",
        // Add more post tables as needed
    ]
    
    init() {
        generatePosts()
    }
    
    private func generatePosts() {
        var postId = 1
        for _ in 1...10 { // Generate 10 posts for each table
            for user in users {
                let randomTableIndex = Int.random(in: 0..<postTables.count)
                let table = postTables[randomTableIndex]
                let post = Post(id: postId, user: user, text: "Lorem ipsum dolor sit amet", likes: Int.random(in: 0..<100), replies: Int.random(in: 0..<20))
                posts.append(post)
                postId += 1
            }
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    
    var body: some View {
        VStack {
            // Display post tables
            ForEach(dataStore.postTables, id: \.self) { tableName in
                Text(tableName)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                
                // Display posts for each table
                ForEach(dataStore.posts) { post in
                    if postTable(for: post) == tableName {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(post.user.profileImageName)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(25)
                                Text(post.user.name)
                                    .font(.headline)
                                Spacer()
                            }
                            Text(post.text)
                                .font(.body)
                            HStack {
                                Image(systemName: "heart")
                                Text("\(post.likes)")
                                Image(systemName: "message")
                                Text("\(post.replies)")
                                Spacer()
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                }
            }
        }
    }
    
    func postTable(for post: Post) -> String {
        // Logic to determine post table based on post ID or other criteria
        // Return the corresponding table name
        return dataStore.postTables.first ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
