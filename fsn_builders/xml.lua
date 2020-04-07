local ops = {}

local meta = {}
function meta:__index(op)
	assert(ops[op], "No such function "..op.." on XML thingy")
	return function(self, ...)
		self.ops[#self.ops+1] = {op=op, args={...}}
		return self
	end
end

-- XML:insert
local function append(self, xml)
	for _, op in ipairs(xml.ops) do
		self.ops[#self.ops+1] = op
	end
	return self
end

-- XML:serialize
local function serialize(self) 
	local state = setmetatable({
		indent = 0,
		elems  = {},
		out    = '<?xml version="1.0" encoding="UTF-8"?>\n\n'
	}, {__index=ops})
	for _, op in ipairs(self.ops) do
		ops[op.op](state, table.unpack(op.args))
	end
	return state.out
end

function XML()
	return setmetatable({
		ops={},
		append=append,
		serialize=serialize
	}, meta)
end



-- Serialization
function ops:line(line)
	self.out = self.out..("  "):rep(self.indent)..line.."\n"
end

function ops:comment(msg)
	self:line(("<!-- %s -->"):format(msg))
end

-- {value="0.03"} -> 'value="0.03"'
local function attributes(attrs)
	local out = ""
	for k,v in pairs(attrs or {}) do
		out = out..(' %s="%s"'):format(tostring(k), v:gsub([["]], [[\"]]))
	end
	return out
end

function ops:void(tag, attrs)
	self:line(("<%s%s />"):format(tag, attributes(attrs)))
end

function ops:inline(tag, content, attrs)
	self:line(("<%s%s>%s</%s>"):format(tag, attributes(attrs), content, tag))
end

function ops:open(tag, attrs)
	self:line(("<%s%s>"):format(tag, attributes(attrs)))
	table.insert(self.elems, tag)
	self.indent = self.indent + 1
end

function ops:close()
	self.indent = self.indent - 1
	local tag = table.remove(self.elems)
	self:line(("</%s>"):format(tag))
end

