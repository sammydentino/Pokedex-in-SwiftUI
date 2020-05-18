//
//  ItemsView.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
	@ObservedObject var fetch = getItems()
	@State private var showingDetail = false
	@State private var searchQuery: String = ""
	@State private var selected = 0
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Picker("", selection: $selected) {
				Text("Pokeballs").tag(0)
				Text("Berries").tag(1)
				Text("Orbs").tag(2)
				Text("All").tag(3)
			}.pickerStyle(SegmentedPickerStyle()).padding(.leading, 17).padding(.trailing, 17).padding(.bottom, 10)
			if selected == 0 {
				List(fetch.pokeballs) { item in
					NavigationLink(destination: ItemsDetail(item: item).navigationBarTitle("\(item.name.english)")) {
						Text("\(item.name.english)").font(.subheadline).bold()
					}
				}.listStyle(GroupedListStyle())
			} else if selected == 1 {
				List(fetch.berries) { item in
					NavigationLink(destination: ItemsDetail(item: item).navigationBarTitle("\(item.name.english)")) {
						Text("\(item.name.english)").font(.subheadline).bold()
					}
				}.listStyle(GroupedListStyle())
			} else if selected == 2 {
				List(fetch.orbs) { item in
					NavigationLink(destination: ItemsDetail(item: item).navigationBarTitle("\(item.name.english)")) {
						Text("\(item.name.english)").font(.subheadline).bold()
					}
				}.listStyle(GroupedListStyle())
			} else if selected == 3 {
				VStack(alignment: .leading, spacing: 0) {
					SearchBar(text: self.$searchQuery).padding(.leading, 6).padding(.trailing, 6).padding(.bottom, 10)
					List {
						ForEach(fetch.items.filter {
							self.searchQuery.isEmpty ? true : "\($0)".contains(self.searchQuery)
						}) { item in
							NavigationLink(destination: ItemsDetail(item: item).navigationBarTitle("\(item.name.english)")) {
								Text("\(item.name.english)").font(.subheadline).bold()
							}
						}
					}.listStyle(GroupedListStyle())
				}
			}
		}
	}
}

struct ItemsDetail: View {
	let item: Items!
	
	var body: some View {
		List {
			Section(header: Text("Name Translations").font(.subheadline).bold()) {
				HStack {
					Text("Japanese").font(.subheadline).bold()
					Spacer()
					Text("\(item.name.japanese)").font(.subheadline).bold()
				}
				HStack {
					Text("Chinese").font(.subheadline).bold()
					Spacer()
					Text("\(item.name.chinese)").font(.subheadline).bold()
				}
			}
		}
	}
}
