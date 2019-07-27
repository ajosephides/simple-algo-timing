require 'benchmark'

TIMES_TO_RUN = 50
PERCENT_TO_TRIM = 10.0

results = []

TIMES_TO_RUN.times{
  n = 100000000
  time =  Benchmark.measure { "a" * n }
  results.push(time.total)
}


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

puts "The mean is: #{mean(results)}"
puts "The median is: #{median(results)}"
puts "The trimmed mean is: #{trimmed_mean(results)}"