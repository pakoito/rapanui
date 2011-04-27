----------------------------------------------------------------
-- RapaNui Framework 0.1
--
----------------------------------------------------------------
module(..., package.seeall)

MOVE = "move"
ROTATE = "rotate"

-- Create a New Transition Object
function RNTransition:new(o)
	o = o or {
		name = ""
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

mainSprite = nil


function RNTransition:run(type, sprite, props)

	if (props.x ~= nil) then
	--print("x value:" .. props.x)
	end

	if (props.y ~= nil) then
	--print("y value:" .. props.y)
	end

	if (type == MOVE) then
		local px, py = sprite:getProp():getLoc();
		print("click x: " .. props.x .. " y: " .. props.y)
		print("prop  x: " .. px .. " y: " .. py)
		local deltax = self:getDelta(px, props.x )
		local deltay = self:getDelta(py, props.y)

		if (props.x < px) then
			deltax = (-1) * deltax
		end

		if (props.y < py) then
			deltay = (-1) * deltay
		end



		sprite:getProp():moveLoc(deltax, deltay, 2)
	end

	if (type == ROTATE) then
		local action = sprite:getProp():moveRot(-360, 2)
	end
end




function RNTransition:getDelta(a, b)
	if (a > b) then
		return a - b
	else
		return b - a
	end
end