# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class AccountMovieWatchlistResponseResultsItem
    # @return [Boolean]
    attr_reader :adult
    # @return [String]
    attr_reader :backdrop_path
    # @return [Integer]
    attr_reader :id
    # @return [String]
    attr_reader :title
    # @return [String]
    attr_reader :original_language
    # @return [String]
    attr_reader :original_title
    # @return [String]
    attr_reader :overview
    # @return [String]
    attr_reader :poster_path
    # @return [String]
    attr_reader :media_type
    # @return [Array<Integer>]
    attr_reader :genre_ids
    # @return [Float]
    attr_reader :popularity
    # @return [String]
    attr_reader :release_date
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
    # @param id [Integer]
    # @param title [String]
    # @param original_language [String]
    # @param original_title [String]
    # @param overview [String]
    # @param poster_path [String]
    # @param media_type [String]
    # @param genre_ids [Array<Integer>]
    # @param popularity [Float]
    # @param release_date [String]
    # @param video [Boolean]
    # @param vote_average [Float]
    # @param vote_count [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AccountMovieWatchlistResponseResultsItem]
    def initialize(adult: OMIT, backdrop_path: OMIT, id: OMIT, title: OMIT, original_language: OMIT,
                   original_title: OMIT, overview: OMIT, poster_path: OMIT, media_type: OMIT, genre_ids: OMIT, popularity: OMIT, release_date: OMIT, video: OMIT, vote_average: OMIT, vote_count: OMIT, additional_properties: nil)
      @adult = adult if adult != OMIT
      @backdrop_path = backdrop_path if backdrop_path != OMIT
      @id = id if id != OMIT
      @title = title if title != OMIT
      @original_language = original_language if original_language != OMIT
      @original_title = original_title if original_title != OMIT
      @overview = overview if overview != OMIT
      @poster_path = poster_path if poster_path != OMIT
      @media_type = media_type if media_type != OMIT
      @genre_ids = genre_ids if genre_ids != OMIT
      @popularity = popularity if popularity != OMIT
      @release_date = release_date if release_date != OMIT
      @video = video if video != OMIT
      @vote_average = vote_average if vote_average != OMIT
      @vote_count = vote_count if vote_count != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "adult": adult,
        "backdrop_path": backdrop_path,
        "id": id,
        "title": title,
        "original_language": original_language,
        "original_title": original_title,
        "overview": overview,
        "poster_path": poster_path,
        "media_type": media_type,
        "genre_ids": genre_ids,
        "popularity": popularity,
        "release_date": release_date,
        "video": video,
        "vote_average": vote_average,
        "vote_count": vote_count
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  AccountMovieWatchlistResponseResultsItem
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AccountMovieWatchlistResponseResultsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      adult = parsed_json["adult"]
      backdrop_path = parsed_json["backdrop_path"]
      id = parsed_json["id"]
      title = parsed_json["title"]
      original_language = parsed_json["original_language"]
      original_title = parsed_json["original_title"]
      overview = parsed_json["overview"]
      poster_path = parsed_json["poster_path"]
      media_type = parsed_json["media_type"]
      genre_ids = parsed_json["genre_ids"]
      popularity = parsed_json["popularity"]
      release_date = parsed_json["release_date"]
      video = parsed_json["video"]
      vote_average = parsed_json["vote_average"]
      vote_count = parsed_json["vote_count"]
      new(
        adult: adult,
        backdrop_path: backdrop_path,
        id: id,
        title: title,
        original_language: original_language,
        original_title: original_title,
        overview: overview,
        poster_path: poster_path,
        media_type: media_type,
        genre_ids: genre_ids,
        popularity: popularity,
        release_date: release_date,
        video: video,
        vote_average: vote_average,
        vote_count: vote_count,
        additional_properties: struct
      )
    end

    # Serialize an instance of AccountMovieWatchlistResponseResultsItem to a JSON
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
      obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.original_language&.is_a?(String) != false || raise("Passed value for field obj.original_language is not the expected type, validation failed.")
      obj.original_title&.is_a?(String) != false || raise("Passed value for field obj.original_title is not the expected type, validation failed.")
      obj.overview&.is_a?(String) != false || raise("Passed value for field obj.overview is not the expected type, validation failed.")
      obj.poster_path&.is_a?(String) != false || raise("Passed value for field obj.poster_path is not the expected type, validation failed.")
      obj.media_type&.is_a?(String) != false || raise("Passed value for field obj.media_type is not the expected type, validation failed.")
      obj.genre_ids&.is_a?(Array) != false || raise("Passed value for field obj.genre_ids is not the expected type, validation failed.")
      obj.popularity&.is_a?(Float) != false || raise("Passed value for field obj.popularity is not the expected type, validation failed.")
      obj.release_date&.is_a?(String) != false || raise("Passed value for field obj.release_date is not the expected type, validation failed.")
      obj.video&.is_a?(Boolean) != false || raise("Passed value for field obj.video is not the expected type, validation failed.")
      obj.vote_average&.is_a?(Float) != false || raise("Passed value for field obj.vote_average is not the expected type, validation failed.")
      obj.vote_count&.is_a?(Integer) != false || raise("Passed value for field obj.vote_count is not the expected type, validation failed.")
    end
  end
end
