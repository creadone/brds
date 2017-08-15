class Saver

  def initialize(dirs : Array(Directory), file : String)
    @dirs = dirs
    @file = file
  end

  def save
    f = File.open(@file, "w")
    @dirs.each do |dir|
      f.puts dir.to_h.to_yaml
    end
    f.close
  end

end
