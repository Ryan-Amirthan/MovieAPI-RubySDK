# frozen_string_literal: true

require_relative "account_movie_watchlist_response_results_item"
require "ostruct"
require "json"

module TmdbApiClient
  class AccountMovieWatchlistResponse
    # @return [Integer]
    attr_reader :page
    # @return [Array<TmdbApiClient::AccountMovieWatchlistResponseResultsItem>]
    attr_reader :results
    # @return [Integer]
    attr_reader :total_pages
    # @return [Integer]
    attr_reader :total_results
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param page [Integer]
    # @param results [Array<TmdbApiClient::AccountMovieWatchlistResponseResultsItem>]
    # @param total_pages [Integer]
    # @param total_results [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AccountMovieWatchlistResponse]
    def initialize(page: OMIT, results: OMIT, total_pages: OMIT, total_results: OMIT, additional_properties: nil)
      @page = page if page != OMIT
      @results = results if results != OMIT
      @total_pages = total_pages if total_pages != OMIT
      @total_results = total_results if total_results != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "page": page,
        "results": results,
        "total_pages": total_pages,
        "total_results": total_results
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AccountMovieWatchlistResponse
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AccountMovieWatchlistResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      page = parsed_json["page"]
      results = parsed_json["results"]&.map do |item|
        item = item.to_json
        TmdbApiClient::AccountMovieWatchlistResponseResultsItem.from_json(json_object: item)
      end
      total_pages = parsed_json["total_pages"]
      total_results = parsed_json["total_results"]
      new(
        page: page,
        results: results,
        total_pages: total_pages,
        total_results: total_results,
        additional_properties: struct
      )
    end

    # Serialize an instance of AccountMovieWatchlistResponse to a JSON object
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
      obj.page&.is_a?(Integer) != false || raise("Passed value for field obj.page is not the expected type, validation failed.")
      obj.results&.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.total_pages&.is_a?(Integer) != false || raise("Passed value for field obj.total_pages is not the expected type, validation failed.")
      obj.total_results&.is_a?(Integer) != false || raise("Passed value for field obj.total_results is not the expected type, validation failed.")
    end
  end
end
