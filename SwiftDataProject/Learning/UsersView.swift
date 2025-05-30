//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Chiraphat Techasiri on 5/29/25.
//
import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    @Query var users: [User]
    
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) { // takes in a date
        _users = Query(filter: #Predicate<User> {user in // first accesses query wrapper then only gets users that meet the condition
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder) // then sorts it by name
    }

    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                Text(user.name)
                
                Spacer()
                
                Text(String(user.jobs?.count ?? 0))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
            .onAppear(perform: addSample)
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(user1)
        
        user1.jobs?.append(job1)
        user1.jobs?.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
