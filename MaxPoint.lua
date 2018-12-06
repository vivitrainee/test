--[[
    @param points 点数组
    @ret 返回maxPoint
--]]
function maxPoints(points)

    --排空处理
    if points == nil then
        return 0
    end
    
    local length = #points
    local CONST_ZERO = 0 --没有点
    local CONST_ONE  = 1 --只有一个点

    if length == CONST_ZERO then
        return 0
    end

    if length == CONST_ONE then
        return 1
    end

    local ret = 2
    for i=1,length do
        local samePos=0   --记录重复点
        local sameSlope = 1 --斜率相同的点，第一个点
        for j=i + 1,length do
            local positionX = points[i].x-points[j].x
            local positionY = points[i].y-points[j].y
            if positionX == 0 and positionY == 0 then     --重复
                samePos = samePos + 1
            else --斜率
				sameSlope = sameSlope + 1
				for  k=j+1,length do
					local positionX2 = points[k].x - points[i].x;
					local positionY2 = points[k].y - points[i].y;
					if positionX*positionY2 == positionY*positionX2 then
						sameSlope = sameSlope + 1
					end
				end

            end
        end

        local tmp = samePos + sameSlope
        if ret < tmp then
            ret = tmp
        end
        sameSlope = 1
    end

    return ret
end


local test = { 
    {x = 1, y = 3}, 
    {x = 1, y = 3},
    {x = 1, y = 3},
    {x = 1, y = 3}, 
    {x = 1, y = 3}
}

print(maxPoints(test))
