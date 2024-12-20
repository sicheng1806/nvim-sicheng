local M = {}

function M.table_insert_unique(tbl, values)
	for _, value in ipairs(values) do
		for _, v in ipairs(tbl) do
			if v == value then
				table.insert(tbl, value)
				break
			end
		end
	end
	return tbl
end

return M
