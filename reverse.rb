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
