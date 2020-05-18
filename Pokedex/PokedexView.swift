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
			Form {
				Picker(selection: $selected, label: Text("Dex")) {
					Text("All - \(fetch.pokemon.count) Pokémon").tag(0)
					Text("Generation 1 - \(fetch.Gen1.count) Pokemon").tag(1)
					Text("Generation 2 - \(fetch.Gen2.count) Pokemon").tag(2)
					Text("Generation 3 - \(fetch.Gen3.count) Pokemon").tag(3)
					Text("Generation 4 - \(fetch.Gen4.count) Pokemon").tag(4)
					Text("Generation 5 - \(fetch.Gen5.count) Pokemon").tag(5)
					Text("Generation 6 - \(fetch.Gen6.count) Pokemon").tag(6)
					Text("Generation 7 - \(fetch.Gen7.count) Pokemon").tag(7)
					Text("Generation 8 - \(fetch.Gen8.count) Pokemon").tag(8)
				}.pickerStyle(DefaultPickerStyle()).padding(.leading, 5).padding(.trailing, 5)
			}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 80, maxHeight: 80)
			if selected == 0 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.pokemon.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 1 - \(fetch.Gen1.count)")
			} else if selected == 1 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen1.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 1 - \(fetch.Gen1.count)")
			} else if selected == 2 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen2.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 2 - \(fetch.Gen2.count)")
			} else if selected == 3 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen3.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 3 - \(fetch.Gen3.count)")
			} else if selected == 4 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen4.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 4 - \(fetch.Gen4.count)")
			} else if selected == 5 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen5.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 5 - \(fetch.Gen5.count)")
			} else if selected == 6 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen6.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 6 - \(fetch.Gen6.count)")
			} else if selected == 7 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen7.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 7 - \(fetch.Gen7.count)")
			} else if selected == 8 {
				VStack(alignment: .leading, spacing: 0) {
					List(fetch.Gen8.filter {
						self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
					}) { item in
						NavigationLink(destination: PokemonView(pokemon: item).navigationBarTitle("\(item.name.english) - #\(item.pokeid)")) {
							HStack {
								Text("\(item.name.english)").font(.subheadline).bold()
								Spacer()
								URLImage(URLRequest(url: (URL(string: item.name.imgUrl)!))) { proxy in
									proxy.image
										.resizable()
										.aspectRatio(contentMode: .fill)
										.clipped()
								}
								.frame(width: 50, height: 50).padding(.bottom, 5)
							}
						}
					}.listStyle(GroupedListStyle())
				}.navigationBarTitle("Generation 8 - \(fetch.Gen8.count)")
			}
		}
	}
}

struct PokemonView: View {
	let pokemon: Pokedex!
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			List {
				if(pokemon.pokeid <= 649) {
					NavigationLink(destination: WebView(request: URLRequest(url: URL(string: pokemon.detailsUrl)!)).navigationBarTitle("\(pokemon.name.english) - #\(pokemon.pokeid)", displayMode: .inline)) {
						Text("More Information").font(.subheadline).bold()
					}
				}
				Section(header: Text("Regular & Shiny Forms").font(.subheadline).bold()) {
					HStack {
						Spacer()
						URLImage(URLRequest(url: (URL(string: pokemon.name.imgUrl)!))) { proxy in
							proxy.image
								.resizable()
								.aspectRatio(contentMode: .fill)
								.clipped()
						}
						.frame(width: 100, height: 100).padding(.bottom, 15)
						Spacer()
						Divider()
						Spacer()
						URLImage(URLRequest(url: (URL(string: pokemon.name.shinyImgUrl)!))) { proxy in
							proxy.image
								.resizable()
								.aspectRatio(contentMode: .fill)
								.clipped()
						}
						.frame(width: 100, height: 100).padding(.bottom, 15)
						Spacer()
					}
				}
				Section(header: Text("Type").font(.subheadline).bold()) {
					ForEach(pokemon.type, id: \.self) { item in
						Text(item).font(.subheadline).bold()
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
