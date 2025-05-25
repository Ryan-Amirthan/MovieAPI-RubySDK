# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class ListItemStatusResponse
    # @return [String]
    attr_reader :media_type
    # @return [Boolean]
    attr_reader :success
    # @return [String]
    attr_reader :status_message
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :media_id
    # @return [Integer]
    attr_reader :status_code
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param media_type [String]
    # @param success [Boolean]
    # @param status_message [String]
    # @param id [Integer]
    # @param media_id [Integer]
    # @param status_code [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::ListItemStatusResponse]
    def initialize(media_type: OMIT, success: OMIT, status_message: OMIT, id: OMIT, media_id: OMIT, status_code: OMIT,
                   additional_properties: nil)
      @media_type = media_type if media_type != OMIT
      @success = success if success != OMIT
      @status_message = status_message if status_message != OMIT
      @id = id if id != OMIT
      @media_id = media_id if media_id != OMIT
      @status_code = status_code if status_code != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "media_type": media_type,
        "success": success,
        "status_message": status_message,
        "id": id,
        "media_id": media_id,
        "status_code": status_code
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListItemStatusResponse
    #
    # @param json_object [String]
    # @return [TmdbApiClient::ListItemStatusResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      media_type = parsed_json["media_type"]
      success = parsed_json["success"]
      status_message = parsed_json["status_message"]
      id = parsed_json["id"]
      media_id = parsed_json["media_id"]
      status_code = parsed_json["status_code"]
      new(
        media_type: media_type,
        success: success,
        status_message: status_message,
        id: id,
        media_id: media_id,
        status_code: status_code,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListItemStatusResponse to a JSON object
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
      obj.media_type&.is_a?(String) != false || raise("Passed value for field obj.media_type is not the expected type, validation failed.")
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      obj.status_message&.is_a?(String) != false || raise("Passed value for field obj.status_message is not the expected type, validation failed.")
      obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.media_id&.is_a?(Integer) != false || raise("Passed value for field obj.media_id is not the expected type, validation failed.")
      obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
    end
  end
end
