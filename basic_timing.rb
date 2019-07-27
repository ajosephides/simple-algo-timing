require 'benchmark'
require 'gruff'

TIMES_TO_RUN = 50
PERCENT_TO_TRIM = 10.0
ARRAY_INCREMENT = 50000
NUMBER_INCREMENTS = 10
array_sizes = {}
@means_hash = {}
@medians_hash = {}
@trimmed_means_hash = {}
@means = []
@medians = []
@trimmed_means = []

def run
  NUMBER_INCREMENTS.times do |i|
    array = set_up_array(i)
    results = time(array)
    populate_results(results, array.length)
  end
end

def plot_line
  g = Gruff::Line.new
  g.title = 'A plot of benchmark means'
  g.data :Mean, @means
  g.data :Median, @medians
  g.data :Trimmed_Mean, @trimmed_means
  g.write('algo_timings.png')
end

private

def time(array)
  results = []
  TIMES_TO_RUN.times{
    time =  Benchmark.measure { array.last }
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

def set_up_array(increment)
  array = (1..(increment * ARRAY_INCREMENT)).to_a
  array.shuffle!
end

def populate_results(results, size)
  @means.push(mean(results))
  @medians.push(median(results))
  @trimmed_means.push(trimmed_mean(results))
  @means_hash[size] = mean(results)
  @medians_hash[size] = median(results)
  @trimmed_means_hash[size] = trimmed_mean(results)
end



run
plot_line