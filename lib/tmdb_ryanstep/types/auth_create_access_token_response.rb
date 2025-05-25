# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class AuthCreateAccessTokenResponse
    # @return [String]
    attr_reader :account_id
    # @return [String]
    attr_reader :access_token
    # @return [Boolean]
    attr_reader :success
    # @return [String]
    attr_reader :status_message
    # @return [Integer]
    attr_reader :status_code
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param account_id [String]
    # @param access_token [String]
    # @param success [Boolean]
    # @param status_message [String]
    # @param status_code [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AuthCreateAccessTokenResponse]
    def initialize(account_id: OMIT, access_token: OMIT, success: OMIT, status_message: OMIT, status_code: OMIT,
                   additional_properties: nil)
      @account_id = account_id if account_id != OMIT
      @access_token = access_token if access_token != OMIT
      @success = success if success != OMIT
      @status_message = status_message if status_message != OMIT
      @status_code = status_code if status_code != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "account_id": account_id,
        "access_token": access_token,
        "success": success,
        "status_message": status_message,
        "status_code": status_code
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AuthCreateAccessTokenResponse
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AuthCreateAccessTokenResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      account_id = parsed_json["account_id"]
      access_token = parsed_json["access_token"]
      success = parsed_json["success"]
      status_message = parsed_json["status_message"]
      status_code = parsed_json["status_code"]
      new(
        account_id: account_id,
        access_token: access_token,
        success: success,
        status_message: status_message,
        status_code: status_code,
        additional_properties: struct
      )
    end

    # Serialize an instance of AuthCreateAccessTokenResponse to a JSON object
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
      obj.account_id&.is_a?(String) != false || raise("Passed value for field obj.account_id is not the expected type, validation failed.")
      obj.access_token&.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      obj.status_message&.is_a?(String) != false || raise("Passed value for field obj.status_message is not the expected type, validation failed.")
      obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
    end
  end
end
