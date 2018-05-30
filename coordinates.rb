require 'exifr/jpeg'

Dir["*.jpg"].each do |name| # fetch all jpg from current dir
	CSV.open("t.csv", "ab") do |csv|
		if EXIFR::JPEG.new(name).gps 
			lat = EXIFR::JPEG.new(name).gps.latitude
			lng = EXIFR::JPEG.new(name).gps.longitude
			csv << [lat, lng]
		end
	end
end
