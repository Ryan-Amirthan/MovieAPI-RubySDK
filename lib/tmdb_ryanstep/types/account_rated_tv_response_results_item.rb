# frozen_string_literal: true

require_relative "account_rated_tv_response_results_item_account_rating"
require "ostruct"
require "json"

module TmdbApiClient
  class AccountRatedTvResponseResultsItem
    # @return [Boolean]
    attr_reader :adult
    # @return [String]
    attr_reader :backdrop_path
    # @return [Array<Integer>]
    attr_reader :genre_ids
    # @return [Integer]
    attr_reader :id
    # @return [Array<String>]
    attr_reader :origin_country
    # @return [String]
    attr_reader :original_language
    # @return [String]
    attr_reader :original_name
    # @return [String]
    attr_reader :overview
    # @return [Float]
    attr_reader :popularity
    # @return [String]
    attr_reader :poster_path
    # @return [String]
    attr_reader :first_air_date
    # @return [String]
    attr_reader :name
    # @return [Float]
    attr_reader :vote_average
    # @return [Integer]
    attr_reader :vote_count
    # @return [TmdbApiClient::AccountRatedTvResponseResultsItemAccountRating]
    attr_reader :account_rating
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param adult [Boolean]
    # @param backdrop_path [String]
    # @param genre_ids [Array<Integer>]
    # @param id [Integer]
    # @param origin_country [Array<String>]
    # @param original_language [String]
    # @param original_name [String]
    # @param overview [String]
    # @param popularity [Float]
    # @param poster_path [String]
    # @param first_air_date [String]
    # @param name [String]
    # @param vote_average [Float]
    # @param vote_count [Integer]
    # @param account_rating [TmdbApiClient::AccountRatedTvResponseResultsItemAccountRating]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AccountRatedTvResponseResultsItem]
    def initialize(adult: OMIT, backdrop_path: OMIT, genre_ids: OMIT, id: OMIT, origin_country: OMIT,
                   original_language: OMIT, original_name: OMIT, overview: OMIT, popularity: OMIT, poster_path: OMIT, first_air_date: OMIT, name: OMIT, vote_average: OMIT, vote_count: OMIT, account_rating: OMIT, additional_properties: nil)
      @adult = adult if adult != OMIT
      @backdrop_path = backdrop_path if backdrop_path != OMIT
      @genre_ids = genre_ids if genre_ids != OMIT
      @id = id if id != OMIT
      @origin_country = origin_country if origin_country != OMIT
      @original_language = original_language if original_language != OMIT
      @original_name = original_name if original_name != OMIT
      @overview = overview if overview != OMIT
      @popularity = popularity if popularity != OMIT
      @poster_path = poster_path if poster_path != OMIT
      @first_air_date = first_air_date if first_air_date != OMIT
      @name = name if name != OMIT
      @vote_average = vote_average if vote_average != OMIT
      @vote_count = vote_count if vote_count != OMIT
      @account_rating = account_rating if account_rating != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "adult": adult,
        "backdrop_path": backdrop_path,
        "genre_ids": genre_ids,
        "id": id,
        "origin_country": origin_country,
        "original_language": original_language,
        "original_name": original_name,
        "overview": overview,
        "popularity": popularity,
        "poster_path": poster_path,
        "first_air_date": first_air_date,
        "name": name,
        "vote_average": vote_average,
        "vote_count": vote_count,
        "account_rating": account_rating
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AccountRatedTvResponseResultsItem
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AccountRatedTvResponseResultsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      adult = parsed_json["adult"]
      backdrop_path = parsed_json["backdrop_path"]
      genre_ids = parsed_json["genre_ids"]
      id = parsed_json["id"]
      origin_country = parsed_json["origin_country"]
      original_language = parsed_json["original_language"]
      original_name = parsed_json["original_name"]
      overview = parsed_json["overview"]
      popularity = parsed_json["popularity"]
      poster_path = parsed_json["poster_path"]
      first_air_date = parsed_json["first_air_date"]
      name = parsed_json["name"]
      vote_average = parsed_json["vote_average"]
      vote_count = parsed_json["vote_count"]
      if parsed_json["account_rating"].nil?
        account_rating = nil
      else
        account_rating = parsed_json["account_rating"].to_json
        account_rating = TmdbApiClient::AccountRatedTvResponseResultsItemAccountRating.from_json(json_object: account_rating)
      end
      new(
        adult: adult,
        backdrop_path: backdrop_path,
        genre_ids: genre_ids,
        id: id,
        origin_country: origin_country,
        original_language: original_language,
        original_name: original_name,
        overview: overview,
        popularity: popularity,
        poster_path: poster_path,
        first_air_date: first_air_date,
        name: name,
        vote_average: vote_average,
        vote_count: vote_count,
        account_rating: account_rating,
        additional_properties: struct
      )
    end

    # Serialize an instance of AccountRatedTvResponseResultsItem to a JSON object
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
      obj.adult&.is_a?(Boolean) != false || raise("Passed value for field obj.adult is not the expected type, validation failed.")
      obj.backdrop_path&.is_a?(String) != false || raise("Passed value for field obj.backdrop_path is not the expected type, validation failed.")
      obj.genre_ids&.is_a?(Array) != false || raise("Passed value for field obj.genre_ids is not the expected type, validation failed.")
      obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.origin_country&.is_a?(Array) != false || raise("Passed value for field obj.origin_country is not the expected type, validation failed.")
      obj.original_language&.is_a?(String) != false || raise("Passed value for field obj.original_language is not the expected type, validation failed.")
      obj.original_name&.is_a?(String) != false || raise("Passed value for field obj.original_name is not the expected type, validation failed.")
      obj.overview&.is_a?(String) != false || raise("Passed value for field obj.overview is not the expected type, validation failed.")
      obj.popularity&.is_a?(Float) != false || raise("Passed value for field obj.popularity is not the expected type, validation failed.")
      obj.poster_path&.is_a?(String) != false || raise("Passed value for field obj.poster_path is not the expected type, validation failed.")
      obj.first_air_date&.is_a?(String) != false || raise("Passed value for field obj.first_air_date is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.vote_average&.is_a?(Float) != false || raise("Passed value for field obj.vote_average is not the expected type, validation failed.")
      obj.vote_count&.is_a?(Integer) != false || raise("Passed value for field obj.vote_count is not the expected type, validation failed.")
      obj.account_rating.nil? || TmdbApiClient::AccountRatedTvResponseResultsItemAccountRating.validate_raw(obj: obj.account_rating)
    end
  end
end
