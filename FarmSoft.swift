
//=======================
// MARK: - Parameters
//=======================

//Argent
var money = 0.0

//La grange : Lait, Blé, Laine
var barn = ["milk": 0,"wheat": 0,"wool": 0]

//=======================
// MARK: - Activities
//=======================

func feedAnimals(){
    //Nourrir les animaux
    money -= 4
}

func sell(){
    //Ventes des produits
    money += Double(barn["milk"]!) * 0.50 // Le lait
    money += Double(barn["wheat"]!) * 0.30 // Le blé
    money += Double(barn["wool"]!) * 1 // La laine
    
    //On vide la grange
    barn = ["milk": 0,"wheat": 0,"wool": 0]
}

func milkCows(retrieving quantity: Int){
    //Traite des vaches
    barn["milk"]! += quantity
}

func harvest(retrieving quantity: Int){
    //Moisson
    barn["wheat"]! += quantity
}

func mowSheep(retrieving quantity: Int){
    //Tonte des moutons
    barn["wool"]! += quantity
}

//=======================
// MARK: - Conversation
//=======================
func readQuantity(of type: String)-> Int?{
    //On demande la quantité désirée
    print("Conbien de \(type) avez vous récupéré ?")
    
    //On convertie et on renvoie la réponse
    if let line = readLine(){
        if let quantity = Int(line){
            return quantity
        }
    }
    
    //Si la valeur n'a pas pu être interprétée, on le dit
    print("Je n'ai pas compris.")
    
    return nil
}
func addNewActivity(){
    print("Qu'avez-vous fait aujourd'hui?"
          + "\n1. 🥕 J'ai nourri mes animaux"
          + "\n2. 💰 J'ai vendu mes produits"
          + "\n3. 🐄 J'ai trait mes vaches"
          + "\n4. 🌾 J'ai moissoné"
          + "\n5. 🐑 J'ai tondu mes moutons")
    
    //On récupère la réponse de l'utilisateur
    if let choice = readLine(){
        switch choice{
        case "1": //Nourrir les animaux
            feedAnimals()
        case "2": //Vendre les produits
            sell()
        case "3": //Traire les vaches
            if let quantity = readQuantity(of: "🍼"){
                milkCows(retrieving: quantity)
            }
        case "4": //Moissonner
            if let quantity = readQuantity(of: "🌾"){
                harvest(retrieving: quantity)
            }
        case "5": //Tondre les moutons
            if let quantity = readQuantity(of: "🧶"){
                mowSheep(retrieving: quantity)
            }
        default:
            print("Je ne comprends pas.")
        }
        print("🎉 Super 🎉")
    }
}

func presentMenu(){
    print("Que voulez vous faire ?"
          + "\n1. 🤸🏼‍♀️ Enregistrer une nouvelle activité"
          + "\n2. 🏦 Consulter ma banque"
          + "\n3. 🏠 Consulter ma grange")

    if let choice = readLine(){
        switch choice{
        case "1":
            addNewActivity()
        case "2":
            print("Votre banque contient \(money) euros !")
        case "3":
            print("Votre grange contient :"
                  + "\n🍼 \(barn["milk"]!) bidons de lait"
                  + "\n🌾 \(barn["wheat"]!) bottes de blé"
                  + "\n🧶 \(barn["wool"]!) pelottes de laine")
        default:
            print("Je ne comprends pas.")
        }
    }
}

//La boucle du programme
while true{
    presentMenu()
}
