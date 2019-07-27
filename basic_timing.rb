require 'benchmark'
require 'gruff'

TIMES_TO_RUN = 500
PERCENT_TO_TRIM = 10.0
ARRAY_INCREMENT = 5000
NUMBER_INCREMENTS = 100


def time(array)
  results = []
  #array.shuffle
  TIMES_TO_RUN.times{
    time =  Benchmark.measure { array.shuffle }
    results.push(time.total)
  }
  return results
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

array_sizes = {}
#means = {}
# medians = {}
# trimmed_means = {}
means = []
medians = []
trimmed_means = []
NUMBER_INCREMENTS.times do |i|
  array = (1..(i * ARRAY_INCREMENT)).to_a
  results = time(array)
  array_sizes[i] = array.length
  means.push(mean(results))
  medians.push(median(results))
  trimmed_means.push(trimmed_mean(results))
  #means[array.length] = mean(results)
  # medians[array.length] = median(results)
  # trimmed_means[array.length] = trimmed_mean(results)
end

g = Gruff::Line.new
g.title = 'A plot of benchmark means'
g.data :Mean, means
g.data :Median, medians
g.data :Trimmed_Mean, trimmed_means
g.write('means.png')