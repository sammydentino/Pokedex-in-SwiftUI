//
//  MovesView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

struct MovesView: View {
	@ObservedObject var fetch = getMoves()
	@State private var showingDetail = false
	@State private var searchQuery: String = ""
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			SearchBar(text: self.$searchQuery).padding(.vertical, 10)
			List {
				ForEach(fetch.moves.filter {
                    self.searchQuery.isEmpty ? true : "\($0)".lowercased().contains(self.searchQuery.lowercased())
				}) { item in
					NavigationLink(destination: MovesDetail(move: item).navigationBarTitle("\(item.ename)")) {
                        HStack {
                            Text("\(item.ename)").font(.subheadline).bold()
                            Spacer()
                            Image(item.type)
                        }
					}
				}
			}.fixList()
		}
	}
}

struct MovesDetail: View {
	let move: Moves!
	
	var body: some View {
		List {
			Group {
                HStack {
                    Image(move.type)
                    Spacer()
                    if(move.power == 0) {
                        Image("Special")
                    } else {
                        Image("Physical")
                    }
                }
            }.makeNewLineSection(str: "Type")
			Group {
				HStack {
					Text("Accuracy").font(.subheadline).bold()
					Spacer()
					Text("\(move.accuracy)").font(.subheadline).bold().foregroundColor(.green)
				}
				HStack {
					Text("Power").font(.subheadline).bold()
					Spacer()
					Text("\(move.power)").font(.subheadline).bold().foregroundColor(.blue)
				}
				HStack {
					Text("PP").font(.subheadline).bold()
					Spacer()
					Text("\(move.pp)").font(.subheadline).bold().foregroundColor(.purple)
				}
            }.makeSection(str: "Stats")
			Group {
				HStack {
					Text("Japanese").font(.subheadline).bold()
					Spacer()
					Text("\(move.jname)").font(.subheadline).bold()
				}
				HStack {
					Text("Chinese").font(.subheadline).bold()
					Spacer()
					Text("\(move.cname)").font(.subheadline).bold()
				}
            }.makeSection(str: "Name Translations")
        }.fixList()
	}
}
