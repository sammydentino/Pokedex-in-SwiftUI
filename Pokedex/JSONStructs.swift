//
//  JSON Structs.swift
//  Pokedex
//
//  Created by Sammy Dentino on 5/17/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let pokedexNumber: Int
    let pokemonName, classification: String
    let pokemonHeight, pokemonWeight: Double
    let primaryType, secondaryType: AryType
    let primaryAbility, primaryAbilityDescription, secondaryAbility, secondaryAbilityDescription: String
    let hiddenAbility, hiddenAbilityDescription: String
    let specialEventAbility: SpecialEventAbility
    let specialEventAbilityDescription: String
    let maleRatio, femaleRatio: Double
    let baseHappiness: Int
    let gameSOfOrigin: GameSOfOrigin
    let regionOfOrigin: RegionOfOrigin
    let healthStat, attackStat, defenseStat, specialAttackStat: Int
    let specialDefenseStat, speedStat, baseStatTotal, catchRate: Int
    let experienceGrowth: ExperienceGrowth
    let experienceGrowthTotal, experienceYield: Int
    let primaryEggGroup, secondaryEggGroup: AryEggGroup
    let eggCycleCount: Int
    let evolutionDetails: String

    enum CodingKeys: String, CodingKey {
        case pokedexNumber = "Pokedex Number"
        case pokemonName = "Pokemon Name"
        case classification = "Classification"
        case pokemonHeight = "Pokemon Height"
        case pokemonWeight = "Pokemon Weight"
        case primaryType = "Primary Type"
        case secondaryType = "Secondary Type"
        case primaryAbility = "Primary Ability"
        case primaryAbilityDescription = "Primary Ability Description"
        case secondaryAbility = "Secondary Ability"
        case secondaryAbilityDescription = "Secondary Ability Description"
        case hiddenAbility = "Hidden Ability"
        case hiddenAbilityDescription = "Hidden Ability Description"
        case specialEventAbility = "Special Event Ability"
        case specialEventAbilityDescription = "Special Event Ability Description"
        case maleRatio = "Male Ratio"
        case femaleRatio = "Female Ratio"
        case baseHappiness = "Base Happiness"
        case gameSOfOrigin = "Game(s) of Origin"
        case regionOfOrigin = "Region of Origin"
        case healthStat = "Health Stat"
        case attackStat = "Attack Stat"
        case defenseStat = "Defense Stat"
        case specialAttackStat = "Special Attack Stat"
        case specialDefenseStat = "Special Defense Stat"
        case speedStat = "Speed Stat"
        case baseStatTotal = "Base Stat Total"
        case catchRate = "Catch Rate"
        case experienceGrowth = "Experience Growth"
        case experienceGrowthTotal = "Experience Growth Total"
        case experienceYield = "Experience Yield"
        case primaryEggGroup = "Primary Egg Group"
        case secondaryEggGroup = "Secondary Egg Group"
        case eggCycleCount = "Egg Cycle Count"
        case evolutionDetails = "Evolution Details"
    }
}

enum ExperienceGrowth: String, Codable {
    case erratic = "Erratic"
    case fast = "Fast"
    case fluctuating = "Fluctuating"
    case mediumFast = "Medium Fast"
    case mediumSlow = "Medium Slow"
    case slow = "Slow"
}

enum GameSOfOrigin: String, Codable {
    case blackWhite = "Black / White"
    case diamondPearl = "Diamond / Pearl"
    case goldSilverCrystal = "Gold / Silver / Crystal"
    case letSGoPikachuLetSGoEevee = "Let's Go Pikachu / Let's Go Eevee"
    case redBlueYellow = "Red / Blue / Yellow"
    case rubySapphire = "Ruby / Sapphire"
    case sunMoon = "Sun / Moon"
    case swordShield = "Sword / Shield"
    case ultraSunUltraMoon = "Ultra Sun / Ultra Moon"
    case xY = "X / Y"
}

enum AryEggGroup: String, Codable {
    case amorphous = "Amorphous"
    case bug = "Bug"
    case ditto = "Ditto"
    case dragon = "Dragon"
    case empty = ""
    case fairy = "Fairy"
    case field = "Field"
    case flying = "Flying"
    case grass = "Grass"
    case humanLike = "Human-Like"
    case mineral = "Mineral"
    case monster = "Monster"
    case undiscovered = "Undiscovered"
    case water1 = "Water 1"
    case water2 = "Water 2"
    case water3 = "Water 3"
}

enum AryType: String, Codable {
    case bug = "Bug"
    case dark = "Dark"
    case dragon = "Dragon"
    case electric = "Electric"
    case empty = ""
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case flying = "Flying"
    case ghost = "Ghost"
    case grass = "Grass"
    case ground = "Ground"
    case ice = "Ice"
    case normal = "Normal"
    case poison = "Poison"
    case psychic = "Psychic"
    case rock = "Rock"
    case steel = "Steel"
    case water = "Water"
}

enum RegionOfOrigin: String, Codable {
    case alola = "Alola"
    case galar = "Galar"
    case hoenn = "Hoenn"
    case johto = "Johto"
    case kalos = "Kalos"
    case kanto = "Kanto"
    case sinnoh = "Sinnoh"
    case unova = "Unova"
}

enum SpecialEventAbility: String, Codable {
    case battleBond = "Battle Bond"
    case empty = ""
    case ownTempo = "Own Tempo"
}

struct Welcome: Codable {
    let pokemon: [Pokemons]

    enum CodingKeys: String, CodingKey {
        case pokemon = "Pokemon"
    }
}

struct Pokemons: Codable, Identifiable {
    let id = UUID()
    let nationalNumber: Int
    let pokemon: String
    let type1, type2: String
    let normal, fire, water, electric: Double
    let grass, ice, fighting, poison: Double
    let ground, flying, psychic, bug: Double
    let rock, ghost, dragon, dark: Double
    let steel, fairy: Double

    enum CodingKeys: String, CodingKey {
        case nationalNumber = "NationalNumber"
        case pokemon = "Pokemon"
        case type1 = "Type_1"
        case type2 = "Type_2"
        case normal = "Normal"
        case fire = "Fire"
        case water = "Water"
        case electric = "Electric"
        case grass = "Grass"
        case ice = "Ice"
        case fighting = "Fighting"
        case poison = "Poison"
        case ground = "Ground"
        case flying = "Flying"
        case psychic = "Psychic"
        case bug = "Bug"
        case rock = "Rock"
        case ghost = "Ghost"
        case dragon = "Dragon"
        case dark = "Dark"
        case steel = "Steel"
        case fairy = "Fairy"
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

struct TypeList : Codable {
    let types : [Type]!

    enum CodingKeys: String, CodingKey {
        case types = "Types"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        types = try values.decodeIfPresent([Type].self, forKey: .types)
    }
}

struct Type : Codable, Identifiable {
    let id = UUID()
    let en : String!
    let names : Names!
    let effectivness : Effectivness!
    let color : String!
    
    enum CodingKeys: String, CodingKey {
        case en = "en"
        case names = "names"
        case effectivness = "effectivness"
        case color = "color"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        en = try values.decodeIfPresent(String.self, forKey: .en)
        names = try values.decodeIfPresent(Names.self, forKey: .names)
        effectivness = try values.decodeIfPresent(Effectivness.self, forKey: .effectivness)
        color = try values.decodeIfPresent(String.self, forKey: .color)
    }
}

struct Names : Codable {
    let dk : String!
    let fr : String!
    let de : String!
    let gr : String!
    let it : String!
    let pl : String!
    
    enum CodingKeys: String, CodingKey {
        case dk = "dk"
        case fr = "fr"
        case de = "de"
        case gr = "gr"
        case it = "it"
        case pl = "pl"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dk = try values.decodeIfPresent(String.self, forKey: .dk)
        fr = try values.decodeIfPresent(String.self, forKey: .fr)
        de = try values.decodeIfPresent(String.self, forKey: .de)
        gr = try values.decodeIfPresent(String.self, forKey: .gr)
        it = try values.decodeIfPresent(String.self, forKey: .it)
        pl = try values.decodeIfPresent(String.self, forKey: .pl)
    }
}

struct Effectivness : Codable {
    let normal : Double!
    let fighting : Double!
    let flying : Double!
    let poison : Double!
    let ground : Double!
    let rock : Double!
    let bug : Double!
    let ghost : Double!
    let steel : Double!
    let fire : Double!
    let water : Double!
    let grass : Double!
    let electric : Double!
    let psychic : Double!
    let ice : Double!
    let dragon : Double!
    let dark : Double!
    let fairy : Double!
    
    enum CodingKeys: String, CodingKey {
        case normal = "Normal"
        case fighting = "Fighting"
        case flying = "Flying"
        case poison = "Poison"
        case ground = "Ground"
        case rock = "Rock"
        case bug = "Bug"
        case ghost = "Ghost"
        case steel = "Steel"
        case fire = "Fire"
        case water = "Water"
        case grass = "Grass"
        case electric = "Electric"
        case psychic = "Psychic"
        case ice = "Ice"
        case dragon = "Dragon"
        case dark = "Dark"
        case fairy = "Fairy"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        normal = try values.decodeIfPresent(Double.self, forKey: .normal)
        fighting = try values.decodeIfPresent(Double.self, forKey: .fighting)
        flying = try values.decodeIfPresent(Double.self, forKey: .flying)
        poison = try values.decodeIfPresent(Double.self, forKey: .poison)
        ground = try values.decodeIfPresent(Double.self, forKey: .ground)
        rock = try values.decodeIfPresent(Double.self, forKey: .rock)
        bug = try values.decodeIfPresent(Double.self, forKey: .bug)
        ghost = try values.decodeIfPresent(Double.self, forKey: .ghost)
        steel = try values.decodeIfPresent(Double.self, forKey: .steel)
        fire = try values.decodeIfPresent(Double.self, forKey: .fire)
        water = try values.decodeIfPresent(Double.self, forKey: .water)
        grass = try values.decodeIfPresent(Double.self, forKey: .grass)
        electric = try values.decodeIfPresent(Double.self, forKey: .electric)
        psychic = try values.decodeIfPresent(Double.self, forKey: .psychic)
        ice = try values.decodeIfPresent(Double.self, forKey: .ice)
        dragon = try values.decodeIfPresent(Double.self, forKey: .dragon)
        dark = try values.decodeIfPresent(Double.self, forKey: .dark)
        fairy = try values.decodeIfPresent(Double.self, forKey: .fairy)
    }
}
