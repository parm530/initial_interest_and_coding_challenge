# Parmanand Sahadeo
# 06/22/17

# Question 2 -- stringReformatting(string): The string s contains dashes that split it into 
# groups of characters. You are given an integer k that represents the number of characters 
# in groups that your output should have. Your goal is to return a new string that ]
# breaks s into groups with a length of k by placing dashes at the correct intervals.
# If necessary, the first group of characters can be shorter than k. It is guaranteed 
# that there are no consecutive dashes in s. For s = "2-4a0r7-4k" and k = 4, the output 
# should be stringReformatting(s, k) = "24a0-r74k"; The input string "2-4a0r7-4k" 
# is split into three groups with lengths of 1, 5 and 2. Since k = 4, 
# you need to split the string into two groups of 4 characters each, 
# making the output string "24a0-r74k". For s = "2-4a0r7-4k" and k = 3, 
# the output should be stringReformatting(s, k) = "24-a0r-74k". 
# Given the same input string and k = 3, split the string into groups of 2, 3, and 3 characters
#  to get the output string of "24-a0r-74k".

# Coded using Ruby

def stringReformatting(s, k)

  # create a string to be returned
  returned_string = ""

  # take the string s, remove the '-' by split("-"), then join the arrays returned from split()
  # into 1 string and then convert that string to an array of characters
  char_array = s.split("-").join("").chars()

  # char_array will be changed, break out when there is no more characters left
  while char_array.length != 0

    # if the number of chars isn't divisible by k
    # the remainder tells you how much letters to remove from the 
    # char_array so that the next iteration will result in the number
    # of chars being divisible by 0
    if char_array.length % k != 0

      # num_of_chars = the number of characters to remove from the array
      num_of_chars = char_array.length % k

      #add that to the returned string, by converting the subarray to a string
      # and appending a "-"
      returned_string = char_array[0, num_of_chars].join("") + "-"

      # update the char_array to only contain the characters that were NOT added to the string
      # this is done by slicing and replacing the char_array
      char_array = char_array[num_of_chars, char_array.length - 1]

    # now the num of chars in the array is divisible by k
    else

      # if the length of the char_array equals k, this is the last iteration and therefor 
      # won't need to append the "-"
      if char_array.length == k
        returned_string += char_array[0, k].join("")
      else

        # continue to add the next k sub-elements from the array to the returned string
        # and append the "-" 
        returned_string = returned_string + char_array[0, k].join("") + "-"
      end 

      # update the char_array by removing the characters added to the returned string
      char_array = char_array[k, char_array.length - 1]
    end

  end

  return returned_string

end

# example tests
puts stringReformatting("2-4a0r7-4k", 4)
puts stringReformatting("2-4a0r7-4k", 3)

