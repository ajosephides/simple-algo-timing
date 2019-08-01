# Introduction

A script that will take a trial algorithm and run a number of times on array's of integers (currently) of varying size.
The product will be a graphical plot of time (y-axis) vs array size (x)

# Approach
### Input:
 - algorithm to run
 - Name of algorithm

### Output
 - A plot of mean, median and trimmed mean for multiple different array sizes

### Process
 - create array of sequential numbers
 - shuffle
 - run algo x number of times and measure (using ruby benchmark) this time taken for each
 - add each entry into an array and order
 - calculate mean, median and trimmed mean for a given array size
 - repeat the process with a larger sized array
 - once complete plot result

# Setup
 Make sure you have installed **imagemagick** before running bundle. If using OSX Mojave try this:
 `brew install imagemagick@6 && brew link imagemagick@6 --force`

 Within the basic_timing script you can alter the following:
- *TIMES_TO_RUN*: the number of time to run the algorithm on each array
- *PERCENT_TO_TRIM*: when calculating the trimmed mean how much to top and tail the results (%)
- *ARRAY_INCREMENT*: the base size of the array and how much to increase it by on each increment
- *NUMBER_INCREMENTS*: the number of arrays to generate

To run please use `irb`. 
```
irb
require_relative './basic_timing'
run(method(:THE_NAME_OF_METHOD_THAT_IS_THE_ALGORITHM_TO_RUN), 'Algorith Name')
```
An example would be:
```
irb
require_relative './basic_timing'
run(method(:fisher_yates_shuffle), 'Fisher-Yates')
```