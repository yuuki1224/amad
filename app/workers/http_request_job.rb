# coding: utf-8
class HttpRequestJob
  @queue = :http_request

  def self.perform(url, filename)
    response = RestClient.get(url)
    File.open("#{Rails.root}/tmp/#{filename}",'w') do |f|
      f.puts response.to_str
    end
  end
end
