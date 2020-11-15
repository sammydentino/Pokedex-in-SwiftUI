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
			SearchBar(text: self.$searchQuery).padding(.vertical, 10)
			List(fetch.types.filter {
                self.searchQuery.isEmpty ? true : "\($0)".lowercased().contains(self.searchQuery.lowercased())
			}) { item in
				NavigationLink(destination: TypeDetail(type: item).navigationBarTitle("\(item.name) Type")) {
                    HStack {
                        Text("\(item.name)").font(.subheadline).bold()
                        Spacer()
                        Image(item.name)
                    }
				}
			}.fixList()
		}
	}
}

struct TypeDetail: View {
	let type: Types!
	
	var body: some View {
		List {
            Image(type.name).makeNewLineSection(str: "Pokemon Type")
            if(type.strengths.count != 0) {
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
            }
		}.fixList()
	}
}
