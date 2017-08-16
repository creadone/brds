class Crawler
  def initialize(start_dir : String)
    @start_dir = start_dir
  end
  def crawl
    list = Array(Directory).new
    Dir.[File.join(@start_dir, "**/*")].each do |path|
      list << Directory.new(path) if File.directory?(path)
    end
    list.sort_by!{ |dir| dir.level }
  end
end
