module RandomTokenGenerator
  SAMPLESPACE = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

  def token(length = 3)
    Array.new(length) { SAMPLESPACE.sample }.join
  end
end