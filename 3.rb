# Parmanand Sahadeo
# 06/22/17

# Question 3 -- getClosingParen(sentence, openingParenIndex): 
# "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing." 
# Write a function that, given a sentence like the one above, along with the position of an opening parenthesis, 
# finds the corresponding closing parenthesis. Example: if the example string above is 
# input with the number 10 (position of the first parenthesis), the output should be 79 (position of the last parenthesis).

# Coded using Ruby


def getClosingParen(sentence, openingParenIndex)

  # created counter variable used later in the program for iteration'
  # created a hash structure with keys: "(" or ")"
  # whose values are an array of indexes of where each key is located
  counter = 0
  parenHash = {}
  parenHash['('] = []
  parenHash[')'] = []

  # array contains the entire string converted into an array
  array = sentence.split("")

  # this iteration inserts the index of the parenthese into the value array
  # corresponding to the keys "(" and ")"
  array.each_with_index do |char, index|
    if char == ')'
      parenHash[char] << index
    elsif char == '('
      parenHash[char] << index
    end
  end

  # created a sorted array from the values of the hash
  # in order to do the following logic in the while loop...
  parenArray = parenHash.values.flatten.sort

  while parenArray.length > 0

    # if the current element in the parenArray is an open paren AND the next element is a 
    # close paren, then because they are sorted in this manner, they are an appropriate pair
    # of parens
    if parenHash['('].include?(parenArray[counter]) and parenHash[')'].include?(parenArray[counter+1])

      # if the current paren is the one we are looking for, just return the next element
      # which is it's closing paren
      if parenArray[counter] == openingParenIndex
        return parenArray[counter+1]
      else

        # if it is not the one we are looking for, delete this pair of parens
        parenArray.delete_at(counter)
        parenArray.delete_at(counter)
      end

    # if we approach the end of the parenArray, reset the counter
    elsif parenArray[counter] == parenArray[-1]
      counter = 0

    # else move on to the next element, because it needs a closing paren
    else
      counter += 1
    end
  end

end

# example test
puts getClosingParen("Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.", 10)