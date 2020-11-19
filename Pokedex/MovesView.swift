//
//  MovesView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

struct MovesView: View {
    let moves: [Move]!
	@State private var searchQuery: String = ""
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			List {
				ForEach(moves) { item in
                    NavigationLink(destination: MovesDetail(move: item).navigationBarTitle("\(item.name.contains(" ") ? item.name : item.name.camelCaseToWords())")) {
                        HStack {
                            Text("\(item.name.contains(" ") ? item.name : item.name.camelCaseToWords())").font(.subheadline).bold()
                            Spacer()
                            Image(item.type.rawValue)
                        }
					}
                }.makeEmptySection()
			}.fixList()
		}
	}
}

struct MovesDetail: View {
	let move: Move!
	
	var body: some View {
		List {
			Group {
                HStack {
                    Image(move.type.rawValue)
                    Spacer()
                    if(move.kind.rawValue == "Special" || move.power == 0) {
                        Image("Special")
                    } else {
                        Image("Physical")
                    }
                }
            }.makeNewLineSection(str: "Type")
            Group {
                VStack(spacing: 0) {
                    Spacer()
                    Text("\(move.effect)").subhead()
                    Spacer()
                }
            }.makeSection(str: "Description")
            Group {
                HStack {
                    Text("Accuracy").font(.subheadline).bold()
                    Spacer()
                    Text("\(move.accuracy.rawValue == "" ? "-" : move.accuracy.rawValue)").font(.subheadline).bold().foregroundColor(.green)
                }
                HStack {
                    Text("Power").font(.subheadline).bold()
                    Spacer()
                    Text("\(String(move.power) == "0" ? "-" : String(move.power))").font(.subheadline).bold().foregroundColor(.blue)
                }
                HStack {
                    Text("PP").font(.subheadline).bold()
                    Spacer()
                    Text("\(move.pp)").font(.subheadline).bold().foregroundColor(.purple)
                }
            }.makeSection(str: "Stats")
        }.fixList()
	}
}
