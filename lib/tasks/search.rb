require 'pathname'

module Search

  def self.files(filter, dir, callback, block)
    dir = Pathname.new dir unless dir.instance_of? Pathname
    total = 0
    dir.each_child do |item|
      next if item == '..' or item == '.'
      if item.directory?
        quantity = files filter, item, callback, block
        total += quantity
      else
        if item.to_s =~ filter
          total += 1 
          block.call item, strings_count( item )
        end
      end
    end
    callback.call(dir, total) if total > 0
    total
  end

private


  def self.strings_count(path)
    quantity = 0
    File.open(path) { |x| x.each_line { quantity += 1 } }
    quantity
  end


end

