=begin
def iter_range(start, en)
    array = []
    start.step(en) { |num| array << num }
    array
end

def rec_range(start, en)
    return [] if en < start
    array = [start]
    array += rec_range(start+1, en)
    return array
end

p iter_range(0, 10)
p rec_range(0, 10)


def exp1(b, n)
    return 1 if n == 0
    b * exp1(b, n-1)
end

p exp1(2, 5)

def exp2(b, n)
    return 1 if n == 0
    if n.even?
        half = exp2(b, n/2)
        return half * half
    else
        return b * exp2(b, n-1)
    end
end 

p exp2(2, 5)
p exp2(2, 6)


class Array
    
    def deep_dup
        self.map do |el|  
            if el.is_a?(Array)
                el.deep_dup
            else
                el
            end
        end
    end
    
end

def iter_fibs(n)
    arr = [0, 1]
    while arr.length < n 
        arr << arr[-1] + arr[-2]
    end
    arr[0..n-1]
end

def rec_fibs(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    prev = rec_fibs(n-1)
    prev << prev[-1] + prev[-2]
end

p iter_fibs(5)
p rec_fibs(5)



def bsearch(arr, target)
    return nil if arr.length == 0
    mid = arr.length / 2
    return mid if arr[mid] == target
    if target > arr[mid]
        right = bsearch(arr[mid + 1..-1], target)
        return right != nil ? mid + 1 + right : nil
    else
        return bsearch(arr[0...mid], target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge(arr1, arr2)
    new_arr = []
    while arr1.length > 0 || arr2.length > 0
        if arr1.length == 0
            new_arr << arr2.shift
        elsif arr2.length == 0
            new_arr << arr1.shift
        elsif arr1[0] < arr2[0]
            new_arr << arr1.shift
        else
            new_arr << arr2.shift
        end
    end
    new_arr
end

def merge_sort(arr)
    return arr if arr.length <= 1
    mid = arr.length / 2
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..-1])
    merge(left, right)
end

p merge_sort([1, 3, 2, 9, 10, 1, 2, 3, 5, 7])


def subsets(array)
    return [[]] if array.length == 0
    new_arr = subsets(array[0..-2]) # [1 , 2 , 3]
    sets = []
    (0...new_arr.length).each do |idx|  
        sets << new_arr[idx]
        sets << new_arr[idx] + [array[-1]]
    end
    return sets
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

=end

def permutations(arr)
    return [[]] if arr.length == 0
    memo = permutations(arr[0..-2])
    new_arr = []
    memo.each do |sub|
        var = sub.length
        while var > -1
            left = sub[0...var] || []
            right = sub[var..-1] || []
            new_arr << left + [arr[-1]] + right
            var -= 1
        end
    end
    new_arr
end

p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#     [2, 1, 3], [2, 3, 1],
#     [3, 1, 2], [3, 2, 1]]


=begin
    [[]]

    [[1]]
    [[1, 2], [2, 1]]

    [[3, 1, 2], [1, 3, 2], [1, 2, 3],
    [3, 2, 1], [2, 3, 1], [2, 1, 3]]



=end    

