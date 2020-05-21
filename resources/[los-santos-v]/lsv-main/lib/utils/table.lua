function table.range(n, begin)
	local t = { }

	for i = begin or 0, n do
		table.insert(t, i)
	end

	return t
end

function table.length(t)
	local length = 0

	for _ in pairs(t) do
		length = length + 1
	end

	return length
end

function table.clear(t)
	for k, _ in pairs(t) do
		t[k] = nil
	end
end

function table.foreach(t, func)
	for k, v in pairs(t) do
		func(v ,k)
	end
end

function table.iforeach(t, func)
	for k, v in ipairs(t) do
		func(v, k)
	end
end

function table.count(t, value)
	local count = 0

	for k, v in pairs(t) do
		if v == value then
			count = count + 1
		end
	end

	return count
end

function table.icount(t, value)
	local count = 0

	for k, v in ipairs(t) do
		if v == value then
			count = count + 1
		end
	end

	return count
end

function table.count_if(t, func)
	local count = 0

	for k, v in pairs(t) do
		if func(v, k) then
			count = count + 1
		end
	end

	return count
end

function table.icount_if(t, func)
	local count = 0

	for k, v in ipairs(t) do
		if func(v, k) then
			count = count + 1
		end
	end

	return count
end

function table.random(t)
	local keys = { }

	table.foreach(t, function(_, k)
		table.insert(keys, k)
	end)

	local i = keys[math.random(#keys)]
	return t[i], i
end

function table.irandom_n(t, n)
	local result = { }

	local keys = { }
	local count = #t

	while #result ~= n do
		local k = math.random(count)
		if not keys[k] then
			table.insert(result, t[k])
			keys[k] = true
		end
	end

	return result
end


function table.find(t, value)
	for k, v in pairs(t) do
		if v == value then
			return k, v
		end
	end

	return nil
end

function table.ifind(t, value)
	for k, v in ipairs(t) do
		if v == value then
			return k, v
		end
	end

	return nil
end

function table.try_remove(t, value)
	local k = table.find(t, value)
	if k then
		table.remove(t, k)
		return true
	end

	return false
end

function table.find_if(t, func)
	for k, v in pairs(t) do
		if func(v, k) then
			return v, k
		end
	end

	return nil
end

function table.ifind_if(t, func)
	for k, v in ipairs(t) do
		if func(v, k) then
			return v, k
		end
	end

	return nil
end

function table.filter(t, func)
	local result = { }

	table.foreach(t, function(v, k)
		if func(v, k) then
			result[k] = v
		end
	end)

	return result
end

function table.ifilter(t, func)
	local result = { }

	table.iforeach(t, function(v, k)
		if func(v, k) then
			table.insert(result, v)
		end
	end)

	return result
end

function table.map(t, func)
	local result = { }

	table.foreach(t, function(v, k)
		result[k] = func(v, k)
	end)

	return result
end

function table.every(t, func)
	for k, v in pairs(t) do
		if not func(v, k) then
			return false
		end
	end

	return true
end

function table.some(t, func)
	for k, v in pairs(t) do
		if func(v, k) then
			return true
		end
	end

	return false
end

function table.isome(t, func)
	for k, v in ipairs(t) do
		if func(v, k) then
			return true
		end
	end

	return false
end

function table.reduce(t, func, initialValue)
	local result = initialValue or t[1]
	local index = initialValue and 1 or 2

	for i = index, #t do
		result = result + func(result, t[i], i)
	end

	return result
end

function table.slice(t, i, j)
	local result = { }

	for k = i, j do
		table.insert(result, t[k])
	end

	return result
end
