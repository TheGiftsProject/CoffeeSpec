class Object
  def is_a_number?
    true if Float(self) rescue false
  end
end