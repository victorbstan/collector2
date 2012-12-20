Collector 2
==========

Problem with friends solution attempt in Ruby. Problem described at: http://bentomiso.com/blog/162/15-12-2012/Problems-with-Friends-The-Collector-II

# Problems with Friends: The Collector II

Mon, December 17 // 5:00 pm

The Mathematical Consulting Agency has sent you to Bora Bora for an extended engagement helping Ole Olaus organize his esoteric archives.

The Quai Branly has asked Olaus to send some items for display in their Oceania collection. A francophile at heart, he’s delighted by the request and wants to send his most valuable items, but he’s limited by the size of the display case. How many different algorithms can you concoct for selecting the set of items which maximizes the total value in the display case? Don’t worry about how to arrange them in the case — leave that up to the curators.

As a hint, this is isomorphic to the knapsack problem. We’ll be looking at a variety of different ways of solving this, with a focus on dynamic programming. Feel free to read ahead!

## Solution (INCOMPLETE!)

For the the case and data-set:

	CASE_VOLUME = 4

	items = [
	  { name: "A", value: 1, volume: 1 },
	  { name: "B", value: 2, volume: 1 },
	  { name: "C", value: 3, volume: 2 },
	  { name: "D", value: 1, volume: 2 },
	  { name: "E", value: 2, volume: 3 }
	]

It outputs the results:

	BEST VALUE:
	{:name=>"ABC", :value=>6, :volume=>4}

	VOLUME LIMITED:
	{:name=>"A", :value=>1, :volume=>1}
	{:name=>"AB", :value=>3, :volume=>2}
	{:name=>"ABC", :value=>6, :volume=>4}

	ALL:
	{:name=>"A", :value=>1, :volume=>1}
	{:name=>"AB", :value=>3, :volume=>2}
	{:name=>"ABC", :value=>6, :volume=>4}
	{:name=>"ABCD", :value=>7, :volume=>6}
	{:name=>"ABCDE", :value=>9, :volume=>9}
	{:name=>"B", :value=>2, :volume=>1}
	{:name=>"BC", :value=>5, :volume=>3}
	{:name=>"BCD", :value=>6, :volume=>5}
	{:name=>"BCDE", :value=>8, :volume=>8}
	{:name=>"C", :value=>3, :volume=>2}
	{:name=>"CD", :value=>4, :volume=>4}
	{:name=>"CDE", :value=>6, :volume=>7}
	{:name=>"D", :value=>1, :volume=>2}
	{:name=>"DE", :value=>3, :volume=>5}
	{:name=>"E", :value=>2, :volume=>3}
