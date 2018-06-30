listener = Listen.to('public/uploads') do |modified, added, removed|
  added.each do |csv_file_path|
    UserPointsImporter.new(csv_file_path).import
  end
end
listener.start
