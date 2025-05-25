# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class AccountFavoriteMoviesResponseResultsItem
    # @return [Boolean]
    attr_reader :adult
    # @return [String]
    attr_reader :backdrop_path
    # @return [Array<Integer>]
    attr_reader :genre_ids
    # @return [Integer]
    attr_reader :id
    # @return [String]
    attr_reader :original_language
    # @return [String]
    attr_reader :original_title
    # @return [String]
    attr_reader :overview
    # @return [Float]
    attr_reader :popularity
    # @return [String]
    attr_reader :poster_path
    # @return [String]
    attr_reader :release_date
    # @return [String]
    attr_reader :title
    # @return [Boolean]
    attr_reader :video
    # @return [Float]
    attr_reader :vote_average
    # @return [Integer]
    attr_reader :vote_count
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
    # @param original_language [String]
    # @param original_title [String]
    # @param overview [String]
    # @param popularity [Float]
    # @param poster_path [String]
    # @param release_date [String]
    # @param title [String]
    # @param video [Boolean]
    # @param vote_average [Float]
    # @param vote_count [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AccountFavoriteMoviesResponseResultsItem]
    def initialize(adult: OMIT, backdrop_path: OMIT, genre_ids: OMIT, id: OMIT, original_language: OMIT,
                   original_title: OMIT, overview: OMIT, popularity: OMIT, poster_path: OMIT, release_date: OMIT, title: OMIT, video: OMIT, vote_average: OMIT, vote_count: OMIT, additional_properties: nil)
      @adult = adult if adult != OMIT
      @backdrop_path = backdrop_path if backdrop_path != OMIT
      @genre_ids = genre_ids if genre_ids != OMIT
      @id = id if id != OMIT
      @original_language = original_language if original_language != OMIT
      @original_title = original_title if original_title != OMIT
      @overview = overview if overview != OMIT
      @popularity = popularity if popularity != OMIT
      @poster_path = poster_path if poster_path != OMIT
      @release_date = release_date if release_date != OMIT
      @title = title if title != OMIT
      @video = video if video != OMIT
      @vote_average = vote_average if vote_average != OMIT
      @vote_count = vote_count if vote_count != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "adult": adult,
        "backdrop_path": backdrop_path,
        "genre_ids": genre_ids,
        "id": id,
        "original_language": original_language,
        "original_title": original_title,
        "overview": overview,
        "popularity": popularity,
        "poster_path": poster_path,
        "release_date": release_date,
        "title": title,
        "video": video,
        "vote_average": vote_average,
        "vote_count": vote_count
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  AccountFavoriteMoviesResponseResultsItem
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AccountFavoriteMoviesResponseResultsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      adult = parsed_json["adult"]
      backdrop_path = parsed_json["backdrop_path"]
      genre_ids = parsed_json["genre_ids"]
      id = parsed_json["id"]
      original_language = parsed_json["original_language"]
      original_title = parsed_json["original_title"]
      overview = parsed_json["overview"]
      popularity = parsed_json["popularity"]
      poster_path = parsed_json["poster_path"]
      release_date = parsed_json["release_date"]
      title = parsed_json["title"]
      video = parsed_json["video"]
      vote_average = parsed_json["vote_average"]
      vote_count = parsed_json["vote_count"]
      new(
        adult: adult,
        backdrop_path: backdrop_path,
        genre_ids: genre_ids,
        id: id,
        original_language: original_language,
        original_title: original_title,
        overview: overview,
        popularity: popularity,
        poster_path: poster_path,
        release_date: release_date,
        title: title,
        video: video,
        vote_average: vote_average,
        vote_count: vote_count,
        additional_properties: struct
      )
    end

    # Serialize an instance of AccountFavoriteMoviesResponseResultsItem to a JSON
    #  object
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
      obj.original_language&.is_a?(String) != false || raise("Passed value for field obj.original_language is not the expected type, validation failed.")
      obj.original_title&.is_a?(String) != false || raise("Passed value for field obj.original_title is not the expected type, validation failed.")
      obj.overview&.is_a?(String) != false || raise("Passed value for field obj.overview is not the expected type, validation failed.")
      obj.popularity&.is_a?(Float) != false || raise("Passed value for field obj.popularity is not the expected type, validation failed.")
      obj.poster_path&.is_a?(String) != false || raise("Passed value for field obj.poster_path is not the expected type, validation failed.")
      obj.release_date&.is_a?(String) != false || raise("Passed value for field obj.release_date is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.video&.is_a?(Boolean) != false || raise("Passed value for field obj.video is not the expected type, validation failed.")
      obj.vote_average&.is_a?(Float) != false || raise("Passed value for field obj.vote_average is not the expected type, validation failed.")
      obj.vote_count&.is_a?(Integer) != false || raise("Passed value for field obj.vote_count is not the expected type, validation failed.")
    end
  end
end
