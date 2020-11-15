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
	var imgUrl: String!
	var shinyImgUrl: String!
	var fixedName: String!
	let pattern = "[^A-Za-z]+"

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
		fixedName = english.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
		imgUrl = "https://img.pokemondb.net/sprites/home/normal/\(fixedName.lowercased()).png"
		shinyImgUrl = "https://img.pokemondb.net/sprites/home/shiny/\(fixedName.lowercased()).png"
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

// MARK: - PokemonList
struct PokemonList: Codable {
    var count: Int
    var next: String
    //var previous: JSONNull?
    var results: [Result]
}

// MARK: - Result
struct Result: Codable {
    //var id = UUID()
    var name: String
    var url: String
}

// MARK: - Pokemon
struct Pokemon: Codable {
    var abilities: [Ability]
    var baseExperience: Int
    var forms: [Species]
    var gameIndices: [GameIndex]
    var height: Int
    var heldItems: [JSONAny]
    var id: Int
    var isDefault: Bool
    var locationAreaEncounters: String
    var moves: [Move]
    var name: String
    var order: Int
    var species: Species
    var sprites: Sprites
    var stats: [Stat]
    var types: [TypeElement]
    var weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order, species, sprites, stats, types, weight
    }
}

// MARK: - Ability
struct Ability: Codable {
    var ability: Species
    var isHidden: Bool
    var slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    var name: String
    var url: String
}

// MARK: - GameIndex
struct GameIndex: Codable {
    var gameIndex: Int
    var version: Species

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: - Move
struct Move: Codable {
    var move: Species
    var versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    var levelLearnedAt: Int
    var moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    var blackWhite: Sprites

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    var diamondPearl, heartgoldSoulsilver, platinum: Sprites

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: - Versions
struct Versions: Codable {
    var generationI: GenerationI
    var generationIi: GenerationIi
    var generationIii: GenerationIii
    var generationIv: GenerationIv
    var generationV: GenerationV
    var generationVi: [String: GenerationVi]
    var generationVii: GenerationVii
    var generationViii: GenerationViii

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - Sprites
class Sprites: Codable {
    var backDefault: String
    var backFemale: JSONNull?
    var backShiny: String
    var backShinyFemale: JSONNull?
    var frontDefault: String
    var frontFemale: JSONNull?
    var frontShiny: String
    var frontShinyFemale: JSONNull?
    var other: Other?
    var versions: Versions?
    var animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions, animated
    }

    init(backDefault: String, backFemale: JSONNull?, backShiny: String, backShinyFemale: JSONNull?, frontDefault: String, frontFemale: JSONNull?, frontShiny: String, frontShinyFemale: JSONNull?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    var redBlue, yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    var backDefault, backGray, frontDefault, frontGray: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    var crystal, gold, silver: Crystal
}

// MARK: - Crystal
struct Crystal: Codable {
    var backDefault, backShiny, frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    var emerald: Emerald
    var fireredLeafgreen, rubySapphire: Crystal

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - Emerald
struct Emerald: Codable {
    var frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - GenerationVi
struct GenerationVi: Codable {
    var frontDefault: String
    var frontFemale: JSONNull?
    var frontShiny: String
    var frontShinyFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    var icons: DreamWorld
    var ultraSunUltraMoon: GenerationVi

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    var frontDefault: String
    var frontFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    var icons: DreamWorld
}

// MARK: - Other
struct Other: Codable {
    var dreamWorld: DreamWorld
    var officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    var frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Stat
struct Stat: Codable {
    var baseStat, effort: Int
    var stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    var slot: Int
    var type: Species
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

