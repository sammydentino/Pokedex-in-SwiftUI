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
    let fetch: [Pokedex]!
    let fetch2: [Pokemons]!
    @State var temp: Pokedex!
	@State private var showingDetail = false
	@State private var searchQuery: String = ""
	@State private var selected = 0
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			SearchBar(text: self.$searchQuery).padding(.vertical, 10)
            List(fetch2.filter {
                self.searchQuery.isEmpty ? true : "\($0)".lowercased().contains(self.searchQuery.lowercased())
            }) { item in
                NavigationLink(destination: PokemonView(poke: item, pokemon: temp).navigationBarTitle("\(item.pokemon) - #\(item.nationalNumber)")) {
                    HStack {
                        URLImage(URLRequest(url: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(item.nationalNumber)).png")!)), delay: 0.05) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                        .frame(width: 50, height: 50).padding(.bottom, 5)
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
                            if item2.pokeid == item.nationalNumber {
                                temp = item2
                            }
                        }
                    })
                }
            }.fixList()
		}
	}
}

struct PokemonView: View {
	let poke: Pokemons!
    let pokemon: Pokedex!
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			List {
                Group {
                    HStack {
                        Image(poke.type1).resizable()
                            .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                        if(poke.type2 != "None") {
                            Image(poke.type2).resizable()
                                .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                        }
                    }
                }.makeNewLineSection(str: "Type")
				Group {
					HStack {
						Spacer()
						URLImage(URLRequest(url: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(poke.nationalNumber)).png")!))) { proxy in
							proxy.image
								.resizable()
								.aspectRatio(contentMode: .fill)
								.clipped()
						}
						.frame(width: 100, height: 100)
						Spacer()
						Divider()
						Spacer()
						URLImage(URLRequest(url: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/\(String(poke.nationalNumber)).png")!))) { proxy in
							proxy.image
								.resizable()
								.aspectRatio(contentMode: .fill)
								.clipped()
						}
						.frame(width: 100, height: 100)
						Spacer()
					}
                }.makeSection(str: "Regular & Shiny Forms")
				Group {
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
                }.makeSection(str: "Base Stats")
                Group {
                    Group {
                        HStack {
                            Image("Normal")
                            Spacer()
                            Text(String(format: "%.1f", poke.normal) + "x").subhead()
                        }
                        HStack {
                            Image("Fighting")
                            Spacer()
                            Text(String(format: "%.1f", poke.fighting) + "x").subhead()
                        }
                        HStack {
                            Image("Flying")
                            Spacer()
                            Text(String(format: "%.1f", poke.flying) + "x").subhead()
                        }
                        HStack {
                            Image("Poison")
                            Spacer()
                            Text(String(format: "%.1f", poke.poison) + "x").subhead()
                        }
                        HStack {
                            Image("Ground")
                            Spacer()
                            Text(String(format: "%.1f", poke.ground) + "x").subhead()
                        }
                        HStack {
                            Image("Rock")
                            Spacer()
                            Text(String(format: "%.1f", poke.rock) + "x").subhead()
                        }
                        HStack {
                            Image("Bug")
                            Spacer()
                            Text(String(format: "%.1f", poke.bug) + "x").subhead()
                        }
                        HStack {
                            Image("Ghost")
                            Spacer()
                            Text(String(format: "%.1f", poke.ghost) + "x").subhead()
                        }
                        HStack {
                            Image("Steel")
                            Spacer()
                            Text(String(format: "%.1f", poke.steel) + "x").subhead()
                        }
                        HStack {
                            Image("Fire")
                            Spacer()
                            Text(String(format: "%.1f", poke.fire) + "x").subhead()
                        }
                    }
                    HStack {
                        Image("Water")
                        Spacer()
                        Text(String(format: "%.1f", poke.water) + "x").subhead()
                    }
                    HStack {
                        Image("Grass")
                        Spacer()
                        Text(String(format: "%.1f", poke.grass) + "x").subhead()
                    }
                    HStack {
                        Image("Electric")
                        Spacer()
                        Text(String(format: "%.1f", poke.electric) + "x").subhead()
                    }
                    HStack {
                        Image("Psychic")
                        Spacer()
                        Text(String(format: "%.1f", poke.psychic) + "x").subhead()
                    }
                    HStack {
                        Image("Ice")
                        Spacer()
                        Text(String(format: "%.1f", poke.ice) + "x").subhead()
                    }
                    HStack {
                        Image("Dragon")
                        Spacer()
                        Text(String(format: "%.1f", poke.dragon) + "x").subhead()
                    }
                    HStack {
                        Image("Dark")
                        Spacer()
                        Text(String(format: "%.1f", poke.dark) + "x").subhead()
                    }
                    HStack {
                        Image("Fairy")
                        Spacer()
                        Text(String(format: "%.1f", poke.fairy) + "x").subhead()
                    }
                }.makeSection(str: "Effectiveness")
            }.fixList()
		}
	}
}
