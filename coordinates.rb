require 'exifr/jpeg'
require 'csv'
Dir["*.jpg"].each do |name| # fetch all jpg from current dir
	CSV.open("t.csv", "ab") do |csv|
		gps = EXIFR::JPEG.new(name).gps 
		if gps 
			lat = gps.latitude
			lng = gps.longitude
			csv << [lat, lng]
		end
	end
end
