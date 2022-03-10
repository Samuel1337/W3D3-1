#Problem 1: 
=begin
def sum_recur(array)
    return 0 if array.length == 0
    array[-1] + sum_recur(array[0...-1])
end

p sum_recur([1,2,3])

#Problem 2: 

def includes?(array, target)
    return false if array.length == 0
    return true if array[0] == target
    includes?(array[1..-1], target)
end

p includes?([1,2,3], 3)
p includes?([1,2,3], 4)

# Problem 3: 

def num_occur(array, target)
    return 0 if array.length == 0
    return 1 + num_occur(array[1..-1], target) if array[0] == target
    num_occur(array[1..-1], target)
end

p num_occur([1,2,3,2,1], 1)
p num_occur([1,2,3,2,1], 2)
p num_occur([1,2,3,2,1], 3)

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length < 2
    return true if array[0] + array[1] == 12
    add_to_twelve?(array[1..-1])
end

p add_to_twelve?([6,6,1,2])
p add_to_twelve?([6,5,1,2])
p add_to_twelve?([2,3,5,7])

# Problem 5: 

def sorted?(array)
    return true if array.length <= 1
    return false if array[0] > array[1]
    sorted?(array[1..-1])
end

p sorted?([1, 2, 3, 4, 5, 6, 7, 8])
p sorted?([1, 2, 3, 4, 7, 5, 8, 9])
=end
# Problem 6: 

def reverse(string)
    return "" if string.length == 0
    string[-1] + reverse(string[0..-2])
end

p reverse("huiewh fieh ihew")
