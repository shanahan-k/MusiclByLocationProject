//
//  ContentView.swift
//  MusiclByLocationProject
//
//  Created by Shanahan, Krystian (JD) on 02/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationHandler = LocationHandler()
    var body: some View {
        VStack {
            Text("You are in \(locationHandler.lastKnownsubLocality), \(locationHandler.lastKnownLocality),\(locationHandler.lastKnownCountry)")
                .padding()
            Spacer()
            Button("Find Music", action: {locationHandler.requestLocation()})
        }.onAppear(perform: {locationHandler.requestAuth()})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
