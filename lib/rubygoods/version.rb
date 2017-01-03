module RG
  VERSION = "0.0.0.6"

  def getgemver(name)
    Gem.loaded_specs["name"].version.version
  end
end
