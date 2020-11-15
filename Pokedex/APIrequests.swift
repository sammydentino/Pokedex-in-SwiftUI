//
//  APIrequests.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

class getPokedex : ObservableObject {
	@Published var pokemon : [Pokedex]!
	@Published var Gen1: [Pokedex]!
	@Published var Gen2: [Pokedex]!
	@Published var Gen3: [Pokedex]!
	@Published var Gen4: [Pokedex]!
	@Published var Gen5: [Pokedex]!
	@Published var Gen6: [Pokedex]!
	@Published var Gen7: [Pokedex]!
	@Published var Gen8: [Pokedex]!
	
	init() {
		loadPokedex()
		Gen1 = Array(pokemon.prefix(151))
		Gen2 = Array((pokemon.prefix(251)).suffix(100))
		Gen3 = Array((pokemon.prefix(386)).suffix(135))
		Gen4 = Array((pokemon.prefix(493)).suffix(107))
		Gen5 = Array((pokemon.prefix(649)).suffix(156))
		Gen6 = Array((pokemon.prefix(721)).suffix(72))
		Gen7 = Array(pokemon.prefix(809).suffix(88))
		Gen8 = Array(pokemon.suffix(84))
	}
	
	func loadPokedex() {
		let urlString = "https://raw.githubusercontent.com/sammydentino/pokemon.json/master/pokedex.json"
		
		if let url = URL(string: urlString) {
			if let d = try? Data(contentsOf: url) {
				// we're OK to parse!
				let decoder = JSONDecoder()
				if let data = try? decoder.decode([Pokedex].self, from: d) {
					pokemon = data
				}
			}
		}
	}
}

class getItems: ObservableObject {
	@Published var items: [Items]!
	@Published var pokeballs: [Items]!
	@Published var berries: [Items]!
	@Published var incenses: [Items]!
	@Published var scarfs: [Items]!
	@Published var drives: [Items]!
	@Published var orbs: [Items]!
	@Published var plates: [Items]!
	@Published var tms: [Items]!
	@Published var hms: [Items]!
	
	init() {
		loadItems()
		items = Array(items.suffix(items.count - 1))
		pokeballs = items.filter({ item in
			return item.name.english.suffix(4) == "Ball"
		})
		berries = items.filter({ item in
			return item.name.english.suffix(5) == "Berry"
		})
		incenses = items.filter({ item in
			return item.name.english.suffix(7) == "Incense"
		})
		scarfs = items.filter({ item in
			return item.name.english.suffix(5) == "Scarf"
		})
		orbs = items.filter({ item in
			return item.name.english.suffix(3) == "Orb"
		})
		plates = items.filter({ item in
			return item.name.english.suffix(5) == "Plate"
		})
		tms = items.filter({ item in
			return item.name.english.prefix(2) == "TM"
		})
		hms = items.filter({ item in
			return item.name.english.prefix(2) == "HM"
		})
	}
	
	func loadItems() {
		let urlString = "https://raw.githubusercontent.com/sammydentino/pokemon.json/master/items.json"
		
		if let url = URL(string: urlString) {
			if let d = try? Data(contentsOf: url) {
				// we're OK to parse!
				let decoder = JSONDecoder()
				if let data = try? decoder.decode([Items].self, from: d) {
					items = data
				}
			}
		}
	}
}

class getMoves: ObservableObject {
	@Published var moves: [Moves]!
	
	init() {
		loadMoves()
        moves = moves.sorted {
            $0.ename < $1.ename
        }
	}
	
	func loadMoves() {
		let urlString = "https://raw.githubusercontent.com/sammydentino/pokemon.json/master/moves.json"
		
		if let url = URL(string: urlString) {
			if let d = try? Data(contentsOf: url) {
				// we're OK to parse!
				let decoder = JSONDecoder()
				if let data = try? decoder.decode([Moves].self, from: d) {
					moves = data
				}
			}
		}
	}
}

class getTypes: ObservableObject {
	@Published var types: [Types]!
	
	init() {
		loadTypes()
	}
	
	func loadTypes() {
		let urlString = "https://raw.githubusercontent.com/sammydentino/pokemon-type-chart/master/types.json"
		
		if let url = URL(string: urlString) {
			if let d = try? Data(contentsOf: url) {
				// we're OK to parse!
				let decoder = JSONDecoder()
				if let data = try? decoder.decode([Types].self, from: d) {
					types = data
				}
			}
		}
	}
}
