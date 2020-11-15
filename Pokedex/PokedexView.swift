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
	@ObservedObject var fetch = getPokedex()
	@State private var showingDetail = false
	@State private var searchQuery: String = ""
	@State private var selected = 0
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			SearchBar(text: self.$searchQuery).padding(.bottom, 10)
            List(fetch.pokemon.filter {
                self.searchQuery.isEmpty ? true : "\($0)".lowercased().contains(self.searchQuery.lowercased())
            }) { item in
                NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
                    HStack {
                        URLImage(URLRequest(url: (URL(string: item.imgUrl)!)), delay: 0.05) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                        .frame(width: 50, height: 50).padding(.bottom, 5)
                        Text("\(item.name.english)").font(.subheadline).bold()
                        Spacer()
                        ForEach(item.type, id: \.self) { type in
                            Image(type)
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
		}
	}
}

struct PokemonView: View {
	let pokemon: Pokedex!
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			List {
                Section(header: Text("Type").font(.subheadline).bold()) {
                    HStack {
                        ForEach(pokemon.type, id: \.self) { item in
                            Image(item)
                        }
                    }
                }
				Section(header: Text("Regular & Shiny Forms").font(.subheadline).bold()) {
					HStack {
						Spacer()
						URLImage(URLRequest(url: (URL(string: pokemon.imgUrl)!))) { proxy in
							proxy.image
								.resizable()
								.aspectRatio(contentMode: .fill)
								.clipped()
						}
						.frame(width: 100, height: 100)
						Spacer()
						Divider()
						Spacer()
						URLImage(URLRequest(url: (URL(string: pokemon.shinyUrl)!))) { proxy in
							proxy.image
								.resizable()
								.aspectRatio(contentMode: .fill)
								.clipped()
						}
						.frame(width: 100, height: 100)
						Spacer()
					}
				}
				
				Section(header: Text("Base Stats").font(.subheadline).bold()) {
					HStack {
						Text("HP").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.base.hp)").font(.subheadline).bold().foregroundColor(.red)
					}
					HStack {
						Text("Attack").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.base.attack)").font(.subheadline).bold().foregroundColor(.orange)
					}
					HStack {
						Text("Defense").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.base.defense)").font(.subheadline).bold().foregroundColor(.yellow)
					}
					HStack {
						Text("Sp. Attack").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.base.spAttack)").font(.subheadline).bold().foregroundColor(.green)
					}
					HStack {
						Text("Sp. Defense").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.base.spDefense)").font(.subheadline).bold().foregroundColor(.blue)
					}
					HStack {
						Text("Speed").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.base.speed)").font(.subheadline).bold().foregroundColor(.purple)
					}
				}
				Section(header: Text("Name Translations").font(.subheadline).bold()) {
					HStack {
						Text("Japanese").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.name.japanese)").font(.subheadline).bold()
					}
					HStack {
						Text("Chinese").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.name.chinese)").font(.subheadline).bold()
					}
					HStack {
						Text("French").font(.subheadline).bold()
						Spacer()
						Text("\(pokemon.name.french)").font(.subheadline).bold()
					}
				}
			}
		}
	}
}
