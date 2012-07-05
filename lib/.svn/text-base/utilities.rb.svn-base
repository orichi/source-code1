class Utilities
  def self.make_url_params(params_hash)
    (params_hash.sort.collect{|s|s[0]+"="+CGI.unescape(s[1])}).join("&")
  end
  def self.make_urls_params(params_hash)
    (params_hash.collect{|s|s[0]+"="+CGI.unescape(s[1])}).join("&")
  end
end
