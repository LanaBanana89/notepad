if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'post'
require_relative 'tasks'
require_relative 'memo'
require_relative 'link'

#id, limit, type

require 'optparse'

# все наши опции будут записаны сюда
options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end
    opt.on('--type POST_TYPE', 'какой тип постов показывать (по умолчанию любой)') {|o| options[:type] = o}
    opt.on('--id POST_ID', 'если задан id, показываем подробно только этот пост') {|o| options[:id] = o}
    opt.on('--limit Number', 'сколько последних постов показать (по умполчанию все)') {|o| options[:limit] = o}

end.parse!

unless options[:id].nil?
  result = Post.find_by_id(options[:id])
else
  result = Post.find_all(options[:limit], options[:type])
end

if result.is_a? Post
  puts "Запись #{result.class.name}, id = #{options[:id]}"

  result.to_string.each do |line|
    puts line
  end
else # покажем таблицу результатов

  print "| id\t| @type\t|  @created_at\t\t\t|  @text\t\t\t|  @url\t\t|  @due_date \t"

  result.each do |row|
    puts

    row.each do |element|
      print "| #{element.to_s.delete("\\n\\r")[0..40]}\t"
    end
  end
end

puts
