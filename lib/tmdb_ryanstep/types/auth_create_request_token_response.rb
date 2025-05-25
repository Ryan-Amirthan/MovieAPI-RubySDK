# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class AuthCreateRequestTokenResponse
    # @return [String]
    attr_reader :status_message
    # @return [String]
    attr_reader :request_token
    # @return [Boolean]
    attr_reader :success
    # @return [Integer]
    attr_reader :status_code
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status_message [String]
    # @param request_token [String]
    # @param success [Boolean]
    # @param status_code [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AuthCreateRequestTokenResponse]
    def initialize(status_message: OMIT, request_token: OMIT, success: OMIT, status_code: OMIT,
                   additional_properties: nil)
      @status_message = status_message if status_message != OMIT
      @request_token = request_token if request_token != OMIT
      @success = success if success != OMIT
      @status_code = status_code if status_code != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "status_message": status_message,
        "request_token": request_token,
        "success": success,
        "status_code": status_code
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AuthCreateRequestTokenResponse
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AuthCreateRequestTokenResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status_message = parsed_json["status_message"]
      request_token = parsed_json["request_token"]
      success = parsed_json["success"]
      status_code = parsed_json["status_code"]
      new(
        status_message: status_message,
        request_token: request_token,
        success: success,
        status_code: status_code,
        additional_properties: struct
      )
    end

    # Serialize an instance of AuthCreateRequestTokenResponse to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.status_message&.is_a?(String) != false || raise("Passed value for field obj.status_message is not the expected type, validation failed.")
      obj.request_token&.is_a?(String) != false || raise("Passed value for field obj.request_token is not the expected type, validation failed.")
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
    end
  end
end
