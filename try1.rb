CASE_VOLUME = 4

items = [
  { name: "A", value: 1, volume: 1 },
  { name: "B", value: 2, volume: 1 },
  { name: "C", value: 3, volume: 2 },
  { name: "D", value: 1, volume: 2 },
  { name: "E", value: 2, volume: 3 }
]

@collection = []

def merge2items(item1, item2)
  if item1 && item2
    {
      name: (item1[:name] + item2[:name]),
      value: (item1[:value] + item2[:value]),
      volume: (item1[:volume] + item2[:volume])
    }
  end
end

def integrate(items)
  # take the first item and iteratively integrate the next items,
  # collect results in an array
  memo = nil
  result = []
  items.each do |i|
    memo = merge2items(memo, i) || i
    result << memo
  end
  result
end

def process_items(items_list)
  @collection.concat integrate(items_list)
  process_items(items_list.drop(1)) unless items_list.size == 1
end

process_items(items) # start

# create list of items that fit in the max specified volume, sort by volume
volume_restricted_items = @collection.take_while {|i| i[:volume] <= CASE_VOLUME}

# pick final item by best value criteria
best_value_items = volume_restricted_items.sort_by{|i| i[:value]}.last

# output
print "\nBEST VALUE:\n#{best_value_items}\n"
print "\nVOLUME LIMITED:\n#{volume_restricted_items.join("\n")}\n"
print "\nALL:\n#{@collection.join("\n")}\n"
