//
//  PokemonView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 11/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI
import URLImage

struct PokemonView: View {
    let pokemon: Pokemon!
    let poke: Pokemons!
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                Group {
                    VStack(spacing: 0) {
                        Spacer()
                    HStack {
                        Text(pokemon.classification).subhead()
                        Spacer()
                        Image(poke.type1).resizable()
                            .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                        if(poke.type2 != "None") {
                            Image(poke.type2).resizable()
                                .aspectRatio(contentMode: .fill).frame(width: 40, height: 17.5)
                        }
                    }
                        Spacer()
                    }
                }.makeNewLineSection(str: "Type")
                Group {
                    HStack {
                        URLImage(URLRequest(url: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(poke.nationalNumber)).png")!)), delay: 0.05) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                        .frame(width: 150, height: 150)
                        Spacer()
                        Divider()
                        Spacer()
                        URLImage(URLRequest(url: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/\(String(poke.nationalNumber)).png")!)), delay: 0.05) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                        .frame(width: 150, height: 150)
                    }
                }.makeSection(str: "Regular & Shiny Forms")
                Group {
                    VStack(spacing: 0) {
                        Spacer()
                        HStack {
                            Text("♂").foregroundColor(.blue)
                            Text(String(format: "%.1f",pokemon.maleRatio) + "%").subhead()
                            Spacer()
                            Divider()
                            Spacer()
                            Text(String(format: "%.1f",pokemon.femaleRatio) + "%").subhead()
                            Text("♀").foregroundColor(.pink)
                        }
                        Divider().padding(.vertical)
                        HStack {
                            Text("Catch Rate").subhead()
                            Spacer()
                            Text(String(pokemon.catchRate) + "%").subhead()
                        }
                        Spacer()
                    }
                }.makeSection(str: "Gender & Catch Rates")
                Group {
                    HStack {
                        Text("HP").font(.subheadline).bold()
                        Spacer()
                        Text("\(pokemon.healthStat)").font(.subheadline).bold().foregroundColor(.red)
                    }
                    HStack {
                        Text("Attack").font(.subheadline).bold()
                        Spacer()
                        Text("\(pokemon.attackStat)").font(.subheadline).bold().foregroundColor(.orange)
                    }
                    HStack {
                        Text("Defense").font(.subheadline).bold()
                        Spacer()
                        Text("\(pokemon.defenseStat)").font(.subheadline).bold().foregroundColor(.yellow)
                    }
                    HStack {
                        Text("Sp. Attack").font(.subheadline).bold()
                        Spacer()
                        Text("\(pokemon.specialAttackStat)").font(.subheadline).bold().foregroundColor(.green)
                    }
                    HStack {
                        Text("Sp. Defense").font(.subheadline).bold()
                        Spacer()
                        Text("\(pokemon.specialDefenseStat)").font(.subheadline).bold().foregroundColor(.blue)
                    }
                    HStack {
                        Text("Speed").font(.subheadline).bold()
                        Spacer()
                        Text("\(pokemon.speedStat)").font(.subheadline).bold().foregroundColor(.purple)
                    }
                }.makeSection(str: "Base Stats")
                /*Group {
                    HStack {
                        Text("H: \(String(format: "%.1f", pokemon.pokemonHeight))").subhead()
                        Spacer()
                        Divider()
                        Spacer()
                        Text("W: \(String(format: "%.1f", pokemon.pokemonWeight))lbs").subhead()
                    }
                }.makeSection(str: "Measurements")*/
                Group {
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer()
                        Text(pokemon.primaryAbility).subhead()
                        Divider().padding(.vertical)
                        Text(pokemon.primaryAbilityDescription).subhead()
                        Spacer()
                    }
                }.makeSection(str: "Primary Ability")
                if(pokemon.secondaryAbility != "") {
                    Group {
                        VStack(alignment: .leading, spacing: 0) {
                            Spacer()
                            Text(pokemon.secondaryAbility).subhead()
                            Divider().padding(.vertical)
                            Text(pokemon.secondaryAbilityDescription).subhead()
                            Spacer()
                            
                        }
                    }.makeSection(str: "Secondary Ability")
                }
                if(pokemon.hiddenAbility != "") {
                    Group {
                        VStack(alignment: .leading, spacing: 0) {
                            Spacer()
                            Text(pokemon.hiddenAbility).subhead()
                            Divider().padding(.vertical)
                            Text(pokemon.hiddenAbilityDescription).subhead()
                            Spacer()
                            
                        }
                    }.makeSection(str: "Hidden Ability")
                }
                Group {
                    VStack(spacing: 0) {
                        Group {
                            HStack {
                                Image("Normal").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.normal) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Fighting").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.fighting) + "x").subhead().padding(.vertical, 10)
                            }
                            HStack {
                                Image("Flying").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.flying) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Poison").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.poison) + "x").subhead().padding(.vertical, 10)
                            }
                            HStack {
                                Image("Ground").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.ground) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Rock").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.rock) + "x").subhead().padding(.vertical, 10)
                            }
                            HStack {
                                Image("Bug").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.bug) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Ghost").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.ghost) + "x").subhead().padding(.vertical, 10)
                            }
                            HStack {
                                Image("Steel").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.steel) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Fire").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.fire) + "x").subhead().padding(.vertical, 10)
                            }
                        }
                        Group {
                            HStack {
                                Image("Water").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.water) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Grass").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.grass) + "x").subhead().padding(.vertical, 10)
                            }
                            HStack {
                                Image("Electric").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.electric) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Psychic").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.psychic) + "x").subhead().padding(.vertical, 10)
                            }
                            HStack {
                                Image("Ice").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.ice) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Dragon").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.dragon) + "x").subhead().padding(.vertical, 10)
                            }
                            HStack {
                                Image("Dark").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.dark) + "x").subhead().padding(.vertical, 10)
                                Divider().padding(.horizontal)
                                Image("Fairy").padding(.vertical, 10)
                                Spacer()
                                Text(String(format: "%.1f", poke.fairy) + "x").subhead().padding(.vertical, 10)
                            }
                        }
                    }
                }.makeSection(str: "Strengths & Weaknesses")
                Group {
                    HStack {
                        Text("Growth Rate").subhead()
                        Spacer()
                        Text(pokemon.experienceGrowth.rawValue).subhead()
                    }
                    HStack {
                        Text("Max EXP").subhead()
                        Spacer()
                        Text("\(pokemon.experienceGrowthTotal)").subhead()
                    }
                }.makeSection(str: "Experience Points")
            }.fixList()
        }
    }
}
