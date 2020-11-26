module CnabImport
  class Parser 
    attr_accessor :cnab_string
    
    def initialize(cnab_string)
      @cnab_string = cnab_string
    end
    
    def amount
      cnab_string[9..18].to_i
    end
    
    def amount_to_f
      amount / 100.00
    end
    
    def year
      cnab_string[1..4].to_i
    end

    def month
      cnab_string[5..6].to_i
    end

    def day
      cnab_string[7..8].to_i
    end

    def hours
      cnab_string[42..43].to_i
    end

    def minutes
      cnab_string[44..45].to_i
    end

    def seconds
      cnab_string[46..47].to_i
    end

    def occurrence_at
      DateTime.new(year, month, day, hours, minutes, seconds, '-03:00')
    end

    def cpf
      cnab_string[19..29]
    end

    def card_number
      cnab_string[30..41]
    end

    def kind
      cnab_string[0].to_i
    end

    def owner_name
      cnab_string[48..61].strip
    end

    def store_name
      cnab_string[62..80].strip
    end
    
  end
end