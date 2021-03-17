Config = {}
Config.DrawDistance = 15
Config.Size         = {x = 0.8, y = 1.0, z = 0.5}
Config.Color        = {r = 255, g = 0, b = 0}
Config.Type         = 2
Config.OnlyFirstname     = true

-- Solde

Config.GetPlayerMoney = function(action)
    TriggerServerEvent("bank:solde", action)
end

-- Blips 

Config.Bank = {
    {x = 149.41, y = -1042.14, z = 29.36}, 
	{x=-1212.980, y=-330.841, z=37.56},
	{x=-2962.582, y=482.627, z=15.703},
	{x=-112.202, y=6469.295, z=31.626},
	{x=314.187, y=-278.621, z=54.170},
	{x=-351.534, y=-49.529, z=49.042},
	{x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
  }

  Config.Zones = {

	Shop = {
		LegalPos = {
			
			{x = 149.41,   y = -1042.14,  z = 28.36, angle = 339.52},
			{x = -1211.96,   y = -331.93,  z = 36.78, angle = 29.68},
			{x = -2961.08,   y = 482.77,  z = 14.69, angle = 86.38},
			{x = -110.20, y = 6468.97, z = 30.62, angle = 135.30},
			{x = 313.74, y = -280.50, z = 53.16, angle = 339.86},
			{x = -351.37, y = -51.3293, z = 48.03, angle = 342.74},
			{x = 1175.18, y = 2708.20, z = 37.08, angle = 178.91},
		}
	}
} 