Config = {}

Config.SprayTime = 15 --Time in seconds 

Config.Paint = {
    {
        item = 'blue_paint', --Item name
        primary_color = 83, --Primary color of item paint - See line 63 for more options.
        secondary_color = 83, --Secondary color of item paint - See line 63 for more options.
        particleColor = { --Particle color of spray from paint can
            r = 0, -- Red
            g = 0, -- Green
            b = 1.0 -- Blue
        }
    },
    {
        item = 'red_paint',
        primary_color = 39,
        secondary_color = 39, 
        particleColor = {
            r = 1.0,
            g = 0,
            b = 0
        }
    },
    {
        item = 'green_paint',
        primary_color = 128,
        secondary_color = 128,
        particleColor = {
            r = 0,
            g = 1.0,
            b = 0
        }
    },
    {
        item = 'black_paint', 
        primary_color = 12, 
        secondary_color = 12,
        particleColor = {
            r = 1.0,
            g = 1.0,
            b = 1.0,
        }
    },
    {
        item = 'white_paint', 
        primary_color = 131, 
        secondary_color = 131,
        particleColor = {
            r = 1.0,
            g = 1.0,
            b = 1.0,
        }
    },
    {
        item = 'orange_paint', 
        primary_color = 41, 
        secondary_color = 41,
        particleColor = {
            r = 1.0,
            g = 1.0,
            b = 1.0,
        }
    },
    {
        item = 'chrome_paint', 
        primary_color = 120, 
        secondary_color = 120,
        particleColor = {
            r = 1.0,
            g = 1.0,
            b = 1.0,
        }
    },
}

RegisterNetEvent('flexbuf_spray:notify')
AddEventHandler('flexbuf_spray:notify', function(message)
    TriggerClientEvent('QBCore:Notify', src, message)
end)


--[[ color code

Chrome:120 
Classic/Metallic: (Metallic just adds a Pearlescent Color of the same color to Secondary Color)
Black:0
Carbon Black:147
Graphite:1
Anhracite Black:11
Black Steel:2
Dark Steel:3
Silver:4
Bluish Silver:5
Rolled Steel:6
Shadow Silver:7
Stone Silver:8
Midnight Silver:9
Cast Iron Silver:10
Red:27
Torino Red:28
Formula Red:29
Lava Red:150
Blaze Red:30
Grace Red:31
Garnet Red:32
Sunset Red:33
Cabernet Red:34
Wine Red:143
Candy Red:35
Hot Pink:135
Pfsiter Pink:137
Salmon Pink:136
Sunrise Orange:36
Orange:38
Bright Orange:138
Gold:99
Bronze:90
Yellow:88
Race Yellow:89
Dew Yellow:91
Dark Green:49
Racing Green:50
Sea Green:51
Olive Green:52
Bright Green:53
Gasoline Green:54
Lime Green:92
Midnight Blue:141
Galaxy Blue:61
Dark Blue:62
Saxon Blue:63
Blue:64
Mariner Blue:65
Harbor Blue:66
Diamond Blue:67
Surf Blue:68
Nautical Blue:69
Racing Blue:73
Ultra Blue:70
Light Blue:74
Chocolate Brown:96
Bison Brown:101
Creeen Brown:95
Feltzer Brown:94
Maple Brown:97
Beechwood Brown:103
Sienna Brown:104
Saddle Brown:98
Moss Brown:100
Woodbeech Brown:102
Straw Brown:99
Sandy Brown:105
Bleached Brown:106
Schafter Purple:71
Spinnaker Purple:72
Midnight Purple:142
Bright Purple:145
Cream:107
Ice White:111
Frost White:112

Matte:
Black:12
Gray:13
Light Gray:14
Ice White:131
Blue:83
Dark Blue:82
Midnight Blue:84
Midnight Purple:149
Schafter Purple:148
Red:39
Dark Red:40
Orange:41
Yellow:42
Lime Green:55
Green:128
Forest Green:151
Foliage Green:155
Olive Darb:152
Dark Earth:153
Desert Tan:154
 
Metals:
Brushed Steel:117
Brushed Black Steel:118
Brushed Aluminum:119
Pure Gold:158
Brushed Gold:159

]]