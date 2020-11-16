//
//  JSON Structs.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

struct Pokedex : Codable, Identifiable {
	let id = UUID()
	let pokeid : Int!
	let name : Name!
	let type : [String]!
	let base : BaseStats!
	var height : String = ""
	var weight : String = ""
	var baseExperience : String = ""
	var description : String = ""
	var detailsUrl: String!
    var imgUrl: String!
    var shinyUrl: String!

	enum CodingKeys: String, CodingKey {
		case pokeid = "id"
		case name = "name"
		case type = "type"
		case base = "base"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pokeid = try values.decodeIfPresent(Int.self, forKey: .pokeid) ?? 1
		name = try values.decodeIfPresent(Name.self, forKey: .name)
		type = try values.decodeIfPresent([String].self, forKey: .type) ?? ["N/A"]
		base = try values.decodeIfPresent(BaseStats.self, forKey: .base)
		detailsUrl = "https://pokedex.org/#/pokemon/\(String(pokeid))"
        imgUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(pokeid)).png"
        shinyUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/\(String(pokeid)).png"
	}
}

struct BaseStats : Codable {
	let hp : Int!
	let attack : Int!
	let defense : Int!
	let spAttack : Int!
	let spDefense : Int!
	let speed : Int!

	enum CodingKeys: String, CodingKey {
		case hp = "HP"
		case attack = "Attack"
		case defense = "Defense"
		case spAttack = "Sp. Attack"
		case spDefense = "Sp. Defense"
		case speed = "Speed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		hp = try values.decodeIfPresent(Int.self, forKey: .hp) ?? 0
		attack = try values.decodeIfPresent(Int.self, forKey: .attack) ?? 0
		defense = try values.decodeIfPresent(Int.self, forKey: .defense) ?? 0
		spAttack = try values.decodeIfPresent(Int.self, forKey: .spAttack) ?? 0
		spDefense = try values.decodeIfPresent(Int.self, forKey: .spDefense) ?? 0
		speed = try values.decodeIfPresent(Int.self, forKey: .speed) ?? 0
	}
}

struct Name : Codable {
	let english : String!
	let japanese : String!
	let chinese : String!
	let french : String!

	enum CodingKeys: String, CodingKey {
		case english = "english"
		case japanese = "japanese"
		case chinese = "chinese"
		case french = "french"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		english = try values.decodeIfPresent(String.self, forKey: .english) ?? "N/A"
		japanese = try values.decodeIfPresent(String.self, forKey: .japanese) ?? "N/A"
		chinese = try values.decodeIfPresent(String.self, forKey: .chinese) ?? "N/A"
		french = try values.decodeIfPresent(String.self, forKey: .french) ?? "N/A"
	}
}

struct Types : Codable, Identifiable {
	let id = UUID()
	let name : String!
	let immunes : [String]!
	let weaknesses : [String]!
	let strengths : [String]!

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case immunes = "immunes"
		case weaknesses = "weaknesses"
		case strengths = "strengths"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name) ?? "N/A"
		immunes = try values.decodeIfPresent([String].self, forKey: .immunes)
		weaknesses = try values.decodeIfPresent([String].self, forKey: .weaknesses)
		strengths = try values.decodeIfPresent([String].self, forKey: .strengths)
	}
}

struct Moves : Codable, Identifiable {
	let id = UUID()
	let accuracy : Int!
	let category : String!
	let cname : String!
	let ename : String!
	let moveid : Int!
	let jname : String!
	let power : Int!
	let pp : Int!
	let type : String!

	enum CodingKeys: String, CodingKey {
		case accuracy = "accuracy"
		case category = "category"
		case cname = "cname"
		case ename = "ename"
		case moveid = "id"
		case jname = "jname"
		case power = "power"
		case pp = "pp"
		case type = "type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accuracy = try values.decodeIfPresent(Int.self, forKey: .accuracy) ?? 0
		category = try values.decodeIfPresent(String.self, forKey: .category) ?? "N/A"
		cname = try values.decodeIfPresent(String.self, forKey: .cname) ?? "N/A"
		ename = try values.decodeIfPresent(String.self, forKey: .ename) ?? "N/A"
		moveid = try values.decodeIfPresent(Int.self, forKey: .moveid) ?? 0
		jname = try values.decodeIfPresent(String.self, forKey: .jname) ?? "N/A"
		power = try values.decodeIfPresent(Int.self, forKey: .power) ?? 0
		pp = try values.decodeIfPresent(Int.self, forKey: .pp) ?? 0
		type = try values.decodeIfPresent(String.self, forKey: .type) ?? "N/A"
	}
}

struct Items : Codable, Identifiable {
	let id = UUID()
	let itemid : Int!
	let name : ItemName!

	enum CodingKeys: String, CodingKey {
		case itemid = "id"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		itemid = try values.decodeIfPresent(Int.self, forKey: .itemid) ?? 0
		name = try values.decodeIfPresent(ItemName.self, forKey: .name)
	}
}

struct ItemName : Codable {
	let english : String!
	let japanese: String!
	let chinese: String!
	var nameForUrl: String!
	var url: String!

	enum CodingKeys: String, CodingKey {
		case english = "english"
		case japanese = "japanese"
		case chinese = "chinese"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		english = try values.decodeIfPresent(String.self, forKey: .english) ?? "N/A"
		japanese = try values.decodeIfPresent(String.self, forKey: .japanese) ?? "N/A"
		chinese = try values.decodeIfPresent(String.self, forKey: .chinese) ?? "N/A"
		nameForUrl = english.replacingOccurrences(of: " ", with: "-", options: .literal)
		url = "https://bulbapedia.bulbagarden.net/wiki/\(nameForUrl.lowercased())"
	}
}

/*
struct Pokemon2 : Codable, Identifiable {
	let id = UUID()
	let classin : String!
	let evo : Int!
	let gr : Int!
	let locs : Locs!
	let name : String!
	let nr : Int!
	let nrp : String!
	let types : [String]!
	var imgUrl: String!
	var shinyImgUrl: String!
	var fixedName: String!
	let pattern = "[^A-Za-z-]+"

	enum CodingKeys: String, CodingKey {
		case classin = "class"
		case evo = "evo"
		case gr = "gr"
		case locs = "locs"
		case name = "name"
		case nr = "nr"
		case nrp = "nrp"
		case types = "types"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		classin = try values.decodeIfPresent(String.self, forKey: .classin) ?? "N/A"
		evo = try values.decodeIfPresent(Int.self, forKey: .evo) ?? 0
		gr = try values.decodeIfPresent(Int.self, forKey: .gr) ?? 0
		locs = try values.decodeIfPresent(Locs.self, forKey: .locs)
		name = try values.decodeIfPresent(String.self, forKey: .name) ?? "N/A"
		nr = try values.decodeIfPresent(Int.self, forKey: .nr) ?? 0
		nrp = try values.decodeIfPresent(String.self, forKey: .nrp) ?? "N/A"
		types = try values.decodeIfPresent([String].self, forKey: .types) ?? ["N/A"]
		fixedName = name.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
		imgUrl = "https://img.pokemondb.net/sprites/home/normal/\(fixedName.lowercased()).png"
		shinyImgUrl = "https://img.pokemondb.net/sprites/home/shiny/\(fixedName.lowercased()).png"
	}
}

struct Locs : Codable {
	let sun : String!
	let moon : String!
	let x : String!
	let y : String!
	let alphaSapphire : String!
	let omegaRuby : String!

	enum CodingKeys: String, CodingKey {
		case sun = "Sun"
		case moon = "Moon"
		case x = "X"
		case y = "Y"
		case alphaSapphire = "Alpha Sapphire"
		case omegaRuby = "Omega Ruby"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sun = try values.decodeIfPresent(String.self, forKey: .sun) ?? "N/A"
		moon = try values.decodeIfPresent(String.self, forKey: .moon) ?? "N/A"
		x = try values.decodeIfPresent(String.self, forKey: .x) ?? "N/A"
		y = try values.decodeIfPresent(String.self, forKey: .y) ?? "N/A"
		alphaSapphire = try values.decodeIfPresent(String.self, forKey: .alphaSapphire) ?? "N/A"
		omegaRuby = try values.decodeIfPresent(String.self, forKey: .omegaRuby) ?? "N/A"
	}
}
*/

struct Pokemon: Codable, Identifiable {
    var id = UUID()
    var name, pokemonDescription, sprites: String
    var height, weight: Double
    var baseExperience, hp, attack, defense: Int
    var specialAttack, specialDefense, speed: Int
    var games, moves, types, abilities: String
    var holdingItem, doubleDamageAgainst, doubleDamageFrom, halfDamageAgainst: String
    var halfDamageFrom, noDamageAgainst, noDamageFrom: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case pokemonDescription = "Description"
        case sprites = "Sprites"
        case height = "Height"
        case weight = "Weight"
        case baseExperience = "Base Experience"
        case hp = "HP"
        case attack = "Attack"
        case defense = "Defense"
        case specialAttack = "Special Attack"
        case specialDefense = "Special Defense"
        case speed = "Speed"
        case games = "Games"
        case moves = "Moves"
        case types = "Types"
        case abilities = "Abilities"
        case holdingItem = "Holding Item"
        case doubleDamageAgainst = "Double Damage Against"
        case doubleDamageFrom = "Double Damage From"
        case halfDamageAgainst = "Half Damage Against"
        case halfDamageFrom = "Half Damage From"
        case noDamageAgainst = "No Damage Against"
        case noDamageFrom = "No Damage From"
    }
}
