module RG
  VERSION = "0.0.0.12"

  def self.getgemver(name)
    Gem.loaded_specs[name].version.version
  end
end
