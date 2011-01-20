require 'yaml'

class Calculator < Hash
   def initialize
    replace YAML.load_file(File.dirname(__FILE__) + '/../../times.yml')
  end

   def select(area)
    @area = area

    return correct_hour
   end

   private
   def correct_hour
     params = self[@area]
     last_index = 0

     params.each_with_index do |value, index|
       time = generate_timestamps(value.split('|')[0])
       last_index = index - 1 if index != 0

       if time > Time.now.to_i
         return {@area => [generate_timestamps(params[last_index]), value.split('|')[1]]}
       end
     end
   end

   def generate_timestamps(time)
     time = time.split(':')
     time_now = Time.now
     Time.local(time_now.year, time_now.month, time_now.day, time[0].to_i, time[1].to_i).to_i
   end

end
