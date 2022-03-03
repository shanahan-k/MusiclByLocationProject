//
//  ContentView.swift
//  MusiclByLocationProject
//
//  Created by Shanahan, Krystian (JD) on 02/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var  state = stateController()
    var body: some View {
        VStack {
            Text(state.artistNames)
            Text("You are in: \(state.lastKnownsubLocality)\n \(state.lastKnownLocality)\n\(state.lastKnownCountry)")
                .padding()
            Spacer()
            Button("Find Music", action: {state.findMusic()})
        }.onAppear(perform: {
            state.requestAccesstoLocationData()
            state.getArtists()
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
