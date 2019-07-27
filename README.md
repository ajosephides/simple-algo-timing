A range of exercises (taken from Makers course) on building and understanding algorithm complexity.


Basic plan:

# Input:
 - algorithm to run
 - data to run algo on

# Output
 - label (e.g. size of array) and mean / median
 - when run on multiple data different algo sizes then a graphical plot


# Process
 - create data
 - run algo x number of times - each one benchmarked
 - order results
 - discard top and bottom 5%
 - calc mean and median 


 #Setup
 Make sure you have installed **imagemagick** before running bundle. If using OSX Mojave try this:
 `brew install imagemagick@6 && brew link imagemagick@6 --force`