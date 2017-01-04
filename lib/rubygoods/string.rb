class ::String
  def squish
    self.force_encoding("UTF-8").gsub(/\s+/, " ").strip
  end
  def antiinject
    udquote = '"'.force_encoding("UTF-8").unpack('U*').map{ |i| "\\u" + i.to_s(16).rjust(4, '0') }.join
    self.force_encoding("UTF-8").gsub(/"/, udquote)
  end
  def quotenormalize
    self.force_encoding("UTF-8").gsub(/\\u0022/, '"')
  end
  def spliteach(num)
    strs = Array.new
    counter = 0
    pos = 0
    str = ""

    self.each_char do |c|
      if strs[pos] == nil
        strs[pos] = ""
      end
      if counter == num
        strs[pos] << str
        pos += 1
        counter = 0
        str = ""
      end
      str = str + c.to_s
      counter += 1
    end
    if str != ""
      strs[pos] << str
    end
    return strs
  end
end