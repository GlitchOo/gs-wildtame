
CreateThread(function()
    local calm_event = GetHashKey('EVENT_CALM_PED')
    while true do
        local sleep = 1000
        if LocalPlayer.state.IsInSession then

            local ped = PlayerPedId()
            local mount = GetMount(ped)

            if mount then
                local horse = Entity(mount).state
                if GetAnimalIsWild(mount) == 1 then
                    sleep = 0
                    horse.isTamed = false
                    local size = GetNumberOfEvents(0)
                    if size > 0 then
                        for i = 0, size - 1 do
                            local event = GetEventAtIndex(0, i) --SCRIPT_EVENT_QUEUE_AI (CEventGroupScriptAI)

                            if event == calm_event then
                                local rarity = GetAnimalRarity(mount)
                                local skill = Config.RaritySkill[rarity] or Config.RaritySkill[0]
                
                                local rounds = 0
                                local failed = false

                                repeat
                                    local success = exports['skillcheck']:StartLockPickCircle(1, math.random(skill.time.min, skill.time.max))
                                    failed = not success
                                    rounds = rounds + 1
                                until failed or rounds >= skill.rounds

                                if failed then
                                    HorseAgitate(mount, true)
                                    Wait(2500)
                                    SetAnimalIsWild(mount, true)
                                    if Config.RunawayOnFail then
                                        TaskFleePed(mount, ped, 4, -1, -1, -1, 0)
                                    end
                                else
                                    horse.isTamed = true
                                    SetAnimalIsWild(mount, false)
                                    print('Tamed')
                                end
                            end
                        end
                    end
                else
                    -- Kick player off of horse if it's not tamed and they waited too long
                    if not horse.isTamed then
                        HorseAgitate(mount, true)
                        Wait(2500)
                        SetAnimalIsWild(mount, true)
                        if Config.RunawayOnFail then
                            TaskFleePed(mount, ped, 4, -1, -1, -1, 0)
                        end
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

if Config.Dev then
    RegisterCommand('setwild', function()
        local ped = PlayerPedId()
        local mount = GetMount(ped)
        if mount then
            SetAnimalIsWild(mount, true)
        end
    end)
end