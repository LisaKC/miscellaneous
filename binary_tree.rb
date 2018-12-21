# Run using `ruby binary_tree.rb`

def binary_tree 
	p "How many numbers should be in the tree? Enter a number from 1-100"
	array_length = gets.chomp&.to_i
	unless array_length.is_a?(Integer) && array_length.between?(0, 101)
		p "Please enter valid input."
		binary_tree
	end
	list = []
	array_length.times do
		list << rand(1000)
	end
	p make_tree(list)
end

def make_tree(list)
	sorted_list = list.sort

	@total_number_of_rows = Math.log2(list.length).ceil

	left_right_root(array: sorted_list, height: 0)
end

def left_right_root(array:, height:)
	return if height == @total_number_of_rows

	middle = array.length/2.round

	left = left_right_root(array: array[0..middle-1], height: height+1)
	right = left_right_root(array: array[middle+1..array.length], height: height+1)
	root = array[middle]

	if left.nil? && right.nil?
		return [root]
	else
		return [left, root, right]
	end
end

binary_tree
