class CustomFailureApp < Devise::FailureApp
  def respond
    api_response
  end

  private

  def api_response
    self.status = 401
    self.content_type = 'application/json'
    # optional - send a message in the response body
    response.body = { error: "User is not authorized to perform this action" }.to_json
  end
end
