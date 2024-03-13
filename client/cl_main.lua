CreateThread(function()
    for k,v in pairs(Config.Applys) do
        if Config.Target == "OX" then
            exports.ox_target:addBoxZone({
                name = v.name,
                coords = vec4(v.coords.x, v.coords.y, v.coords.z, v.coords.w),
                size = vec3(0.75, 0.75, 4.0),
                rotation = 0.0,
                options = {
                    {
                        onSelect = function()
                            TriggerEvent('ld_jobapplys:openApply', v.type)
                        end,
                        icon = 'fa-solid fa-circle',
                        label = 'Job application',
                    }
                }
            })
        elseif Config.Target == "QB" then
            exports['qb-target']:AddBoxZone(v.name, vector3(v.coords.x, v.coords.y, v.coords.z-1), 1, 1, {
                name = v.name,
                heading = v.coords.w,
                debugPoly = false,
                minZ = v.coords.z-1,
                maxZ = v.coords.z+1,
            }, {
                options = {
                    {
                        name = 'v.name',
                        action = function()
                            TriggerEvent('ld_jobapplys:openApply', v.type)
                        end,
                        icon = 'fa-solid fa-shield',
                        label = "Job application",
                    }
                },
                distance = 2.3
            })
        end
        if v.ped then
            local modelHash = GetHashKey(v.pedModel)
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Wait(1)
            end
            local ped = CreatePed(1, modelHash, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
        end
    end
end)

RegisterNetEvent('ld_jobapplys:openApply', function(type)
    if type == "ems" then
        local input = lib.inputDialog('Application for EMS', {
            {type = 'input', label = 'First and last names', description = 'Your names here...', required = true},
            {type = 'number', label = 'Whats your age?', description = 'Your age here..', required = true},
            {type = 'date', label = 'Date Of Birth', icon = {'far', 'calendar'}, format = "DD/MM/YYYY", required = true},
            {type = 'input', label = 'Your phone number', description = 'Your phone number here...', required = true},
            {type = 'select', label = 'Gender', options = {
                {value = 'Male', label = 'Male'},
                {value = 'Woman', label = 'Woman'}
            }, required = true},
            {type = 'select', label = 'Do you have experience in this work?', options = {
                {value = 'Yes', label = 'Yes'},
                {value = 'No', label = 'No'}
            }, required = true},
            {type = 'textarea', label = 'Why you want to become a EMS?', required = true, min = 10, max = 300},
            {type = 'input', label = 'Discord:', required = true},
          })
    
         TriggerServerEvent('ld_jobapplys:sendApply', input, "ems")
    elseif type == "police" then
        local input = lib.inputDialog('Application for Police Job', {
            {type = 'input', label = 'First and last names', description = 'Your names here...', required = true},
            {type = 'number', label = 'Whats your age?', description = 'Your age here..', required = true},
            {type = 'date', label = 'Date Of Birth', icon = {'far', 'calendar'}, format = "DD/MM/YYYY", required = true},
            {type = 'input', label = 'Your phone number', description = 'Your phone number here...', required = true},
            {type = 'select', label = 'Gender', options = {
                {value = 'Male', label = 'Male'},
                {value = 'Woman', label = 'Woman'}
            }, required = true},
            {type = 'select', label = 'Do you have experience in this work?', options = {
                {value = 'Yes', label = 'Yes'},
                {value = 'No', label = 'No'}
            }, required = true},
            {type = 'textarea', label = 'Why you want to become a police officer?', required = true, min = 10, max = 300},
            {type = 'input', label = 'Discord:', required = true},
          })
    
         TriggerServerEvent('ld_jobapplys:sendApply', input, "police")
    elseif type == "mechanic" then
        local input = lib.inputDialog('Application for Mechanic', {
            {type = 'input', label = 'First and last names', description = 'Your names here...', required = true},
            {type = 'number', label = 'Whats your age?', description = 'Your age here..', required = true},
            {type = 'date', label = 'Date Of Birth', icon = {'far', 'calendar'}, format = "DD/MM/YYYY", required = true},
            {type = 'input', label = 'Your phone number', description = 'Your phone number here...', required = true},
            {type = 'select', label = 'Gender', options = {
                {value = 'Male', label = 'Male'},
                {value = 'Woman', label = 'Woman'}
            }, required = true},
            {type = 'select', label = 'Do you have experience in this work?', options = {
                {value = 'Yes', label = 'Yes'},
                {value = 'No', label = 'No'}
            }, required = true},
            {type = 'textarea', label = 'Why you want to become a mechanic?', required = true, min = 10, max = 300},
            {type = 'input', label = 'Discord:', required = true},
          })
    
         TriggerServerEvent('ld_jobapplys:sendApply', input, "mechanic")
    end
end)