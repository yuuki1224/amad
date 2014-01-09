# coding: utf-8
class ResqueSample
  attr_accessor :url, :filename
  def async_request
    raise if url.blank? or filename.blank?
    Resque.enqueue(HttpRequestJob, self.url, self.filename)
  end
end
