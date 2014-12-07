class UrlValidator < ActiveModel::EachValidator
  VALID_REGEXP = /((http|https):\/\/)?(w{3}\.)?\w+(\.\w+)?(\.\w{2,3}){1}\??(.+)$/

  def validate_each(record, attribute, value)
    error_message = options[:message] || "is not a valid url"

    unless valid? value
      record.errors.add(attribute, error_message)
    end
  end

  private
    def valid?(url)
      url =~ VALID_REGEXP
    end
end