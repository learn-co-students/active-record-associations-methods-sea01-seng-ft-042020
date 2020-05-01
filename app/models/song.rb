class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    drake = Artist.find_by(name: "Drake")
    # If artist "Drake" is not found in database, create him
    if !drake
      drake = Artist.create(name: "Drake")
    end
    drake.songs.push(self)
  end
end