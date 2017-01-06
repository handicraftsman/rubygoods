module RG
  module Utils
    def self.notnil(*arr)
      arr.each do |i|
        if i == nil
          return false
        end
      end
      return true
    end
  end
end