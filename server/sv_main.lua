RegisterServerEvent('ld_jobapplys:sendApply', function(input, type)
    local src = source
    local ped = GetPlayerPed(src)
    local pedCoords = GetEntityCoords(ped)
    local date = os.date('%d-%m-%Y')
    if input then
      if type == "police" then
        local embed = {
              {
                ["thumbnail"] = {
                    ["url"] = "https://static.wikia.nocookie.net/alterlifepolicedepartement/images/5/51/R_%281%29.png/revision/latest?cb=20220111090530"
                },
                ["color"] = 1127128,
                ["title"] = 'Police application',
                ["description"] = '**First and Last Names:** '..input[1]..'\n **Age:** '..input[2]..'\n **Date of Birth:** '..date..'\n **Phone number:** '..input[4]..'\n **Gender:** '..input[5]..'\n **Do you have experience in this work?:** '..input[6]..'\n **Why you want to become a police officer?:** '..input[7]..'\n\n **Discord: **'..input[8],
              }
          }
        
        PerformHttpRequest(Config.PDWebHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
      elseif type == "ems" then
        local embed = {
          {
            ["thumbnail"] = {
                ["url"] = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Star_of_life2.svg/1200px-Star_of_life2.svg.png"
            },
            ["color"] = 15991041,
            ["title"] = 'EMS application',
            ["description"] = '**First and Last Names:** '..input[1]..'\n **Age:** '..input[2]..'\n **Date of Birth:** '..date..'\n **Phone number:** '..input[4]..'\n **Gender:** '..input[5]..'\n **Do you have experience in this work?:** '..input[6]..'\n **Why you want to become a EMS?:** '..input[7]..'\n\n **Discord: **'..input[8],
          }
      }
    
      PerformHttpRequest(Config.EMSWebHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
      elseif type == "mechanic" then
        local embed = {
          {
            ["thumbnail"] = {
                ["url"] = "https://static.wikia.nocookie.net/logopedia/images/6/69/Los_Santos_Customs_%28Alt%29.png/revision/latest?cb=20221125234438"
            },
            ["color"] = 16030209,
            ["title"] = 'Mechanic application',
            ["description"] = '**First and Last Names:** '..input[1]..'\n **Age:** '..input[2]..'\n **Date of Birth:** '..date..'\n **Phone number:** '..input[4]..'\n **Gender:** '..input[5]..'\n **Do you have experience in this work?:** '..input[6]..'\n **Why you want to become a mechanic?:** '..input[7]..'\n\n **Discord: **'..input[8],
          }
        }
      
        PerformHttpRequest(Config.MechanicWebHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
      end
    end
end)