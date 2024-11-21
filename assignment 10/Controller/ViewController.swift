//
//  ViewController.swift
//  assignment 10
//
//  Created by Мубарак Камзаев on 18.11.2024.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, heroManagerDelegate {
    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroGender: UILabel!
    @IBOutlet weak var heroRace: UILabel!
    @IBOutlet weak var heroPower: UILabel!
    @IBOutlet weak var heroIntelligence: UILabel!
    @IBOutlet weak var heroDurability: UILabel!
    @IBOutlet weak var heroCombat: UILabel!
    @IBOutlet weak var heroSpeed: UILabel!
    @IBOutlet weak var heroStrenght: UILabel!
    
    var HeroManager = heroManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeroManager.delegate = self
        HeroManager.performRequest()
    }
    @IBAction func rollButtonPressed(_ sender: Any) {
        HeroManager.performRequest()
    }
    
    func didUpdateSuperhero(_ heroManager: heroManager, hero: HeroModel) {
        DispatchQueue.main.async {
            self.heroName.text = hero.name
            self.heroGender.text = hero.gender
            self.heroRace.text = hero.race
            self.heroPower.text = "Power: \(hero.power)"
            self.heroIntelligence.text = "Intelligence: \(hero.intelligence)"
            self.heroDurability.text = "Durability: \(hero.durability)"
            self.heroCombat.text = "Combat: \(hero.combat)"
            self.heroSpeed.text = "Speed: \(hero.speed)"
            self.heroStrenght.text = "Strenght: \(hero.strength)"
            let imageURL = URL(string: hero.image)
            self.heroImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "loadingImage"))
        }
    }


}

