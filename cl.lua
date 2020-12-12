ESX = nil

local Shop = {   
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_Green}, HeaderColor = {255, 255, 255}, Title = 'Apu || Magasin de Superette'},
	Data = { currentMenu = "Action Apu :", GetPlayerName()},
    Events = { 
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
      PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
      local btn = btn.name

      -- Si le button pain est appuyez sa va lui acheter l'item choisi
          if btn == "Pain" then  
      TriggerServerEvent('ryze:pay', 5, 'bread', 1)

      -- Si le button SandWich est appuyez sa va lui acheter l'item choisi
          elseif btn == "Sandwich" then  
        TriggerServerEvent('ryze:pay', 15, 'sandwich', 1)

      -- Si le button Eau est appuyez sa va lui acheter l'item choisi
      elseif btn == "Eau" then  
        TriggerServerEvent('ryze:pay', 5, 'water', 1)

      -- Si le button Coca - Cola est appuyez sa va lui acheter l'item choisi
      elseif btn == "Coca - Cola" then  
        TriggerServerEvent('ryze:pay', 5, 'soda', 1)

      -- Si le button Téléphone est appuyez sa va lui acheter l'item choisi
      elseif btn == "Téléphone" then  
        TriggerServerEvent('ryze:pay', 5, 'tel', 1)
             end 
	        end,     
	},    
	Menu = {  
		["Action Apu :"] = { 
			b = { 
              -- Si les menu la sont appuyez sa va les diriger dans la catégorie qui est ["Nom de sous menu"]
        {name = "Acheter A Manger", ask = ">>>", askX = true},        
        {name = "Acheter Des Boissons", ask = ">>>", askX = true},        
        {name = "Acheter Des Outils", ask = ">>>", askX = true},        

			}  
    },
      -- Sous menu Bouffe
    ["acheter a manger"] = { 
			b = { 
        {name = "Pain", ask = "~g~$5", askX = true},     
        {name = "Sandwich", ask = "~g~$15", askX = true},        
   
			}  
    },
      -- Sous menu Boisson
    ["acheter des Boissons"] = { 
			b = { 
        {name = "Eau", ask = "~g~$5", askX = true},      
        {name = "Coca - Cola", ask = "~g~$10", askX = true},            
   
			}  
    },

          -- Sous menu Outils
    ["acheter des outils"] = { 
			b = { 
        {name = "Téléphone", ask = "~g~$5", askX = true},                
   
			}  
    }
    
	}
}


-- Les positions a r'ajouter si vous voullez
local ryzeshops = {
  {x = 25.651, y= -1346.872, z=29.49}
}

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0) 
      for k in pairs(ryzeshops) do
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, ryzeshops[k].x, ryzeshops[k].y, ryzeshops[k].z)
          -- Si on est a 2m du point alors : 
          if dist <= 2.0 then 
      -- Notification pour appuyez sur [E]
              ESX.ShowHelpNotification("~b~Appuyez sur [E] pour accedez au magasin")
              -- Une fois appuyez sur E
              if IsControlJustPressed(1,38) then 	
              -- Le menu s'ouvre	
               CreateMenu(Shop)    
                  end
              end 
          end
      end
  end)