//
//  PokedexView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI
import URLImage

struct PokedexView: View {
    let fetch: [Pokemon]!
    let fetch2: [Pokemons]!
    @State var temp: Pokemon!
    @State private var showingDetail = false
    @State private var searchQuery: String = ""
    @State private var selected = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SearchBar(text: self.$searchQuery).padding(.vertical, 10)
            List(fetch2.filter {
                self.searchQuery.isEmpty ? true : "\($0)".lowercased().contains(self.searchQuery.lowercased())
            }) { item in
                NavigationLink(destination: PokemonView(pokemon: temp, poke: item).navigationBarTitle("\(item.pokemon) - #\(item.nationalNumber)")) {
                    HStack {
                        URLImage(URLRequest(url: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(item.nationalNumber)).png")!)), delay: 0.05) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                        .frame(width: 55, height: 55)
                        Text("\(item.pokemon)").font(.subheadline).bold().minimumScaleFactor(0.5)
                        Text("#\(item.nationalNumber)").font(.caption).bold().foregroundColor(.secondary).tPad(i: 1.5)
                        Spacer()
                        VStack {
                            Image(item.type1).resizable()
                                .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                            if(item.type2 != "None") {
                                Image(item.type2).resizable()
                                    .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                            }
                        }
                    }.onDisappear(perform: {
                        for item2 in fetch {
                            if item2.pokedexNumber == item.nationalNumber {
                                temp = item2
                            }
                        }
                    })
                }
            }.fixList()
        }
    }
}
