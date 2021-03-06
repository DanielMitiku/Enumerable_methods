module Enumerable
    def my_each
        if self.class == Array
            for i in self
                yield(i)
            end
        elsif self.class == Hash
            for i in (0...self.keys.length)
                yield(self.keys[i], self.values[i])
            end
        end
    end

    def my_each_with_index
        if self.class == Array
            for i in (0...self.length)
                yield(self[i],i)
            end
        elsif self.class == Hash
            for i in (0...self.keys.length)
                yield(self.keys[i], self.values[i],i)
            end
        end
    end

    def my_select
        if self.class == Array
          my_arr = []
          self.my_each do |value|
            if yield(value)
              my_arr << value 
            end
          end
          my_arr
        elsif self.class == Hash
          my_hash = {}
          self.my_each do |key, value|
            if yield(key, value)
              my_hash[key] = value
            end
          end
          my_hash
        end
    end

    def my_all?
        if self.class == Array
          self.my_each do |value|
            if !yield(value)
              return false
            end
          end
        elsif self.class == Hash
          self.my_each do |key, value|
            if !yield(key, value)
              return false
            end
          end
        end
        true
    end

    def my_any?
        if self.class == Array
          self.my_each do |value|
            if yield(value)
              return true
            end
          end
        elsif self.class == Hash
          self.my_each do |key, value|
            if yield(key, value)
              return true
            end
          end
        end
        false
    end

    def my_none?
        if self.class == Array
          self.my_each do |value|
            if yield(value)
              return false
            end
          end
        elsif self.class == Hash
          self.my_each do |key, value|
            if yield(key, value)
              return false
            end
          end
          false
        end
        true
    end

    def my_count
      if block_given?
        count = 0
        if self.class == Array
          self.my_each do |value|
            if yield(value)
              count += 1
            end
          end
        elsif self.class == Hash
          self.my_each do |key, value|
            if yield(key, value)
              count += 1
            end
          end
        end
        count
      else
        self.size
      end
    end

    def my_map(proc = '')
        if self.class == Array
          new_array = []
          if proc.is_a? (Proc)
            self.my_each_with_index do |value, i|
              new_array[i] = proc.call(value)
            end
          else
            self.my_each_with_index do |value, i|
              new_array[i] = yield(value)
            end
          end
          new_array
        elsif self.class == Hash
          new_hash = {}
          if proc.is_a? (Proc)
            self.my_each do |key, value|
              new_hash[key] = proc.call(key, value)
            end
          else
            self.my_each do |key, value|
              new_hash[key] = yield(key, value)
            end
          end
        new_hash
        end
    end

    def my_inject(arg = nil)
      arr = self.class == Array ? self.clone : self.class == Range ? self.to_a : self.my_map {|k, v| v }
      acc = arg == nil ? arr[0] : arg
      nxt = arg == nil ? arr[1] : arr[0]
      i = arg == nil ? 1 : 0
      while i < arr.size do
        acc = yield(acc,nxt)
        nxt = arr[i+1]
        i+=1
      end
      acc
    end

end

def multiply_els(array)
  array.my_inject { |total,value| total*value}
end
arr = [1,2,3,4]
puts multiply_els(arr)
puts arr.my_count{|x| x==2 || x==4}
puts arr.my_any?{ |x| x==5}