class CALC
  def add(input)
    @result = 0
    unless input.empty?

      if input.length < 2
        @result = input.scan(/\d+/).join.to_i
      end

      if input.match('//;')
        @clean = input.partition("\\n")
        if @clean[2].match(';')
          @tmp = @clean[2].split(';')
          @exception = Array.new
          inc = 0
          @tmp.each do |i|
            if i.to_i < 0
              @exception[inc] = i.to_s
              inc += 1
            end
            if i.to_i > 1000
              next
            end
            @result += i.to_i
            unless @exception.empty?
              raise "Negatives not allowed: " + @exception.join(',')
            end
          end
        end

      else
        @clean = input.gsub('\n',',').to_s

        if @clean.match(',')
          @tmp = @clean.split(',')
          @exception = Array.new
          inc = 0
          @tmp.each do |i|
            if i.to_i < 0
              @exception[inc] = i.to_s
              inc += 1
            end
            if i.to_i > 1000
              next
            end
            @result += i.to_i
          end
          unless @exception.empty?
            raise "Negatives not allowed: " + @exception.join(',')
          end
        end
      end

    end

  end
end