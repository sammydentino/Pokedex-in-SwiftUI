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

struct Results : Codable {
    var pokemon : [Pokemon]

    enum CodingKeys: String, CodingKey {

        case pokemon = "Pokemon"
    }

}

struct Pokemon : Codable, Identifiable {
    /*private static var idSequence = sequence(first: 1, next: {$0 + 1})
    let id: Int*/
    let id = UUID()
    let name : String!
    let description : String!
    var sprites : String!
    let height : Double!
    let weight : Double!
    let HP : Int!
    let attack : Int!
    let defense : Int!
    let specialAttack : Int!
    let specialDefense : Int!
    let speed : Int!
    let games : String!
    let moves : String!
    var movesArr: [String]!
    let types : String!
    var typesArr: [String]!
    let abilities : String!
    var abilitiesArr: [String]!
    let holdingItem : String!
    let doubleDamageAgainst : String!
    var doubleDamageAgainstArr: [String]!
    let doubleDamageFrom : String!
    var doubleDamageFromArr: [String]!
    let halfDamageAgainst : String!
    var halfDamageAgainstArr: [String]!
    let halfDamageFrom : String!
    var halfDamageFromArr: [String]!
    let noDamageAgainst : String!
    var noDamageAgainstArr: [String]!
    let noDamageFrom : String!
    var noDamageFromArr: [String]!
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case description = "Description"
        case sprites = "Sprites"
        case height = "Height"
        case weight = "Weight"
        case HP = "HP"
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //id = Pokemon.idSequence.next()!
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "N/A"
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? "N/A"
        sprites = try values.decodeIfPresent(String.self, forKey: .sprites) ?? "N/A"
        height = try values.decodeIfPresent(Double.self, forKey: .height) ?? 0.0
        weight = try values.decodeIfPresent(Double.self, forKey: .weight) ?? 0.0
        HP = try values.decodeIfPresent(Int.self, forKey: .HP) ?? 0
        attack = try values.decodeIfPresent(Int.self, forKey: .attack) ?? 0
        defense = try values.decodeIfPresent(Int.self, forKey: .defense) ?? 0
        specialAttack = try values.decodeIfPresent(Int.self, forKey: .specialAttack) ?? 0
        specialDefense = try values.decodeIfPresent(Int.self, forKey: .specialDefense) ?? 0
        speed = try values.decodeIfPresent(Int.self, forKey: .speed) ?? 0
        games = try values.decodeIfPresent(String.self, forKey: .games) ?? "N/A"
        moves = try values.decodeIfPresent(String.self, forKey: .moves) ?? "N/A"
        types = try values.decodeIfPresent(String.self, forKey: .types) ?? "N/A"
        abilities = try values.decodeIfPresent(String.self, forKey: .abilities) ?? "N/A"
        holdingItem = try values.decodeIfPresent(String.self, forKey: .holdingItem) ?? "N/A"
        doubleDamageAgainst = try values.decodeIfPresent(String.self, forKey: .doubleDamageAgainst) ?? "N/A"
        doubleDamageFrom = try values.decodeIfPresent(String.self, forKey: .doubleDamageFrom) ?? "N/A"
        halfDamageAgainst = try values.decodeIfPresent(String.self, forKey: .halfDamageAgainst) ?? "N/A"
        halfDamageFrom = try values.decodeIfPresent(String.self, forKey: .halfDamageFrom) ?? "N/A"
        noDamageAgainst = try values.decodeIfPresent(String.self, forKey: .noDamageAgainst) ?? "N/A"
        noDamageFrom = try values.decodeIfPresent(String.self, forKey: .noDamageFrom) ?? "N/A"
        movesArr = moves.components(separatedBy: ",")
        typesArr = types.components(separatedBy: ",")
        abilitiesArr = abilities.components(separatedBy: ",")
        doubleDamageAgainstArr = doubleDamageAgainst.components(separatedBy: ",")
        doubleDamageFromArr = doubleDamageFrom.components(separatedBy: ",")
        halfDamageAgainstArr = halfDamageAgainst.components(separatedBy: ",")
        halfDamageFromArr = halfDamageFrom.components(separatedBy: ",")
        noDamageAgainstArr = noDamageAgainst.components(separatedBy: ",")
        noDamageFromArr = noDamageFrom.components(separatedBy: ",")
        sprites = sprites.components(separatedBy: ".")[0]
    }
}

struct Welcome: Codable {
    let pokemon: [Pokemons]

    enum CodingKeys: String, CodingKey {
        case pokemon = "Pokemon"
    }
}

// MARK: - Pokemon
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

enum TypeEnum: String, Codable {
    case bug = "Bug"
    case dark = "Dark"
    case dragon = "Dragon"
    case electric = "Electric"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case flying = "Flying"
    case ghost = "Ghost"
    case grass = "Grass"
    case ground = "Ground"
    case ice = "Ice"
    case none = "None"
    case normal = "Normal"
    case poison = "Poison"
    case psychic = "Psychic"
    case rock = "Rock"
    case steel = "Steel"
    case water = "Water"
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
