# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class AccountRatedMoviesResponseResultsItemAccountRating
    # @return [String]
    attr_reader :created_at
    # @return [Integer]
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param created_at [String]
    # @param value [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AccountRatedMoviesResponseResultsItemAccountRating]
    def initialize(created_at: OMIT, value: OMIT, additional_properties: nil)
      @created_at = created_at if created_at != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "created_at": created_at, "value": value }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  AccountRatedMoviesResponseResultsItemAccountRating
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AccountRatedMoviesResponseResultsItemAccountRating]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      created_at = parsed_json["created_at"]
      value = parsed_json["value"]
      new(
        created_at: created_at,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of AccountRatedMoviesResponseResultsItemAccountRating to a
    #  JSON object
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
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.value&.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
