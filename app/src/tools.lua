function math_round(num, len)
    if num then
        local mult = 10^(len or 0)
        return math.floor(num * mult + 0.5) / mult
    else
        return nil
    end
end

function notify_st(body)
    push_state(body)
end

function math_average(t)
    if t then
        local sum = 0
        for _,v in pairs(t) do -- Get the sum of all numbers in t
            sum = sum + v
        end
        return sum / #t
    else
        return nil
    end

end