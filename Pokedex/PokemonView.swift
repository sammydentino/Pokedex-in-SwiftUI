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
                    HStack {
                        Text("♂").foregroundColor(.blue).subhead()
                        Text(String(format: "%.1f",pokemon.maleRatio) + "%").subhead()
                        Spacer()
                        Divider()
                        Spacer()
                        Text(String(format: "%.1f",pokemon.femaleRatio) + "%").subhead()
                        Text("♀").foregroundColor(.pink).subhead()
                    }
                }.makeSection(str: "Gender")
                /*Group {
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer()
                        Text(pokemon.primaryAbility).subhead()
                        Spacer()
                        Text(pokemon.primaryAbilityDescription).subhead()
                        Spacer()
                        if(pokemon.secondaryAbility != "") {
                            Divider()
                            Spacer()
                            Text(pokemon.secondaryAbility).subhead()
                            if(pokemon.secondaryAbilityDescription != "") {
                                Text(pokemon.secondaryAbilityDescription).subhead()
                            }
                        }
                    }
                }.makeSection(str: "Abilities")*/
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
