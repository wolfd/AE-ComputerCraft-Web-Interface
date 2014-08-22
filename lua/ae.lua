base_url = ''
ae_side = 'back'

ae = peripheral.wrap(ae_side)
items = ae.getAvailableItems()

function items_to_json_http(items, status)
  response = ''
  for i, item in ipairs(items) do
    response = response .. 
    '{' ..
    ' "id": "' .. item.id .. ':' .. item.dmg .. '",' ..
    ' "mc_id": ' .. item.id .. ',' ..
    ' "dmg": ' .. item.dmg .. ',' ..
    ' "qty": ' .. item.qty .. ',' ..
    ' "name": "' .. item.name .. '",' ..
    ' "raw_name": "' .. item.rawName .. '",' ..
    ' "max_dmg": ' .. item.maxdmg .. '' ..
    '},'
  end
  return 'data=[' .. response .. ']&status=' .. status
end

function page_items(items)
  items_length = table.getn(items)
  pages = math.ceil(items_length / 50)
  for i = 0, pages - 1 do
    item_page = {}
    for j = 1, 50 do
      item_page[j] = items[i*50 + j]
    end

    if i == 1 then
      status = 'begin'
    elseif i == pages - 1
      status = 'end'
    else
      status = 'chunk'
    end
    json_blob = items_to_json_http(item_page, status)
    post_items(json_blob)
  end
  
end


function post_items(string)
  response = http.post(base_url .. '/items', string)
  print(response)
end

page_items(items)
