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
    @ObservedObject var types = getTypes()
    @ObservedObject var moves = getMoves()
	@State private var showingDetail = false
	@State private var searchQuery: String = ""
    var body: some View {
		TabView(selection: $selectedView) {
			NavigationView {
				VStack(alignment: .center, spacing: 0) {
                    List {
                        HStack {
                            Spacer()
                            Image("Pokemon").padding(.vertical)
                            Spacer()
                        }.makeEmptySection()
                        NavigationLink(destination: PokedexView(fetch: fetch.pokemon, fetch2: fetch.poke.pokemon).navigationBarTitle("National Dex")) {
                            Text("All \(fetch.pokemon.count) Pokémon")
                                .subhead()
                        }.makeSection(str: "National Dex")
                        Group {
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen1, fetch2: Array(fetch.poke.pokemon.prefix(151))).navigationBarTitle("Kanto Dex")) {
                                Text("Kanto").subhead()
                                Spacer()
                                Text("\(fetch.Gen1.count) Pokémon").caption().foregroundColor(.secondary)
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen2, fetch2: Array((fetch.poke.pokemon.prefix(251)).suffix(100))).navigationBarTitle("Johto Dex")) {
                                Text("Johto").subhead()
                                Spacer()
                                Text("\(fetch.Gen2.count) Pokémon")
                                    .caption().foregroundColor(.secondary)
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen3, fetch2: Array((fetch.poke.pokemon.prefix(386)).suffix(135))).navigationBarTitle("Hoenn Dex")) {
                                Text("Hoenn").subhead()
                                Spacer()
                                Text("\(fetch.Gen3.count) Pokémon")
                                    .caption().foregroundColor(.secondary)
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen4, fetch2: Array((fetch.poke.pokemon.prefix(493)).suffix(107))).navigationBarTitle("Sinnoh Dex")) {
                                Text("Sinnoh").subhead()
                                Spacer()
                                Text("\(fetch.Gen4.count) Pokémon")
                                    .caption().foregroundColor(.secondary)
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen5, fetch2: Array((fetch.poke.pokemon.prefix(649)).suffix(156))).navigationBarTitle("Unova Dex")) {
                                Text("Unova ").subhead()
                                Spacer()
                                Text("\(fetch.Gen5.count) Pokémon")
                                    .caption().foregroundColor(.secondary)
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen6, fetch2: Array((fetch.poke.pokemon.prefix(721)).suffix(72))).navigationBarTitle("Kalos Dex")) {
                                Text("Kalos").subhead()
                                Spacer()
                                Text("\(fetch.Gen6.count) Pokémon")
                                    .caption().foregroundColor(.secondary)
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen7, fetch2: Array((fetch.poke.pokemon.prefix(809)).suffix(88))).navigationBarTitle("Alola Dex")) {
                                Text("Alola").subhead()
                                Spacer()
                                Text("\(fetch.Gen7.count) Pokémon")
                                    .caption().foregroundColor(.secondary)
                            }
                            NavigationLink(destination: PokedexView(fetch: fetch.Gen8, fetch2: Array(fetch.poke.pokemon.suffix(84))).navigationBarTitle("Galar Dex")) {
                                Text("Galar").subhead()
                                Spacer()
                                Text("\(fetch.Gen8.count) Pokémon")
                                    .caption().foregroundColor(.secondary)
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
                    TypesView(types: types.types).navigationBarTitle("Types")
				}
			}.tabItem {
				Image(systemName: "circle.grid.hex")
				Text("Types")
			}.tag(1)
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    MovesView(moves: moves.moves).navigationBarTitle("Moves")
                }
            }.tabItem {
                Image(systemName: "speedometer")
                Text("Moves")
            }.tag(2)
        }.animation(.default)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
