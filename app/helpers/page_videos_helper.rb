module PageVideosHelper

  def self.create_pagination videos
    total_pages = videos["total"].to_i / videos["perpage"].to_i
    if total_pages == 0
      total_pages = 1
    end
    current = videos["page"].to_i

    previous_links = Array.new
    (1..5).each do |i|
      if (current - i) > 0
        previous_links << (current - i)
      end
    end
    previous_links = previous_links.sort

    next_links = Array.new
    (1..5).each do |i|
      if (current + i) <= total_pages
        next_links << (current + i)
      end
    end

    if current > 1
      previous_link = current - 1
    end

    if current != total_pages
      next_link = current + 1
    end

    return {total_pages: total_pages,
            current: current,
            previous_links: previous_links,
            next_links: next_links,
            previous_link: previous_link,
            next_link: next_link}
  end
end