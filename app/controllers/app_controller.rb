# frozen_string_literal: true

class AppController < Sinatra::Base

  # @api: Format the json response
  def json_response(code: 200, data: nil)
    status = code == 200 ? "SUCCESS" : "FAILED"
    if data
      [ code, { data: data, message: status }.to_json ]
    end
  end

end
