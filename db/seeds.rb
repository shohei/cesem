# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'tqdm'
require 'pry-byebug'

u1 = User.new(name: 'Jomo Kenyatta', email: 'cesem-admin@jkuat.ac.ke', role: 'admin', password: ENV['ADMIN_PASSWORD'])
u1.skip_confirmation!
u1.save!

u2 = User.new(name: 'Jomo Kenyatta', email: 'cesem-manager@jkuat.ac.ke', role: 'manager', password: ENV['MANAGER_PASSWORD'])
u2.skip_confirmation!
u2.save!

u3 = User.new(name: 'Jomo Kenyatta', email: 'cesem-guest@jkuat.ac.ke', role: 'guest', password: ENV['GUEST_PASSWORD'])
u3.skip_confirmation!
u3.save!

csv_text = File.read(Rails.root.join('lib', 'seeds', 'seed_equipment.csv'))
csv = CSV.parse(csv_text, :headers => true)
counter = 0
csv.tqdm.each do |row|
    q = row['quantity'].to_i
    if q>1 
        q.times do 
          t = Equipment.new
          t.user_id = User.first.id
          t.name = row['name']
          t.name_of_model = row['name_of_model']
          t.model_number = row['model_number']
          t.serial_number = row['serial_number']
          if(row['country_of_origin']=='UK')
            t.country_of_origin = 'GB'
          else
            t.country_of_origin = row['country_of_origin']
          end
          t.manufacturer = row['manufacturer']
          t.where_purchased = row['where_purchased']
          t.price = row['price']
          t.acquired_year = row['acquired_year']
          t.location = row['location']
          t.remark = row['remark']
          t.department_id = Department.find_by_alias(row['department']).id
          t.description =  row['description']
          t.inventory_number = row['inventory_number']
          t.save!
          # puts "#{t.name}@#{row['department']} saved"
        end
    else
        t = Equipment.new
        t.user_id = User.first.id
        t.name = row['name']
        t.name_of_model = row['name_of_model']
        t.model_number = row['model_number']
        t.serial_number = row['serial_number']
        if(row['country_of_origin']=='UK')
          t.country_of_origin = 'GB'
        else
          t.country_of_origin = row['country_of_origin']
        end
        t.manufacturer = row['manufacturer']
        t.where_purchased = row['where_purchased']
        t.price = row['price']
        t.acquired_year = row['acquired_year']
        t.location = row['location']
        t.remark = row['remark']
        begin
          t.department_id = Department.find_by_alias(row['department']).id 
        rescue
          binding.pry
        end
        t.description =  row['description']
        t.inventory_number = row['inventory_number']
        t.save!
        # puts "#{t.name} saved"
    end
end

