#input array
#outpur array

#iterate through an array and add each element to the front of a new array

def aj_reverse(array)
  reversed = []
  array.each{ |value| reversed.unshift(value) }
  return reversed
end

def aj_reverse_fixed_array(array)
  reversed = Array.new(array.length)
  array.each{ |value| reversed.unshift(value) }
  return reversed
end

# iterate through array and take each item and move it to the front of the array
# no graphs for this as it took and age to run and so stopped it.
def aj_reverse2(array)
  return array.each_with_index{ |value, index| array.insert(0, array.delete_at(index)) }
end

#iterate through half of the array and swap each element with its mirror

def aj_reverse_3(array)
  number_of_iterations = (array.length / 2) - 1
  i = 0
  while i <= number_of_iterations
    temp_value_to_move = array[i]
    array[i] = array[-(i + 1)]
    array[-(i + 1)] = temp_value_to_move
    i = i + 1
  end
  return array
end