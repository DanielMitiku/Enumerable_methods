module Enumerable
    def my_each
        for i in self
            yield(i)
        end
    end

    def my_each_with_index
        for i in self
            ind = self.index(i)
            yield(i,ind)
        end
    end

    def my_select
        my_arr = []
        self.my_each {|x| my_arr << x if yield(x)}
        my_arr
    end

    def my_all?
        self.my_each {|x| return false unless yield(x)}
        true
    end

    def my_any?
        self.my_each {|x| return true if yield(x)}
        false
    end
end