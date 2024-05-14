//
//  Preferences.swift
//  Binary Clock
//
//  Created by Iman Morshed on 4/28/24.
//

import SwiftUI

struct Preferences: View {
    
    @EnvironmentObject var appDelegate: AppDelegate
    @State private var selectedTab = "General"
    @State private var placeOverDesktopIcons: Bool = true

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    appDelegate.hidePreferences()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 15))
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            TabView(selection: $selectedTab) {
                GeneralView().tabItem {
                    Label("Timing", systemImage: "gear")
                }.tag("General")
                
                PositionView()
                    .environmentObject(appDelegate)
                    .tabItem {
                    Label("Position", systemImage: "arrow.up.arrow.down")
                }.tag("Position")
                /*
                Text("Text Options").tabItem {
                    Label("Text", systemImage: "textformat")
                }.tag("Text")
                
                Text("Overlay Options").tabItem {
                    Label("Overlay", systemImage: "camera.filters")
                }.tag("Overlay")
                 */
            }
            .frame(width: 400, height: 300)
        }
    }
}

struct GeneralView: View {
    @EnvironmentObject var appDelegate: AppDelegate

    var body: some View {
        VStack {

            Picker("Refresh Interval", selection: $appDelegate.timerUpdate) {
                Text("Every 12 hours").tag(12)
                Text("Every 24 hours").tag(24)
                Text("Don't refresh automatically").tag(999)
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
        }
    }
}


struct PositionView: View {
    @EnvironmentObject var appDelegate: AppDelegate
    
    var body: some View {
        VStack {
            Text("Top of Screen")
            VSlider(value: $appDelegate.sliderValue,
                    in: 0...1,
                    step: 0.01,
                    onEditingChanged: { _ in
                
            }
                    
            )
            Text("Bottom of Screen")
        }
        .padding()
    }
}

