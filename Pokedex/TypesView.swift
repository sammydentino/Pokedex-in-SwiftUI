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
            Image(type.en).padding(.vertical, 10).makeNewLineSection(str: "Type Icon")
            Group {
                VStack(spacing: 0) {
                    Group {
                        HStack {
                            Image("Normal").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.normal) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Fighting").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.fighting) + "x").subhead().padding(.vertical, 10)
                        }
                        HStack {
                            Image("Flying").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.flying) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Poison").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.poison) + "x").subhead().padding(.vertical, 10)
                        }
                        HStack {
                            Image("Ground").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.ground) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Rock").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.rock) + "x").subhead().padding(.vertical, 10)
                        }
                        HStack {
                            Image("Bug").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.bug) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Ghost").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.ghost) + "x").subhead().padding(.vertical, 10)
                        }
                        HStack {
                            Image("Steel").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.steel) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Fire").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.fire) + "x").subhead().padding(.vertical, 10)
                        }
                    }
                    Group {
                        HStack {
                            Image("Water").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.water) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Grass").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.grass) + "x").subhead().padding(.vertical, 10)
                        }
                        HStack {
                            Image("Electric").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.electric) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Psychic").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.psychic) + "x").subhead().padding(.vertical, 10)
                        }
                        HStack {
                            Image("Ice").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.ice) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Dragon").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.dragon) + "x").subhead().padding(.vertical, 10)
                        }
                        HStack {
                            Image("Dark").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.dark) + "x").subhead().padding(.vertical, 10)
                            Spacer()
                            Image("Fairy").padding(.vertical, 10)
                            Spacer()
                            Text(String(format: "%.1f", type.effectivness.fairy) + "x").subhead().padding(.vertical, 10)
                        }
                    }
                }
            }.makeSection(str: "Effectiveness")
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
