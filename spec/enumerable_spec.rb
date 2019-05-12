require './enumberable.rb'

RSpec.describe Enumerable do
    describe "#my_each" do
        it "takes a block" do
            expect([1,2,3,4].my_each{|x| puts x}).to eql([1,2,3,4]) 
        end
    end
    
    describe "#my_each_with_index" do
        it "takes a block with element and index" do
            expect([1,2,3,4].my_each_with_index{|x,i| i}).to eql((0...4))
        end
    end

    describe "#my_select" do
        it "returns a new array with elements that pass a condition" do
            expect([1,2,3,4].my_select {|x| x == 1}).to eql([1])
        end
    end

    describe "#my_all?" do
        it "returns true if every element in the array passes a condition, otherwise returns false" do
            expect([1,2,3,4].my_all? {|x| x<5 }).to eql(true)
        end
    end

    describe "#my_any?" do
        it "returns true if any of the element in the array pass a condition, otherwise returns false" do
            expect([1,2,3,4].my_any? {|x| x < 0}).to eql(false)
        end
    end

    describe "#my_none?" do
        it "returns true if none of the element in the array pass a condition, otherwise returns false" do
            expect([1,2,3,4].my_none? {|x| x < 0}).to eql(true)
        end
    end

    describe "#my_count" do
        it "returns the numbers of element in an array" do
            expect([1,2,3,4].my_count).to eql(4)
        end
    end

    describe "#my_map" do
        it "creates a new array containing the values returned by the block" do
            expect([1,2,3,4].my_map {|x| x + 1}).to eql([2,3,4,5])
        end
    end

    describe "#my_inject" do
        it "Reduce all elements of an array into an single element" do
            expect([1,2,3,4].my_inject {|a,b| a * b}).to eql(24)
        end
    end


end
