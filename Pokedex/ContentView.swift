//
//  ContentView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/16/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI
import URLImage
import WebKit

struct ContentView: View {
	@State var selectedView = 0
	@ObservedObject var fetch = getPokedex()
	@State private var showingDetail = false
	@State private var searchQuery: String = ""
    var body: some View {
		TabView(selection: $selectedView) {
			NavigationView {
				VStack(alignment: .leading, spacing: 0) {
					PokedexView().navigationBarTitle("Pokedex")
				}
			}.tabItem {
				Image(systemName: "book")
				Text("Pokedex")
			}.tag(0)
			NavigationView {
				VStack(alignment: .leading, spacing: 0) {
					MovesView().navigationBarTitle("Moves")
				}
			}.tabItem {
				Image(systemName: "speedometer")
				Text("Moves")
			}.tag(1)
			NavigationView {
				VStack(alignment: .leading, spacing: 0) {
					TypesView().navigationBarTitle("Types")
				}
			}.tabItem {
				Image(systemName: "circle.grid.hex")
				Text("Types")
			}.tag(2)
			NavigationView {
				VStack(alignment: .leading, spacing: 0) {
					ItemsView().navigationBarTitle("Items")
				}
			}.tabItem {
				Image(systemName: "gift")
				Text("Items")
			}.tag(3)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
