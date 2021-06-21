# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  if num_1 % num_2 == 0
    return num_1
  elsif num_2 % num_1 == 0
    return num_2
  end

  arr1 = []
  arr2 = []

  (2..num_1).each do |fac|
    if num_1 % fac == 0
      arr1 << fac
    end
  end

  (2..num_2).each do |fac|
    if num_2 % fac == 0
      arr2 << fac
    end
  end
  array = arr1 & arr2
  my_arr = (arr1 - arr2) | (arr2 - arr1)
  return Math.sqrt(my_arr.inject(:*)*array.inject(:*))
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)

end