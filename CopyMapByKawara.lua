-- =============================================
--     COPY MAP BY KAWARASTUDIO
--     Executor : Xeno / Any Synapse Support
-- =============================================

local synsaveinstance = loadstring(game:HttpGet("https://raw.githubusercontent.com/luau/UniversalSynSaveInstance/main/saveinstance.luau", true))()

-- Ambil nama game otomatis
local function getCleanGameName()
    local success, name = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end)
    
    if success and name then
        -- Bersihkan nama agar aman untuk file
        local clean = name:gsub("[%s%c%p]", "_")
        clean = clean:gsub("__+", "_")
        clean = clean:sub(1, 100) -- Batasi panjang nama
        return clean
    else
        return "Unknown_Map"
    end
end

local GameName = getCleanGameName()
local Timestamp = os.date("%Y%m%d_%H%M%S")

local Options = {
    Name = "COPYMAP_" .. GameName .. "_" .. Timestamp,
    SaveTerrain = false,
    DecompileScripts = true,
    SaveBytecode = true,           -- Disarankan false agar lebih cepat
    SafeMode = true,
    Timeout = 100,
    
    -- Extra Options (UniversalSynSaveInstance)
    RemoveLocked = true,
    RemoveScripts = false,          -- Ubah jadi true jika tidak mau ikut script
    IncludeServices = true,
}

print("===========================================")
print("     COPY MAP BY KAWARASTUDIO")
print("===========================================")
print("📌 Game Name : " .. GameName)
print("📁 File Name : " .. Options.Name .. ".rbxl")
print("🚀 Sedang menyalin map... Harap tunggu!")
print("===========================================")

synsaveinstance(Options)

print("✅ Berhasil! Map telah disimpan.")
print("📂 Cek folder: Xeno Workspace")
print("===========================================")
