class ErrorSerializer
  include JSONAPI::Serializer
  attributes :error_message
end
