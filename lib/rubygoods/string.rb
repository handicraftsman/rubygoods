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
end