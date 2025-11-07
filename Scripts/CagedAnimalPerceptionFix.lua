local CagedAnimalPerceptionFixMod = GameMain:GetMod("Jai_CagedAnimalPerceptionFix")

function CagedAnimalPerceptionFixMod:OnInit()
	self:CorrectCagedAnimalsPerception()
end

function CagedAnimalPerceptionFixMod:CorrectCagedAnimalsPerception()
    xlua.private_accessible(CS.XiaWorld.TradeMgr)
	
	-- TradeMgr.m_dicGoodPool was changed to static in mobile version
    for itemPoolID, itemPool in pairs(CS.XiaWorld.TradeMgr.m_dicGoodPool) do
        for _, tradeItem in pairs(itemPool.Items) do
            if tradeItem.Animal then
                tradeItem.Animal.fivebase = ""
            end
        end
    end
end
