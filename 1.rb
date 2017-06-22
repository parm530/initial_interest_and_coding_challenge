# Parmanand Sahadeo
# 06/22/17

# Question 1 -- sumOfTwo(a,b,v): You have two integer arrays: a and b, and an integer target value v. 
# Determine whether there is a pair of numbers, where one number is taken from a and the other from b, 
# that can be added together to get a sum of v. Return true if such a pair exists, otherwise return false.

# Coded using Ruby

def sumOfTwo(a, b, v)

  # create a hash that will store key-value pairs of array b
  h = {}

  # iterate over b and store a key, which is the number
  # and store the value, which is the number of occurences
  b.each do |num|
    if h[num]
      h[num] += 1
    else
      h[num] = 1
    end
  end

  # iterate over a and for each number in a
  # if the hash contains the v minus num (which is equivalent to adding num + hash[v-num] = v)
  # then return true
  a.each do |num|
    if h[v - num]
      return true
    end
  end

  # if this point is reached, there was no matching pairs
  # return false
  return false

end


# examples of testing the function

array1 = [1, 2, 5, 8, 12, 5];
array2 = [9, 3, 1, 6];

puts sumOfTwo(array1, array2, 10);
puts sumOfTwo(array1, array2, 5);
puts sumOfTwo(array1, array2, 20);
puts sumOfTwo(array1, array2, 0);


