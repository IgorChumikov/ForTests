//
//  ChannelListView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.03.2025.
//
//
//  ChannelListView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.03.2025.
//

import SwiftUI

struct ChannelListView: View {
    
    let StreamBlue = Color(#colorLiteral(red: 0, green: 0.368627451, blue: 1, alpha: 1))
    let notificationColor = Color(#colorLiteral(red: 1, green: 0.2156862745, blue: 0.2588235294, alpha: 1))
    let onlineColor = Color(#colorLiteral(red: 0.1254901961, green: 0.8784313725, blue: 0.4392156863, alpha: 1))
    let appBarColor = Color(#colorLiteral(red: 0.07058823529, green: 0.07843137255, blue: 0.0862745098, alpha: 1))
    
    var messages: [ChannelListStructure] = []

    var body: some View {
        VStack {
            // Header
            HeaderView()
            CustomSearchBarView()
            
            // Message List
            List(messages) { item in
                HStack {
                    ZStack(alignment: .topTrailing) {
                        Image(item.userAvatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        // User status indicator
                        if item.isOnline {
                            Circle()
                                .fill(onlineColor)
                                .frame(width: 12, height: 12)
                                .offset(x: 5, y: -5)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(item.userName)
                            .font(.body)
                        Text(item.userMessageSummary)
                            .font(.footnote)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        if item.unreadMessageCount > 0 {
                            Text("\(item.unreadMessageCount)")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(notificationColor)
                                .clipShape(Circle())
                        }
                        Text(item.timestamp)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .listStyle(.plain)
            .refreshable {
                print("Pull to refresh")
            }

            TabBarView()
        }
        .padding()
    }
}

// MARK: - Dummy Views

struct HeaderView: View {
    var body: some View {
        Text("Channel List")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

struct CustomSearchBarView: View {
    var body: some View {
        TextField("Search...", text: .constant(""))
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct TabBarView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "message.fill")
                .font(.title)
            Spacer()
            Image(systemName: "bell.fill")
                .font(.title)
            Spacer()
            Image(systemName: "gearshape.fill")
                .font(.title)
            Spacer()
        }
        .padding()
        .background(Color.black.opacity(0.1))
    }
}

// MARK: - Model

struct ChannelListStructure: Identifiable {
    let id = UUID()
    let userAvatar: String
    let userName: String
    let userMessageSummary: String
    let timestamp: String
    let unreadMessageCount: Int
    let isOnline: Bool
}

// MARK: - Test Data

let ChannelData: [ChannelListStructure] = [
    ChannelListStructure(userAvatar: "person.fill", userName: "John Doe", userMessageSummary: "Hey! How are you?", timestamp: "12:30 PM", unreadMessageCount: 2, isOnline: true),
    ChannelListStructure(userAvatar: "person.fill", userName: "Alice", userMessageSummary: "See you later!", timestamp: "11:15 AM", unreadMessageCount: 0, isOnline: false),
    ChannelListStructure(userAvatar: "person.fill", userName: "Bob", userMessageSummary: "Check this out!", timestamp: "10:05 AM", unreadMessageCount: 5, isOnline: true)
]

// MARK: - Preview

struct ChannelListView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelListView(messages: ChannelData)
            .preferredColorScheme(.dark)
    }
}

#Preview {
    ChannelListView(messages: ChannelData)
}
