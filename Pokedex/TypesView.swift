//
//  TypesView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

struct TypesView: View {
    let types: [Type]!
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
            List {
                ForEach(types) { item in
                    NavigationLink(destination: TypeDetail(type: item).navigationBarTitle("\(item.en) Type")) {
                        HStack {
                            Text("\(item.en)").font(.subheadline).bold()
                            Spacer()
                            Image(item.en)
                        }
                    }
                }.makeEmptySection()
			}.fixList()
		}
	}
}

struct TypeDetail: View {
	let type: Type!
	
	var body: some View {
		List {
            Group {
                Group {
                    HStack {
                        Image("Normal")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.normal) + "x").subhead()
                    }
                    HStack {
                        Image("Fighting")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.fighting) + "x").subhead()
                    }
                    HStack {
                        Image("Flying")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.flying) + "x").subhead()
                    }
                    HStack {
                        Image("Poison")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.poison) + "x").subhead()
                    }
                    HStack {
                        Image("Ground")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.ground) + "x").subhead()
                    }
                    HStack {
                        Image("Rock")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.rock) + "x").subhead()
                    }
                    HStack {
                        Image("Bug")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.bug) + "x").subhead()
                    }
                    HStack {
                        Image("Ghost")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.ghost) + "x").subhead()
                    }
                    HStack {
                        Image("Steel")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.steel) + "x").subhead()
                    }
                    HStack {
                        Image("Fire")
                        Spacer()
                        Text(String(format: "%.1f", type.effectivness.fire) + "x").subhead()
                    }
                }
                HStack {
                    Image("Water")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.water) + "x").subhead()
                }
                HStack {
                    Image("Grass")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.grass) + "x").subhead()
                }
                HStack {
                    Image("Electric")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.electric) + "x").subhead()
                }
                HStack {
                    Image("Psychic")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.psychic) + "x").subhead()
                }
                HStack {
                    Image("Ice")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.ice) + "x").subhead()
                }
                HStack {
                    Image("Dragon")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.dragon) + "x").subhead()
                }
                HStack {
                    Image("Dark")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.dark) + "x").subhead()
                }
                HStack {
                    Image("Fairy")
                    Spacer()
                    Text(String(format: "%.1f", type.effectivness.fairy) + "x").subhead()
                }
            }.makeNewLineSection(str: "Effectiveness")
            /*if(type.strengths.count != 0) {
                Group {
                    ForEach(type.strengths, id: \.self) { strength in
                        Image(strength)
                    }
                }.makeSection(str: "Strong Against")
            }
            if(type.weaknesses.count != 0) {
                Group {
                    ForEach(type.weaknesses, id: \.self) { weakness in
                        Image(weakness)
                    }
                }.makeSection(str: "Weak Against")
            }
            if(type.immunes.count != 0) {
                Group {
                    ForEach(type.immunes, id: \.self) { immune in
                        Image(immune)
                    }
                }.makeSection(str: "No Affect Against")
            }*/
		}.fixList()
	}
}
