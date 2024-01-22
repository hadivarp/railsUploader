require 'roo'

class Api::V1::Uploader::UploadByXlsx

  attr_reader :excel_file

  def initialize(excel_file)
    @excel_file = excel_file
  end


  def call
    puts "-------Importing Data Begin-------"
    data = Roo::Spreadsheet.open('lib/public/data.xlsx')
    headers = data.row(1)
    data.each_with_index do |row, idx|
      next id idx == 0
      merchant = Hash[[headers,row].transpose]

      if Merchant.exists?(merchant_id: merchant['merchant_id'] )
        puts "Merchant with email  #{merchant['merchant_id']} already exists"
        next
      end


      merchant = Merchant.new(merchant)
      puts "Merchant with email  #{merchant['merchant_id']} is saved"
      merchant.save
    end



  end

end