class RequestParser
  def self.new(req)

    headers = req.env.select {|k,v| k.start_with? 'HTTP_'}
      .map {|pair| [pair[0].sub(/^HTTP_/, ''), pair[1]]}
      .sort

    {
      date:           Time.now,
      remote_ip:      req.remote_ip,
      request_method: req.request_method,
      scheme:         req.env['rack.url_scheme'],
      query_string:   req.env['rack.request.query_string'],
      query_params:   req.env['rack.request.query_hash'],
      cookies:        req.cookies,
      headers:        headers,
    }
  end
end
