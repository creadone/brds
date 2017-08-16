class Loader
  def initialize(file : String)
    @file = file
  end
  def load
    dirs = YAML.parse_all(File.read(@file))
  end
end
