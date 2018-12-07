
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
        local verticalPos = 0 --垂直点
        local map = {}
        for j=i + 1,length do
            local positionX = points[i].x - points[j].x
            local positionY = points[i].y - points[j].y
            --print("j====",positionX, positionY ,  j)
            if positionX == 0 and positionY == 0 then     --重复
                samePos = samePos + 1
                print("samePos --= ",samePos, i, j)
            else --斜率
                --k = (y2-y1)/(x2-x1)

                if points[i].x == points[j].x then --垂直
                    verticalPos = verticalPos + 1
                else
                    local k = positionY / positionX
                    if map[k] == nil then map[k] = 0 end
                    map[k] = map[k] + 1
                end

                --k值最大
                local maxK = 0
                for k,v in pairs(map) do
                    if maxK < v then
                        maxK = v
                    end
                end

                --垂直点和斜率相同点对比
                local tmp = maxK
                if tmp < verticalPos then
                    tmp = verticalPos 
                end

                --求最大值
                if ret < tmp then
                    ret = tmp + samePos
                else
                    ret = ret + samePos
                end


            end
        end
    end

    return ret
end


local test = { 
    {x = 1, y = 3}, 
    {x = 8, y = 2},
    {x = 7, y = 4},
    {x = 2, y = 5}, 
    {x = 1, y = 3}
}

print(maxPoints(test))