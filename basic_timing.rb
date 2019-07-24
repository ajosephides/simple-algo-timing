require 'benchmark'

n = 10000000000
time =  Benchmark.measure { "a" * n }
puts time.total