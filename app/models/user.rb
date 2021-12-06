class User < ApplicationRecord

    has_many :followings


    def self.recommend
      user = User.find(1)
      @film_pool = []
      films_from_favorite_genres = Film.includes(:followings).where(genre_id: user.followings.where(followable_type: 'Genre').pluck(:followable_id)).pluck(:id)
      release_date_raw = Film.where(id: user.followings.where(followable_type: 'Film').pluck(:followable_id)).pluck(:year)
      release_date_avg = (release_date_raw.sum / release_date_raw.count).round
      release_date_range = (release_date_avg - 5)...(release_date_avg + 5)
      films_from_release_date = Film.where(year: release_date_range).pluck(:id)

      films_act = Individual.where(id: user.followings.where(followable_type: 'Individual').pluck(:followable_id)).pluck(:id)
      Character.where(individual_id: films_act).map do |x|
      @film_pool << x.film_id
      end
      @film_pool.push(films_from_favorite_genres, films_from_release_date)
      @film_pool.flatten!
      @remove_already_follewed_films = user.followings.where(followable_type: 'Film').pluck(:followable_id)
      @film_pool = @film_pool - @remove_already_follewed_films
      result = @film_pool.tally.sort_by {|k, v| -v} .first(5).map {|x| x[0]}
      return Film.where(id: result)
    end

  end
  