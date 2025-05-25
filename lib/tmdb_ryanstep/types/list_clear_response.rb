# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class ListClearResponse
    # @return [Integer]
    attr_reader :items_deleted
    # @return [String]
    attr_reader :status_message
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :status_code
    # @return [Boolean]
    attr_reader :success
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param items_deleted [Integer]
    # @param status_message [String]
    # @param id [Integer]
    # @param status_code [Integer]
    # @param success [Boolean]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::ListClearResponse]
    def initialize(items_deleted: OMIT, status_message: OMIT, id: OMIT, status_code: OMIT, success: OMIT,
                   additional_properties: nil)
      @items_deleted = items_deleted if items_deleted != OMIT
      @status_message = status_message if status_message != OMIT
      @id = id if id != OMIT
      @status_code = status_code if status_code != OMIT
      @success = success if success != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "items_deleted": items_deleted,
        "status_message": status_message,
        "id": id,
        "status_code": status_code,
        "success": success
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListClearResponse
    #
    # @param json_object [String]
    # @return [TmdbApiClient::ListClearResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      items_deleted = parsed_json["items_deleted"]
      status_message = parsed_json["status_message"]
      id = parsed_json["id"]
      status_code = parsed_json["status_code"]
      success = parsed_json["success"]
      new(
        items_deleted: items_deleted,
        status_message: status_message,
        id: id,
        status_code: status_code,
        success: success,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListClearResponse to a JSON object
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
      obj.items_deleted&.is_a?(Integer) != false || raise("Passed value for field obj.items_deleted is not the expected type, validation failed.")
      obj.status_message&.is_a?(String) != false || raise("Passed value for field obj.status_message is not the expected type, validation failed.")
      obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
    end
  end
end
