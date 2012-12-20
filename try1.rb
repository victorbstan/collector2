# Problems with Friends: The Collector II

# Mon, December 17 // 5:00 pm

# The Mathematical Consulting Agency has sent you to Bora Bora for an extended engagement helping Ole Olaus organize his esoteric archives.

# The Quai Branly has asked Olaus to send some items for display in their Oceania collection. A francophile at heart, he’s delighted by the request and wants to send his most valuable items, but he’s limited by the size of the display case. How many different algorithms can you concoct for selecting the set of items which maximizes the total value in the display case? Don’t worry about how to arrange them in the case — leave that up to the curators.

# As a hint, this is isomorphic to the knapsack problem. We’ll be looking at a variety of different ways of solving this, with a focus on dynamic programming. Feel free to read ahead!

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
	# take the first item and itterativley integrate the next item
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

process_items(items) # perform calculation

# create list of items that fit in the max specified volume, sort by volume
volume_restricted_items = @collection.take_while {|i| i[:volume] <= CASE_VOLUME}

# pick final item by best value criteria
best_value_items = volume_restricted_items.sort_by{|i| i[:value]}.last

# output
print "\nBEST VALUE:\n#{best_value_items}\n"
print "\nVOLUME LIMITED:\n#{volume_restricted_items.join("\n")}\n"
print "\nALL:\n#{@collection.join("\n")}\n"
