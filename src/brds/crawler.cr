class Crawler
  def initialize(start_dir : String)
    @start_dir = start_dir
  end
  def crawl
    list = Array(Directory).new
    Dir.[File.join(@start_dir, "**/*")].each do |path|
      if File.directory?(path)
        relative_path = path.sub(@start_dir, "")
        list << Directory.new(relative_path, @start_dir)
      end
    end
    list.sort_by!{ |dir| dir.level }
  end
end
