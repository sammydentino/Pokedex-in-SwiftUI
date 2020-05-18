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
			SearchBar(text: self.$searchQuery).padding(.bottom, 10)
			List {
				ForEach(fetch.moves.filter {
					self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
				}) { item in
					NavigationLink(destination: MovesDetail(move: item).navigationBarTitle("\(item.ename)")) {
						Text("\(item.ename)").font(.subheadline).bold()
					}
				}
			}.listStyle(GroupedListStyle())
		}
	}
}

struct MovesDetail: View {
	let move: Moves!
	
	var body: some View {
		List {
			Section(header: Text("Type").font(.subheadline).bold()) {
				Text("\(move.type)").font(.subheadline).bold()
			}
			Section(header: Text("Stats").font(.subheadline).bold()) {
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
			}
			Section(header: Text("Name Translations").font(.subheadline).bold()) {
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
			}
		}
	}
}
