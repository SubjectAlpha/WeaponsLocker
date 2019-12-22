local locations = {
    [1] = Vector(130.531189, 107.633934, -12223.968750),
    [2] = Vector(-18.621889, -232.958649, -12118.156250)
}

hook.Add("Initialize", "spawn_weapon_lockers", function()
    for _,loc in pairs(locations) do
        local box = ents.Create("weapon_locker")
        if !IsValid(box) then return end
        box:SetPos(loc)
        box:Spawn()
    end
end)