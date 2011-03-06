class ApiController < ApplicationController
  def create_link
    # no error checking for now
    Link.create do |link|
      link.post = Post.find(params[:post_id])
      link.title = params[:title]
      link.url = params[:url]
      link.description  = params[:description]
    end

    # render a small gif file, to make sure onload event succeeds.
    data = "GIF89a\x01\x00\x01\x00\x80\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF!\xF9\x04\x00\a\x00\xFF\x00,\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02\x02D\x01\x00;"
    response.headers['Content-Type'] = 'image/gif'
    render :text => data
  end
end
