require 'spec_helper'

describe FedAch do
  it "Should be able to parse strings from the FED directory" do
    FedAch.should_receive(:create!).with(:routing_number=>'123456789', 
                                        :office_code=>'8',
                                        :servicing_frb_number=>'987654321',
                                        :record_type_code=>'7',
                                        :change_date=>'040778',
                                        :new_routing_number=>'271828183',
                                        :name=>'JOE THE PLUMBER',
                                        :address=>'1922 EAST AVE',
                                        :city=>'OAKLAND',
                                        :state=>'CA',
                                        :zipcode=>'94612',
                                        :zipcode_extension=>'5432',
                                        :phone_area=>'510',
                                        :phone_prefix=>'632',
                                        :phone_suffix=>'4196',
                                        :status_code=>'1',
                                        :data_view_code=>'1')

    FedAch.parse('12345678989876543217040778271828183JOE THE PLUMBER                     1922 EAST AVE                       OAKLAND             CA946125432510632419611     ')
  end
  
  it "should validate length of the string given" do
    lambda {
      FedAch.parse('wrong_length')
    }.should raise_error
  end
  it "should be able to receive a download file" do
    FedAch.should_receive(:parse).exactly(11).times
    FedAch.import %(
011000015O0110000150020802000000000FEDERAL RESERVE BANK                1000 PEACHTREE ST N.E.              ATLANTA             GA303094470866234568111     
011000028O0110000151060909000000000STATE STREET BANK AND TRUST COMPANY ONE LINCOLN STREET                  BOSTON              MA021112101617664240011     
011000138O0110000151101310000000000BANK OF AMERICA, N.A.               8001 VILLA PARK DRIVE               HENRICO             VA232280000800446013511     
011000206O0110000151072505000000000BANK OF AMERICA N.A                 PO BOX 27025                        RICHMOND            VA232617025800446013511     
011000390O0110000151072505000000000BANK OF AMERICA N.A                 PO BOX 27025                        RICHMOND            VA232617025800446013511     
011000536O0110000151052402000000000FEDERAL HOME LOAN BK BOST           111 HUNTINGTON AVE                  BOSTON              MA021990000617292979011     
011001234O0110000151092310000000000MELLON TRUST OF NEW ENGLAND, N.A.   SUITE 960                           PITTSBURGH          PA152620001412236333811     
011001276O0110000151030608000000000ONEUNITED BANK                      3683 CRENSHAW BL                    LOS ANGELES         CA900160000877663864811     
011001331O0110000151070210000000000RBS CITIZENS, NATIONAL ASSOCIATION  1 CITIZENS DRIVE                    RIVERSIDE           RI029150000800883422411     
011001726O0110000151062608000000000THE FIRST NATIONAL BANK OF IPSWICH  31 MARKET ST                        IPSWICH             MA019380000978356370011     
011001742O0110000151072505000000000BANK OF AMERICA, N.A.               PO BOX 27025                        RICHMOND            VA232617025800446013511     )    
  end


end

