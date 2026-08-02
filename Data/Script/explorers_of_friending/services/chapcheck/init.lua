require 'origin.services.baseservice'

local Chapcheck = Class('Chapcheck', BaseService)

function Chapcheck:GameCheck()
  if type(SV.Story.flag) == "number" then
    PrintInfo("Chapter " .. SV.Story.chap .. ", part " .. SV.Story.sect .. ", with a flag of " .. SV.Story.flag)
  elseif type(SV.Story.flag) == "table" then
    PrintInfo("Chapter " .. SV.Story.chap .. ", part " .. SV.Story.sect .. ", with a flag of... wait... ")
    PrintInfo("The flag is a table!")
    for i = 1, #SV.Story.flag, 1 do
      PrintInfo(SV.Story.flag[i])
    end
  else
    PrintInfo("Chapter " .. SV.Story.chap .. ", part " .. SV.Story.sect .. ", with a flag of... wait... ")
    PrintInfo("What type of flag is this?")
  end
end

function Chapcheck:Subscribe(med)
  med:Subscribe("Chapcheck", EngineServiceEvents.GroundMapInit, function() self:GameCheck() end)
end

function Chapcheck:UnSubscribe(med)
end

SCRIPT:AddService("Chapcheck", Chapcheck:new())
return RexioScan