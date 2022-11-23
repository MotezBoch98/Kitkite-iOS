//
//  Homeview.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import SwiftUI
import TabBar

struct HomeView: View {
    
    private enum Item: Int, Tabbable {
        case home = 0
        case search
        case messages
        case profile
        case events
        case notifications
        
        var icon: String {
            switch self {
                case .home: return "house"
                case .search: return "map"
                case .messages: return "ellipsis.message"
                case .events: return "party.popper"
                case .profile: return "figure.surfing"
                case . notifications: return "globe.europe.africa"
                

            }
        }
        
        var title: String {
            switch self {
                case .home: return "Home"
                case .search: return "Search"
                case .messages: return "Messages"
                case .events: return "Events"
                case .profile: return "Profile"
                case .notifications: return "Notifications"
            }
        }
    }
    
    @State private var selection: Item = .home
    @State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            Button {
                withAnimation {
                    visibility.toggle()
                }
            } label: {
                Text("Hide/Show TabBar")
            }
            .tabItem(for: Item.home)
            
            Text("Bases")
                .tabItem(for: Item.search)
            
            Text("Messages")
                .tabItem(for: Item.messages)
            
            Text("Events")
                .tabItem(for: Item.events)
            
            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)){
                Button{
                    
                } label: {
                    Text("Get profile")
                }
            } .tabItem(for: Item.profile)
               
            
                
            
            Text("Notifications")
                .tabItem(for: Item.notifications)
                        
        }
        .tabBar(style: CustomTabBarStyle())
        .tabItem(style: CustomTabItemStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CustomTabBarStyle: TabBarStyle {
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        itemsContainer()
            .background(Color("color.tab.bar.background"))
            .cornerRadius(25.0)
            .frame(height: 50.0)
            .padding(.horizontal, 64.0)
            .padding(.bottom, 16.0 + geometry.safeAreaInsets.bottom)
    }
    
}

struct CustomTabItemStyle: TabItemStyle {
    
    public func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        ZStack {
            if isSelected {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 40.0, height: 40.0)
            }
            
            Image(systemName: icon)
                .foregroundColor(isSelected ? .white : Color("color.tab.item.foreground"))
                .frame(width: 32.0, height: 32.0)
        }
        .padding(.vertical, 8.0)
    }
    
}

