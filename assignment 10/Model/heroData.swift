//
//  hero.swift
//  assignment 10
//
//  Created by Мубарак Камзаев on 18.11.2024.
//

struct Superhero: Decodable {
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let images: Images
}

struct Powerstats: Decodable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Appearance: Decodable {
    let gender: String
    let race: String?
}

struct Images: Decodable {
    let xs: String
    let sm: String
    let md: String
    let lg: String
}
