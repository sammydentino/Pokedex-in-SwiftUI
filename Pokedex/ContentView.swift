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
                    List {
                        Image("Pokemon").padding(.vertical).makeEmptySection()
                        NavigationLink(destination: PokedexView(fetch: fetch.pokemon).navigationBarTitle("National Dex")) {
                            Text("All - \(fetch.pokemon.count) Pokémon")
                                .subhead()
                        }.makeSection(str: "National Dex")
                        Group {
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen1).navigationBarTitle("Gen 1 Dex")) {
                                Text("Gen 1 - \(fetch.Gen1.count) Pokémon")
                                    .subhead()
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen2).navigationBarTitle("Gen 2 Dex")) {
                                Text("Gen 2 - \(fetch.Gen2.count) Pokémon")
                                    .subhead()
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen3).navigationBarTitle("Gen 3 Dex")) {
                                Text("Gen 3 - \(fetch.Gen3.count) Pokémon")
                                    .subhead()
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen4).navigationBarTitle("Gen 4 Dex")) {
                                Text("Gen 4 - \(fetch.Gen4.count) Pokémon")
                                    .subhead()
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen5).navigationBarTitle("Gen 5 Dex")) {
                                Text("Gen 5 - \(fetch.Gen5.count) Pokémon")
                                    .subhead()
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen6).navigationBarTitle("Gen 6 Dex")) {
                                Text("Gen 6 - \(fetch.Gen6.count) Pokémon")
                                    .subhead()
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen7).navigationBarTitle("Gen 7 Dex")) {
                                Text("Gen 7 - \(fetch.Gen7.count) Pokémon")
                                    .subhead()
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen8).navigationBarTitle("Gen 8 Dex")) {
                                Text("Gen 8 - \(fetch.Gen8.count) Pokémon")
                                    .subhead()
                            }
                        }.makeSection(str: "Regional Dex")
                    }.fixList().lTitle(str: "Pokedex")
                }.navigationBarColor(.myControlBackground)
			}.tabItem {
				Image(systemName: "book")
				Text("Pokedex")
			}.tag(0)
			NavigationView {
				VStack(alignment: .leading, spacing: 0) {
					TypesView().navigationBarTitle("Types")
				}
			}.tabItem {
				Image(systemName: "circle.grid.hex")
				Text("Types")
			}.tag(1)
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    MovesView().navigationBarTitle("Moves")
                }
            }.tabItem {
                Image(systemName: "speedometer")
                Text("Moves")
            }.tag(2)
			/*NavigationView {
				VStack(alignment: .leading, spacing: 0) {
					ItemsView().navigationBarTitle("Items")
				}
			}.tabItem {
				Image(systemName: "gift")
				Text("Items")
			}.tag(3)*/
        }.animation(.default)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
