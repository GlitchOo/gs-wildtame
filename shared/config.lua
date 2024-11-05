Config = {}

Config.Dev = false                      -- Enable/Disable Dev Commands

Config.RunawayOnFail = true             -- Should the horse run away if the player fails to tame it

Config.RaritySkill = {                  -- Skill based game based on horse rarity
    [0] = {                             -- Common Horses
        rounds = 2,
        time = { min = 10, max = 18 }
    },
    [1] = {                             -- Rare Horses
        rounds = 3,
        time = { min = 9, max = 16 }
    },
    [2] = {                             -- Legendary Horses
        rounds = 4,
        time = { min = 8, max = 12 }
    }
}