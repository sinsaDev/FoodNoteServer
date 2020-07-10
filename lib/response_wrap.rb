class ResponseWrap


  def self.data_wrap(data = {}, errors = {})
    if data
      {
        data: data,
        errors: errors
      }
    else
      {
        errors: errors
      }
    end
  end
end