=begin

def greedy_make_change(n, arr=[25,10,5,1])
    return [] if n == 0

    i = 0
    while n < arr[i]
        i += 1
    end
    [arr[i]] + greedy_make_change(n - arr[i])
end

p greedy_make_change(24, [10,7,1])

=end
$hash = Hash.new

def make_better_change(n, arr=[25,10,5,1])
    return $hash[n] if $hash.has_key?(n)
    return [] if n == 0
    new_arr = []
    arr.each do |coin| 
        if coin <= n
            new_arr << [coin] + make_better_change(n-coin, arr)
        end
    end 
    var = new_arr.min { |a, b| a.length <=> b.length }
    $hash[n] = var 
    var 
end


p make_better_change(11132, [10,7,1])