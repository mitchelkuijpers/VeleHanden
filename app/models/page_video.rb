class PageVideo < PageMedia

  field :video_id, type: String

  # API KEYS
  VIMEO_KEY = "09d3f520f3f2aa184551a8077fd68676"
  VIMEO_SECRET_KEY = "24bc22a4e336272c"

  # Search for videos on vimeo
  # @param query no special query language required
  # @param page
  # @param per_page how many results you want per page
  def self.search query, page, per_page
    video = Vimeo::Advanced::Video.new( VIMEO_KEY, VIMEO_SECRET_KEY)
    return video.search(query, {
        :page => page,
        :per_page => per_page,
        :full_response => "1",
        :sort => "newest",
    })
  end

end