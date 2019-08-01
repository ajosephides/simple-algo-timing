# input array
# output array

#randomly pick an element of the array
# move it to another random part of the array

def aj_shuffle(array)
  array_length = array.length
  #originally had it at the full length of the array but this went on for an age. Check if a 5% shuffle is enough?
  (array_length * 0.05).ceil.times do |i|
    array = array.insert(rand(array_length), array.delete_at(rand(array_length)))
  end
  return array
end

# another attempt. empty array. pick an element from the original at random and pop it onto the new array
# works fine on a small array but crashes on anything large.
def aj_shuffle_2(array, shuffled = [])
  if array.length > 0
    random_index = rand(array.length)
    shuffled.push(array[random_index])
    array.delete_at(random_index)
    aj_shuffle_2(array, shuffled)  
  else
    return shuffled
  end
end

# same idea as 2 but without recursion
def aj_shuffle_3(array)
  shuffled = []
  while array.length > 0
    random_index = rand(array.length)
    shuffled.push(array[random_index])
    array.delete_at(random_index)
  end
  return shuffled
end

# same idea as 2 & 3 but convert to a hash first.
# ran for too long so cancelled
def aj_shuffle_4(array)
  shuffled = []
  temp_hash = {}
  array.each_with_index {|value, index| temp_hash[index] = value}
  while temp_hash.length > 0
    keys = temp_hash.keys
    random_index = rand(keys.length)
    random_key = keys[random_index]
    shuffled.push(temp_hash[random_key])
    temp_hash.delete(random_key)
  end
  return shuffled
end

# the entry from wikipedia.
# loop through from the end and swap with a random index elsewhere in array
def fisher_yates_shuffle(array)
  upper = array.length - 1

  upper.downto(1).each do |current_index|
    random_index = rand(current_index + 1)

    temp = array[random_index]
    array[random_index] = array[current_index]
    array[current_index] = temp
  end
  return array
end 
