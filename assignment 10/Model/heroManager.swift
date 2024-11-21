//
//  heroManager.swift
//  assignment 10
//
//  Created by Мубарак Камзаев on 18.11.2024.
//
import Foundation
import UIKit

protocol heroManagerDelegate{
    func didUpdateSuperhero(_ heroManager: heroManager, hero: HeroModel)
}

struct heroManager{
    let heroApi = "https://akabab.github.io/superhero-api/api/all.json"
    
    var delegate: heroManagerDelegate?
    
    func performRequest(){
        if let url = URL(string: heroApi){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ data, response, error in
                if let error = error{
                    print("Error: \(error.localizedDescription)")
                    return
                }
                if let safeData = data {
                    if let hero = parseJSON(heroData: safeData){
                        self.delegate!.didUpdateSuperhero(self, hero: hero)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(heroData: Data)-> HeroModel?{
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode([Superhero].self, from: heroData)
            
            if let randomHero = decoderData.randomElement(){
                let name = randomHero.name
                let image = randomHero.images.md
                let intelligence = randomHero.powerstats.intelligence
                let strength = randomHero.powerstats.strength
                let speed = randomHero.powerstats.speed
                let durability = randomHero.powerstats.durability
                let power = randomHero.powerstats.power
                let combat = randomHero.powerstats.combat
                let gender = randomHero.appearance.gender
                let race = randomHero.appearance.race
                
                let hero = HeroModel(name: name, image: image, intelligence: intelligence, strength: strength, speed: speed, durability: durability, power: power, combat: combat, gender: gender, race: race)
                return hero
            }
        }
        catch {
            print(error)
            return nil
        }
        return nil
    }
}
