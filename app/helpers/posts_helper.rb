module PostsHelper
  def bookmarklet(post)
    base_url = "http://bookmarks.takewhile.com/api/links/new"
    base_url = "http://localhost:3000/api/links/new" if Rails.env.development?
    #base_url = "http://thumbs.reddit.com/t5_2qh2p.png?v=ea2349a17098d1f609e55a5295b5e868"
    ret = <<js
  javascript:
  (function(){
    if(window.bookmarking) return;
    var url   = document.location,
        title = document.title,
        description = window.getSelection && window.getSelection()
                   || document.getSelection && document.getSelection()
                   || window.selection && document.selection.createRange().text
                   || '';
        e = encodeURIComponent,
        req = "#{base_url}?post_id=#{post.id}&url=" + e(url) + "&title=" + e(title) + "&description=" + e(description),
        img = new Image;
    window.bookmarking = true;
    document.title = "[Saving to #{post.title}]" + title,
    img.onload = function() {
      document.title = title;
      delete window.bookmarking;
    };
    img.src = req;
  })();
  void(0);
js
    #alert("url: " + url + "\ntitle: " + title + "\ndescription : " + description);
    ret.gsub("\n", '').gsub("  ", '')
  end
end
