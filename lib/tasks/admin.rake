require ::File.expand_path('../../../config/environment',  __FILE__)

require 'record_importer'
require 'zip'
require 'file'   
   


namespace :admin do
  task :create_admin_account do
    admin_account = User.new(
                     :first_name =>     "Administrator",
                     :last_name =>      "Administrator",
                     :username =>       "pophealth",
                     :password =>       "pophealth",
                     :email =>          "provideadmin@providemycompanyname.com",
                     :agree_license =>  true,
                     :admin =>          true,
                     :approved =>       true)
    admin_account.save!
  end
  
  
  task :check_xml, [:file] do
		if file != nil
			temp_file = Tempfile.new("patient_upload")

			File.open(temp_file.path, "wb") { |f| f.write(file.read) }
			i = 0;
			Zip::ZipFile.open(temp_file.path) do |zipfile|
			  zipfile.entries.each do |entry|
			    next if entry.directory?
			    if(entry.name == nil)
			    	
			    else	
			    	xml = zipfile.read(entry.name) 
			    	result = RecordImporter.import(xml)
					end
				end
			end
		end
  end
end



