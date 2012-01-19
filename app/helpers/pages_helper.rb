module PagesHelper

  def self.createArrayOfFour(page_medias)
    i = -1
    arraysOfFour = Array.new((page_medias.size / 4))
    arraysOfFour[0] =  Array.new
    page_medias.each_with_index do |page_media, index|
      if (index.modulo(4) == 0)
        i = i + 1
        arraysOfFour[i] = Array.new
      end
      arraysOfFour[i] << (page_media)
    end
    return arraysOfFour
  end

end