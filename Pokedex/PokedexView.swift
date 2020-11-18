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
    @State private var showingDetail = false
    @State private var searchQuery: String = ""
    @State private var selected = 0
    
    var body: some View {
        List(fetch2.indices) { i in
            NavigationLink(destination: PokemonView(pokemon: fetch[i], poke: fetch2[i]).navigationBarTitle("\(fetch[i].pokemonName) - #\(fetch2[i].nationalNumber)")) {
                HStack {
                    URLImage(URLRequest(url: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(fetch2[i].nationalNumber)).png")!)), delay: 0.05) { proxy in
                        proxy.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    }
                    .frame(width: 55, height: 55)
                    Text("\(fetch[i].pokemonName)").font(.subheadline).bold().minimumScaleFactor(0.5)
                    Text("#\(fetch2[i].nationalNumber)").font(.subheadline).bold().foregroundColor(.secondary)
                    Spacer()
                    VStack {
                        Image(fetch2[i].type1).resizable()
                            .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                        if(fetch2[i].type2 != "None") {
                            Image(fetch2[i].type2).resizable()
                                .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                        }
                    }
                }
            }
        }
    }
}
