class Memo < Post
  def read_from_console
    puts "Новая заметка (все, что пишите до \"end\"): "

    @text = []
    line = nil

    while line != "end" do
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_string
    time_string = "Создано: #{@created_at.strftime("%Y-%m-%d, %H-%M-%S.txt")}\n\r \n\r"

    return @text.unshift(time_string)
  end
end