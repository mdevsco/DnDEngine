public struct DnDEngine {
    var players: [DnDPlayer]

   
    func startCombatSession(monsters: [DnDMonster]) -> DnDCombatSession {
        // 1. Determine Surprise
        /// The GM determines if any participant in the combat is surprised, if they are they
        /// cannot move, take actions or reactions until the first round of combat has concluded.
        
        // 2. Establish Positions
        /// Given the adventurers’ stated positions the GM decides where their adversaries
        /// are (how far away and in what direction).
        
        // 3. Roll Initiative
        /// At the start of combat, an initiative check must be performed (adding their Dexterity
        /// modifier), to determine the order in which combat ensues. Higher rolls go first ties
        /// are decided by the GM.
        
        return DnDCombatSession()
    }
    
    func rollInitiative() {
        
    }
    
    
}

