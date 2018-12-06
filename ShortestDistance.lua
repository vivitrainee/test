

local str= "joycastleisnotacastle"
local dum = 't'
--[[
    @param str 字符串
    @param dum 字符
    @ret 数组
--]]
function  shortestDistance(str,dum)
	
	if str == nil or dum == nil then
		return {}
	end

	--字符串变成数组
	local k = string.len(str)
	local list ={}
	for i=1,k do
	    list[i]=string.sub(str,i,i)
	end

	local dest = {}
	local index = 0
	for k,val in pairs(list) do
		if dum == val then
			index = index + 1
			dest[index] = k
		end
	end

	--字符不在字符串中
	if index == 0 then
		return {}
	end

	--字符串中只包含一个字符，匹配字符
	if index == 1 then
		local flag = string.find(str,dum)
		local i = 0
		local map = {}
		for pos,v in pairs(list) do
			i = i + 1
			map[i] = math.abs(flag - pos)
		end

		return map
	end

	if index > 1 then
		local map = {}
		for i,val in pairs(list) do
			local min = 99999999999
			for k,pos in pairs(dest) do
				local tmp = math.abs(i - pos)
				if tmp < min then
					min = tmp
				end
			end
			map[i] = min
		end

		return map
	end
end

local tt = shortestDistance(str,dum)
for k,v in pairs(tt) do
	print(k,v)
end