AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("weapon_locker_use")
util.AddNetworkString("weapon_locker_give")

local delay = 2
local nextOccurance = 0

function ENT:Initialize()
    self:SetModel("models/Items/ammocrate_smg1.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()

    if(phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Use(activator)
    if activator:IsValid() and activator:IsPlayer() then
        local timeLeft = nextOccurance - CurTime()
        if timeLeft < 0 then
            net.Start("weapon_locker_use")
            net.WriteEntity(activator)
            net.Send(activator)
            nextOccurance = CurTime() + delay
        end
    end
end

net.Receive("weapon_locker_give", function(len, ply) 
    local weapon = net.ReadString()
    if weapon == "shotgun" then
        ply:Give("m9k_remington870")
    elseif weapon == "grenade" then
        ply:Give("m9k_m61_frag")
        ply:GiveAmmo(5, "grenade")
    elseif weapon == "lmg" then
        ply:Give("m9k_m249lmg")
    elseif weapon == "ar1" then
        ply:Give("m9k_m416")
    elseif weapon == "ar2" then
        ply:Give("m9k_g36")
    elseif weapon == "dmr" then
        ply:Give("m9k_m16a4_acog")
    elseif weapon == "fillammo" then
        ply:GiveAmmo(180, "ar2")
        ply:GiveAmmo(30, "pistol")
    end
end)