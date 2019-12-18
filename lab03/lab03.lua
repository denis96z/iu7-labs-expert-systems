function trapezioid(left_start, left_max, right_max, right_end, value)
    value = value or 1 
    return function(x)
        if x <= left_start then
            return 0
        elseif x <= left_max then
            return (x - left_start) / (left_max - left_start) * value
        elseif x <= right_max then
            return value
        elseif x <= right_end then
            return (right_end - x) / (right_end - right_max) * value
        end
        return 0
    end
end

function triangle(left, right, value)
    middle = (left + right) / 2
    return trapezioid(left, middle, middle, right, value)
end

function constant(left, right, value)
    return function(x)
        return (x < left or x > right) and 0 or value
    end
end

function and_min(left, right)
    return function(x)
	return math.min(left(x), right(x))
    end
end

function and_prod(left, right)
    return function(x)
	return left(x) * right(x)
    end
end

function or_max(left, right)
    return function(x)
	return math.max(left(x), right(x))
    end
end

function and_prod(left, right)
    return function(x)
	lx, rx = left(x), right(x)
	return (lx + rx) - (lx * rx)
    end
end

function integrate(f, a, b, h)
    s = (f(a) + f(b)) / 2
    for i = 1, math.floor((b - a) / h) - 1 do
	y = f(a + (i * h))
        s = s + y
    end
    return s * h
end


print(integrate(function(x) return x end, 0, 1, 1e-1))
