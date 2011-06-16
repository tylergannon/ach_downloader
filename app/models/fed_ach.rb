class FedAch < ActiveRecord::Base
  def self.import(str)
    entries = str.split("\n").reject{|t| t.strip.blank?}
    puts "Importing #{entries.size} records"
    entries.each{|t| parse t}
  end

  def self.parse(str)
    if str.strip.length!=150
      puts "Format Error: invalid length\n|#{str}|" 
    else
      str="x#{str}"  # just to make fed's spec easier to read
      puts create!( :routing_number => str[1..9],
            :office_code =>str[10],
            :servicing_frb_number => str[11..19],
            :record_type_code => str[20],
            :change_date => str[21..26],
            :new_routing_number => str[27..35],
            :name => str[36..71].strip,
            :address => str[72..107].strip,
            :city => str[108..127].strip,
            :state => str[128..129],
            :zipcode => str[130..134],
            :zipcode_extension => str[135..138],
            :phone_area => str[139..141],
            :phone_prefix => str[142..144],
            :phone_suffix => str[145..148],
            :status_code => str[149],
            :data_view_code => str[150]).name
    end
  end
end
