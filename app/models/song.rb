class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    # self.genre #=> #<Genre:0x00000000039c5268 id: 1, name: "Rock">
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    
    existing_drake = Artist.find_by(name: "Drake")
    
    
    # OPTION 1: If drake doesn't already exist, then create it
    # if !existing_drake
    #   existing_drake = Artist.create(name: "Drake")
    # end
    
    # # otherwise, at the end of it all, you want to assign either the fetched drake, or the created drake, to this song
    # self.artist = existing_drake
    
    # OPTION 2:
    
    self.artist ||= existing_drake ? existing_drake : Artist.create(name: "Drake")
  end
end