class Error 
  attr_reader :error_message, :id

  def initialize(errors)
    @id = nil
    @error_message = errors
  end
end