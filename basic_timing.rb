require 'benchmark'

TIMES_TO_RUN = 500
PERCENT_TO_TRIM = 10.0
ARRAY_INCREMENT = 5000
NUMBER_INCREMENTS = 100


def run(array)
  results = []
  TIMES_TO_RUN.times{
    time =  Benchmark.measure { array.last }
    results.push(time.total)
  }
  puts "The mean for a #{array.length} sized array is: #{mean(results)}"
  puts "The median for a #{array.length} sized array is: #{median(results)}"
  puts "The trimmed mean for a #{array.length} sized array is: #{trimmed_mean(results)}"
end

def mean(results)
  return results.reduce(:+) / results.length
end

def median(results)
  len = results.length
  sorted = results.sort
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end

def trimmed_mean(results)
  top_tail_number = (results.length * (PERCENT_TO_TRIM / 100)).ceil
  sorted = results.sort
  sorted.pop(top_tail_number)
  sorted.shift(top_tail_number)
  return mean(sorted)
end


NUMBER_INCREMENTS.times do |i|
  array = (1..(i * ARRAY_INCREMENT)).to_a
  run(array)
end