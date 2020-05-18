//
//  TypesView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

struct TypesView: View {
	@ObservedObject var fetch = getTypes()
	@State private var showingDetail = false
	@State private var searchQuery: String = ""
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			SearchBar(text: self.$searchQuery).padding(.bottom, 10)
			List(fetch.types.filter {
				self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
			}) { item in
				NavigationLink(destination: TypeDetail(type: item).navigationBarTitle("\(item.name) Type")) {
					Text("\(item.name)").font(.subheadline).bold()
				}
			}.listStyle(GroupedListStyle())
		}
	}
}

struct TypeDetail: View {
	let type: Types!
	
	var body: some View {
		List {
			Section(header: Text("Strengths").font(.subheadline).bold()) {
				if(type.strengths.count == 0) {
					Text("None").font(.subheadline).bold()
				} else {
					ForEach(type.strengths, id: \.self) { strength in
						Text("\(strength)").font(.subheadline).bold()
					}
				}
			}
			Section(header: Text("Weaknesses").font(.subheadline).bold()) {
				if(type.weaknesses.count == 0) {
					Text("None").font(.subheadline).bold()
				} else {
					ForEach(type.weaknesses, id: \.self) { weakness in
						Text("\(weakness)").font(.subheadline).bold()
					}
				}
			}
			Section(header: Text("Immunities").font(.subheadline).bold()) {
				if(type.immunes.count == 0) {
					Text("None").font(.subheadline).bold()
				} else {
					ForEach(type.immunes, id: \.self) { immune in
						Text("\(immune)").font(.subheadline).bold()
					}
				}
			}
		}.listStyle(GroupedListStyle())
	}
}
