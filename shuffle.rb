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