require_relative 'encryptor'

class Enigma

  attr_accessor :message, :final_message

  def collect_message
    @input = File.open("#{ARGV[0]}", "r")
    @message = File.read(@input)
  end

  def output_message
    @output = File.open("#{ARGV[1]}", "w")
    @output.write(@message)
    @output.close
    @final_message = @message
  end



  puts "Created #{@output} using #{@input}"

end
