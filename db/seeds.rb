# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create(:full_name=> 'Doctor1', :role=>1 , :username=> 'docc1',:password=>'root1234',:password_confirmation=>'root1234',:email=>'doc1@123.com')
User.create(:full_name=> 'Doctor2', :role=>1 , :username=> 'docc2',:password=>'root1234',:password_confirmation=>'root1234',:email=>'doc2@123.com')

User.create(:full_name=> 'Recep1', :role=>2 , :username=> 'recep1',:password=>'root1234',:password_confirmation=>'root1234',:email=>'recep1@123.com')
User.create(:full_name=> 'Recep2', :role=>2 , :username=> 'recep2',:password=>'root1234',:password_confirmation=>'root1234',:email=>'recep2@123.com')


3.times do |i|
    2.times do  |j|
    Patient.create(:name=>'Ankit'+i.to_s, :phone_no=>33434344+i,:age=>22+i,:user_id=> 1 ,:appointment_date=>'Mon, '.concat(12+i+j,' Apr 2024 05:49:06.309217000 UTC +00:00'),:receptionist_id=>3)
    Patient.create(:name=>'Manav'+i.to_s, :phone_no=>22442233+i,:age=>20+i,:user_id=> 2,:appointment_date=> 'Mon, '.concat(10+i+j,'Apr 2024 05:49:06.309217000 UTC +00:00'),:receptionist_id=>3)
    Patient.create(:name=>'Raghav'+i.to_s, :phone_no=>99332233+i,:age=>22+i,:user_id=> 1 ,:appointment_date=>'Mon, 5 Apr 2024 05:49:06.309217000 UTC +00:00' ,:receptionist_id=>3)
    Patient.create(:name=>'Avi'+i.to_s, :phone_no=>23332233+i,:age=>22+i,:user_id=> 1 ,:appointment_date=> 'Mon, 2 Apr 2024 05:49:06.309217000 UTC +00:00',:receptionist_id=>3)
    end


end

 



3.times do |i|
    Patient.create(:name=>'Preet'+i.to_s, :phone_no=>992312323+i,:age=>11+i,:user_id=> 2 ,:appointment_date=> DateTime.new(2024, 07, 1+1, 13, 46, 45, "+4") ,:receptionist_id=>4)
    Patient.create(:name=>'Himani'+i.to_s, :phone_no=>222312323+i,:age=>11+i,:user_id=> 2 ,:appointment_date=> DateTime.new(2024, 07, 1+i, 13, 46, 45, "+4") ,:receptionist_id=>4)
    Patient.create(:name=>'Kanav'+i.to_s, :phone_no=>672312323+i,:age=>11+i,:user_id=> 1,:appointment_date=> DateTime.new(2024, 07, 1+i, 13, 46, 45, "+4") ,:receptionist_id=>4)

end
