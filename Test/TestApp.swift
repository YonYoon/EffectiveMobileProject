//
//  TestApp.swift
//  Test
//
//  Created by Zhansen Zhalel on 04.06.2024.
//

import SwiftUI

@main
struct TestApp: App {
    @StateObject private var userTicket = UserTicket()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                TicketsSearchView()
                    .environmentObject(userTicket)
                    .tabItem {
                        Label("Авиабилеты", systemImage: "airplane")
                    }
                Text("Отели")
                    .tabItem {
                        Label("Отели", systemImage: "bed.double.fill")
                    }
                Text("Короче")
                    .tabItem {
                        Label("Короче", systemImage: "mappin.and.ellipse")
                    }
                Text("Подписки")
                    .tabItem {
                        Label("Подписки", systemImage: "bell.fill")
                    }
                Text("Профиль")
                    .tabItem {
                        Label("Профиль", systemImage: "person.fill")
                    }
            }
        }
    }
}
