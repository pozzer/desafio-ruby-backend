module CnabImport
  class Import
    attr_accessor :cnab_file, :errors, :count
  
    def initialize(cnab_file)
      @cnab_file = cnab_file
      @count = 0
      @errors = []
    end

    def call
      cnab_file.lines.each_with_index do |cnab, line|
        begin
          Transaction.create_by_cnab(Parser.new(cnab))
          @count += 1
        rescue => e
          errors << "#{line} - #{e}"
        end
      end
      OpenStruct.new({count: @count, errors: errors})
    end
  end
end