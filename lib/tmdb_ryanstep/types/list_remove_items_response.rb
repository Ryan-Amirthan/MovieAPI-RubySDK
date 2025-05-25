# frozen_string_literal: true

require_relative "list_remove_items_response_results_item"
require "ostruct"
require "json"

module TmdbApiClient
  class ListRemoveItemsResponse
    # @return [String]
    attr_reader :status_message
    # @return [Array<TmdbApiClient::ListRemoveItemsResponseResultsItem>]
    attr_reader :results
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
    # @param results [Array<TmdbApiClient::ListRemoveItemsResponseResultsItem>]
    # @param success [Boolean]
    # @param status_code [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::ListRemoveItemsResponse]
    def initialize(status_message: OMIT, results: OMIT, success: OMIT, status_code: OMIT, additional_properties: nil)
      @status_message = status_message if status_message != OMIT
      @results = results if results != OMIT
      @success = success if success != OMIT
      @status_code = status_code if status_code != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "status_message": status_message,
        "results": results,
        "success": success,
        "status_code": status_code
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListRemoveItemsResponse
    #
    # @param json_object [String]
    # @return [TmdbApiClient::ListRemoveItemsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status_message = parsed_json["status_message"]
      results = parsed_json["results"]&.map do |item|
        item = item.to_json
        TmdbApiClient::ListRemoveItemsResponseResultsItem.from_json(json_object: item)
      end
      success = parsed_json["success"]
      status_code = parsed_json["status_code"]
      new(
        status_message: status_message,
        results: results,
        success: success,
        status_code: status_code,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListRemoveItemsResponse to a JSON object
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
      obj.results&.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
    end
  end
end
