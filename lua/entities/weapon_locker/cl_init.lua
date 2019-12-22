include("shared.lua")


function ENT:Draw()
    self:DrawModel()
end

net.Receive("weapon_locker_use", function(len) 
    local ply = net.ReadEntity()
    
    if ply:IsValid() and ply:IsPlayer() then
        local Frame = vgui.Create( "DFrame" )
        Frame:SetPos( (ScrW() / 2) - 160, (ScrH() / 2) - 80 )
        Frame:SetSize(320, 160)
        Frame:SetTitle("Weapons Locker")
        Frame:SetVisible(true)
        Frame:SetDraggable(false)
        Frame:ShowCloseButton(true)
        Frame:MakePopup()

        local shotgunButton = vgui.Create("DButton", Frame)
        shotgunButton:SetText("Give R870")
        shotgunButton:SetPos(5,25)
        shotgunButton:SetSize(100,30)

        shotgunButton.DoClick = function()
            net.Start("weapon_locker_give")
            net.WriteString("shotgun")
            net.SendToServer()
        end

        local ar1Button = vgui.Create("DButton", Frame)
        ar1Button:SetText("Give M416")
        ar1Button:SetPos(110,25)
        ar1Button:SetSize(100,30)

        ar1Button.DoClick = function()
            net.Start("weapon_locker_give")
            net.WriteString("ar1")
            net.SendToServer()
        end

        local ar2Button = vgui.Create("DButton", Frame)
        ar2Button:SetText("Give G36")
        ar2Button:SetPos(215,25)
        ar2Button:SetSize(100,30)

        ar2Button.DoClick = function()
            net.Start("weapon_locker_give")
            net.WriteString("ar2")
            net.SendToServer()
        end

        local dmrButton = vgui.Create("DButton", Frame)
        dmrButton:SetText("Give M16 ACOG")
        dmrButton:SetPos(5,60)
        dmrButton:SetSize(100,30)

        dmrButton.DoClick = function()
            net.Start("weapon_locker_give")
            net.WriteString("dmr")
            net.SendToServer()
        end

        local lmgButton = vgui.Create("DButton", Frame)
        lmgButton:SetText("Give M249")
        lmgButton:SetPos(110,60)
        lmgButton:SetSize(100,30)

        lmgButton.DoClick = function()
            net.Start("weapon_locker_give")
            net.WriteString("lmg")
            net.SendToServer()
        end

        local grenadeButton = vgui.Create("DButton", Frame)
        grenadeButton:SetText("Give Grenades")
        grenadeButton:SetPos(215,60)
        grenadeButton:SetSize(100,30)

        grenadeButton.DoClick = function()
            net.Start("weapon_locker_give")
            net.WriteString("grenade")
            net.SendToServer()
        end

        local fillButton = vgui.Create("DButton", Frame)
        fillButton:SetText("Fill Ammo")
        fillButton:SetPos(5,95)
        fillButton:SetSize(310,60)

        fillButton.DoClick = function()
            net.Start("weapon_locker_give")
            net.WriteString("fillammo")
            net.SendToServer()
        end
    end
end)