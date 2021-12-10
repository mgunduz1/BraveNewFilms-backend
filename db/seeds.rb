# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["Drama", "War", "Mystery", "Horror", "Sci-Fi", "Action", "Comedy", "Biography", "Romance", "Sport", "History", "Crime"].each do |genre |
    Genre.create!(name: genre)
  end

puts "Genres created"

drama_data = JSON.parse(File.open('static_data/drama.json').read)
drama_data.each do |hash|    
    unless Film.find_by(title: hash["title"])        
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Drama").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end

puts "Drama films created"

war_data = JSON.parse(File.open('static_data/war.json').read)
war_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "War").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end
=begin
puts "War films created"
mystery_data = JSON.parse(File.open('static_data/mystery.json').read)
mystery_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Mystery").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end

puts "Mystery films created"

horror_data = JSON.parse(File.open('static_data/horror.json').read)
horror_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Horror").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "Horror films created"

sci_fi_data = JSON.parse(File.open('static_data/sci-fi.json').read)
sci_fi_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Sci-Fi").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "Sci-Fi films created"

action_data = JSON.parse(File.open('static_data/action.json').read)
action_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Action").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "Action films created"

comedy_data = JSON.parse(File.open('static_data/comedy.json').read)
comedy_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Comedy").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "Comedy films created"

biography_data = JSON.parse(File.open('static_data/biography.json').read)
biography_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Biography").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "Biography films created"

romance_data = JSON.parse(File.open('static_data/romance.json').read)
romance_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Romance").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "Romance films created"

sport_data = JSON.parse(File.open('static_data/sport.json').read)
sport_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Sport").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "Sport films created"

history_data = JSON.parse(File.open('static_data/history.json').read)
history_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "History").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end


puts "History films created"

crime_data = JSON.parse(File.open('static_data/crime.json').read)
crime_data.each do |hash|
    unless Film.find_by(title: hash["title"])
        cast = hash['description'].split(", ").drop(1)
        @film = Film.create!(title: hash['title'], year: hash['year'], genre_id: Genre.find_by(name: "Crime").id, poster: hash['image'])
  
        cast.each do |person|
            selected_person = Individual.find_by(name: person)
            if selected_person
                Character.create!(film_id: @film.id, individual_id: selected_person.id)
            else
                new_person = Individual.create!(name: person)
                Character.create!(film_id: @film.id, individual_id: new_person.id)
            end
        end
    end
end

=end