class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #setter method called whenever a Song initialized with a genre_name field
  def genre_name=(name)
    # self.genre = Genre.find_or_create_by(name: name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents
    self.notes.map(&:content)
  end


end
