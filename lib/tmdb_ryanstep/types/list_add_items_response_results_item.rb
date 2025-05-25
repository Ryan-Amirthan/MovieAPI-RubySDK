# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class ListAddItemsResponseResultsItem
    # @return [String]
    attr_reader :media_type
    # @return [Integer]
    attr_reader :media_id
    # @return [Boolean]
    attr_reader :success
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param media_type [String]
    # @param media_id [Integer]
    # @param success [Boolean]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::ListAddItemsResponseResultsItem]
    def initialize(media_type: OMIT, media_id: OMIT, success: OMIT, additional_properties: nil)
      @media_type = media_type if media_type != OMIT
      @media_id = media_id if media_id != OMIT
      @success = success if success != OMIT
      @additional_properties = additional_properties
      @_field_set = { "media_type": media_type, "media_id": media_id, "success": success }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListAddItemsResponseResultsItem
    #
    # @param json_object [String]
    # @return [TmdbApiClient::ListAddItemsResponseResultsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      media_type = parsed_json["media_type"]
      media_id = parsed_json["media_id"]
      success = parsed_json["success"]
      new(
        media_type: media_type,
        media_id: media_id,
        success: success,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListAddItemsResponseResultsItem to a JSON object
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
      obj.media_id&.is_a?(Integer) != false || raise("Passed value for field obj.media_id is not the expected type, validation failed.")
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
    end
  end
end
