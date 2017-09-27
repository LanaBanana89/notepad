class Task < Post

  def initialize
    super
    @due_date = Time.now
  end

  def read_from_console
    #todo
  end

  def to_string
    #todo
  end
end