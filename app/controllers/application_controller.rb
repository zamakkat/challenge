class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :parser

  def parser(url)
    output = ""

    # External library used
    # http://www.germane-software.com/software/rexml/docs/tutorial.html
  	require "rexml/document"
    require "net/http"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    doc = REXML::Document.new xml_data
    doc = doc.elements[1]
    # doc.elements.each("volume/paper") do |p| 
    #   p.elements.each("title") do |t|
    #     output += t.text + "\r\n"
    #   end
    # end

    # Read the volume id in the root tag
    @volume = Volume.new
    #@volume.volume_id = doc.attributes["id"]
    vol = doc.elements[1]
    @volume.title = vol.elements[1].text
    i = 2
    while vol.elements[i].name == "editor"
      count = 0
      au = Author.new
      au.first_name = vol.elements[i].text
      @volume.authors[count] = au
      au.save
      i += 1 
      
    end

    @volume.month = vol.elements[i].text
    @volume.year = vol.elements[i+1].text
    @volume.address = vol.elements[i+2].text
    @volume.publisher = vol.elements[i+3].text
    @volume.url = vol.elements[i+4].text
    @volume.bibtype = vol.elements[i+5].text
    @volume.bibkey = vol.elements[i+6].text
    # Save volume to database
    @volume.save

    v = 0 # number of papers in a volume
    @paper = Paper.new
    (2..doc.size).each do |i|
      if doc.elements[i] != nil
        @paper.volume_id = doc.attributes["id"]
        p = doc.elements[i]
        @paper.paper_id = p.attributes["id"]
        @paper.title = p.elements[1].text
        j = 2
        while p.elements[j].name == "author"
          count = 0
          au = Author.new
          if p.elements[j].elements[1] != nil
            au.first_name = p.elements[j].elements[1].text
            au.last_name = p.elements[j].elements[2].text
            #au.papers[au.papers.size] = paper
            au.save
            @paper.authors[count] = au
            count += 1
          end
          j += 1       
        end
        j += 1 # to skip the booktitle as we are referencing volume id
        @paper.month = p.elements[j].text
        @paper.year = p.elements[j+1].text
        @paper.address = p.elements[j+2].text
        @paper.publisher = p.elements[j+3].text
        if p.elements[j+4].name == "pages"
          @paper.pages = p.elements[j+4].text
          j += 1
        end
        @paper.url = p.elements[j+4].text
        @paper.bibtype = p.elements[j+5].text
        @paper.bibkey = p.elements[j+6].text
        # Save paper to database
        @paper.save
        @volume.papers[v] = @paper
        v += 1
        @paper = Paper.new
      end

    end



    return output
  end

end