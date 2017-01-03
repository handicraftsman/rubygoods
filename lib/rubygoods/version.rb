module RG
  VERSION = "0.0.0.7"

  def self.getgemver(name)
    Gem.loaded_specs["name"].version.version
  end
end
