require 'csv'

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  phone_number = row[:homephone]

  # remove all dashes, parentheses, spaces, and periods from phone numbers
  phone_number.to_s.gsub!(/[()-. ]/, "")

  # if phone number is less than ten digits, assume it's a bad number
  if phone_number.length < 10
    phone_number = "0000000000"
  end

  # if phone number is eleven digits but starts with a 1, trim the one and assume it's a good number
  if phone_number.length == 11 && phone_number[0] == "1"
    phone_number[0] = ""
  end

  # if phone number is eleven digits but doesn't start with a 1, assume it's a bad number
  if phone_number.length == 11 && phone_number[0] != "1"
    phone_number = "0000000000"
  end

  # if phone number is more than eleven digits, assume it's a bad number
  if phone_number.length > 11
    phone_number = "0000000000"
  end

  puts phone_number
end


