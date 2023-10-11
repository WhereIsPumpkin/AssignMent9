class SuperEnemy {
    let name: String
    var hitPoints: Int

    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get set }
    var superPowers: [String: Int] { get }

    func attack(target: SuperEnemy) -> Int
    mutating func performSuperPower(target: SuperEnemy) -> Int
}

extension Superhero {
    func printSuperheroInfo() {
        print("🦸 Superhero Name: \(name)")
        print("Alias: \(alias)")
        print("Is Evil: \(isEvil ? "Yes" : "No")")
       
        if superPowers.isEmpty {
            print("No superpowers remaining.")
        } else {
            print("Remaining Superpowers:")
            for (power, damage) in superPowers {
                print("⚡ \(power): Damage \(damage)")
            }
            print("-------------------")
        }
    }
}

struct NihilisticMan: Superhero {
    let name = "Mr Void"
    let alias = "DepressionClub"
    var isEvil = false
    var superPowers: [String: Int] = [
        "Existential Enigma": 50,
        "Nietzschean Nightmare": 45,
        "Dostoevsky Dilemma": 40
    ]

    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }

    mutating func performSuperPower(target: SuperEnemy) -> Int {
        let superPower = superPowers.randomElement()!
        target.hitPoints -= superPower.value
        superPowers.removeValue(forKey: superPower.key)
        return target.hitPoints
    }
}

struct CodeMan: Superhero {
    let name = "Code-Man"
    let alias = "Anonymus"
    var isEvil = false
    var superPowers: [String: Int] = [
        "Algorithm Attack": 60,
        "Binary Bash": 55,
        "Data Structure Slam": 50
    ]

    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }

    mutating func performSuperPower(target: SuperEnemy) -> Int {
        let superPower = superPowers.randomElement()!
        target.hitPoints -= superPower.value
        superPowers.removeValue(forKey: superPower.key)
        return target.hitPoints
    }
}

struct QuantumMan: Superhero {
    let name = "Dr. Quantum"
    let alias = "ScienceClub"
    var isEvil = false
    var superPowers: [String: Int] = [
        "Particle Pounce": 50,
        "Wave Function Whack": 45,
        "Schrodinger's Scratch": 40
    ]

    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }

    mutating func performSuperPower(target: SuperEnemy) -> Int {
        let superPower = superPowers.randomElement()!
        target.hitPoints -= superPower.value
        superPowers.removeValue(forKey: superPower.key)
        return target.hitPoints
    }
}

class SuperheroSquad {
    var superheroes: [Superhero]

    init(superheroes: [Superhero]) {
        self.superheroes = superheroes
    }

    func listSuperheroes() {
        print("🦸‍♂️ Superhero Squad:")
        print("----------------")
        for superhero in superheroes {
            superhero.printSuperheroInfo()
        }
    }
}

func simulateShowdown(enemy: SuperEnemy, superSquad: SuperheroSquad) {
    var enemyIsDefeated = false
    
    while enemy.hitPoints > 0 {
        var allHeroesTurnedEvil = true
        for i in superSquad.superheroes.indices {
            if !superSquad.superheroes[i].superPowers.isEmpty {
                var superHero = superSquad.superheroes[i].name
                var healthLeft = superSquad.superheroes[i].performSuperPower(target: enemy)
                print("💥 \(superHero) performed a super-power. Enemy health Is: \(healthLeft) 🏥")
                if healthLeft <= 0 {
                    enemyIsDefeated = true
                    break
                }
                allHeroesTurnedEvil = false
            } else if !superSquad.superheroes[i].isEvil {
                var healthLeft = superSquad.superheroes[i].attack(target: enemy)
                print("👊 SuperHeroes using their last attack. Enemy health is: \(healthLeft) 🏥")
                superSquad.superheroes[i].isEvil = true
                if healthLeft <= 0 {
                    enemyIsDefeated = true
                    break
                }
            }
        }
        if allHeroesTurnedEvil || enemyIsDefeated {
            break
        }
    }
    if enemyIsDefeated {
        print("💥 Super Squad Won")
    } else {
        print("👹 Enemy Won")
    }
}

let nihilisticMan = NihilisticMan()
let codeMan = CodeMan()
let quantumMan = QuantumMan()

let superEnemy = SuperEnemy(name: "Super Villain", hitPoints: 700)
let superheroSquad = SuperheroSquad(superheroes: [nihilisticMan, codeMan, quantumMan])

superheroSquad.listSuperheroes()

simulateShowdown(enemy: superEnemy, superSquad: superheroSquad)

