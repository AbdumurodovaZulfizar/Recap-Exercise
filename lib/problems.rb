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
  i=0
  var = ''
  arr =[]
  new_hash = {}
  hash =Hash.new(0)
  (0...str.length-1).each do |i|
      var = str[i] + str[i+1]
      arr << var
  end
  arr.each do |ele|
    hash[ele]+=1
  end
  new_hash = hash.sort_by {|k, v| v}
  return new_hash[-1][0]
end

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    hash = {}
    self.each do |k, v|
      hash[v] = k
    end
    return hash
  end
end

class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    count = 0
    self.each_with_index do |ele1, i1|
      self.each_with_index do |ele2, i2|
        if i2 > i1 && (ele1 + ele2 == num)
          count += 1
        end
      end
    end
    return count
  end
  puts [1, 2, 1, 3, 8].pair_sum_count(5)
  puts [10, 3, 6, 5, 7].pair_sum_count(13)
  puts [10, 3, 6, 5, 7].pair_sum_count(4)
  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
  # two parameters, which represents the two elements in the array being compared.
  # If the block returns 1, it means that the second element passed to the block
  # should go before the first (i.e. switch the elements). If the block returns -1,
  # it means the first element passed to the block should go before the second
  # (i.e. do not switch them). If the block returns 0 it implies that
  # it does not matter which element goes first (i.e. do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }

        sorted = false
        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end

        self
  end
end

[4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort
