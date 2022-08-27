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
    
    func rollForGold() {
        
    }
    
    func rollInitiative() {
        
    }
    
    func rollSavingThrow() {
        
    }
    
    func abilityCheck() {
        
    }
    
    func rollAdvantage() {
        
    }
    
    func rollDisadvantage() {
        
    }
    
    func rollAttack() {
        
    }
    
    func rollDamage() {
        
    }
    
    func rollPassiveCheck(ability:DnDAbilityType) {
        
    }
    
    /// A passive check is a special kind of ability check that doesn't involve any die rolls. Such a check can
    /// represent the average result for a task done repeatedly, such as searching for secret doors over and
    /// over again, or can be used when the DM wants to secretly determine whether the characters succeed
    /// at something without rolling dice, such as noticing a hidden monster.
    ///
    /// Here's how to determine a character's total for a passive check:
    ///
    /// `10 + all modifiers that normally apply to the check`
    ///
    /// If the character has advantage on the check, add 5. For disadvantage, subtract 5. The game refers
    /// to a passive check total as a score.
    ///
    /// For example, if a 1st-level character has a Wisdom of 15 and proficiency in Perception, he or she has
    /// a passive Wisdom (Perception) score of 14.
    ///
    /// The rules on hiding in the “Dexterity” section below rely on passive checks, as do the exploration rules.
    func rollPassiveCheck(ability:DnDAbilityType, player:DnDPlayer) -> Int {
        switch(ability) {
        case DnDAbilityType.strength:
            return player.strength.modifier + 10
        case DnDAbilityType.dexterity:
            return player.dexterity.modifier + 10
        case DnDAbilityType.constitution:
            return player.constitution.modifier + 10
        case DnDAbilityType.intelligence:
            return player.intelligence.modifier + 10
        case DnDAbilityType.wisdom:
            return player.wisdom.modifier + 10
        case DnDAbilityType.charisma:
            return player.charisma.modifier + 10
        }
    }
    
    
}

