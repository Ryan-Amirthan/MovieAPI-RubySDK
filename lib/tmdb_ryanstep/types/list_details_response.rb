# frozen_string_literal: true

require_relative "list_details_response_results_item"
require_relative "list_details_response_comments"
require_relative "list_details_response_created_by"
require_relative "list_details_response_object_ids"
require "ostruct"
require "json"

module TmdbApiClient
  class ListDetailsResponse
    # @return [Float]
    attr_reader :average_rating
    # @return [String]
    attr_reader :backdrop_path
    # @return [Array<TmdbApiClient::ListDetailsResponseResultsItem>]
    attr_reader :results
    # @return [TmdbApiClient::ListDetailsResponseComments]
    attr_reader :comments
    # @return [TmdbApiClient::ListDetailsResponseCreatedBy]
    attr_reader :created_by
    # @return [String]
    attr_reader :description
    # @return [Integer]
    attr_reader :id
    # @return [String]
    attr_reader :iso_3166_1
    # @return [String]
    attr_reader :iso_639_1
    # @return [Integer]
    attr_reader :item_count
    # @return [String]
    attr_reader :name
    # @return [TmdbApiClient::ListDetailsResponseObjectIds]
    attr_reader :object_ids
    # @return [Integer]
    attr_reader :page
    # @return [String]
    attr_reader :poster_path
    # @return [Boolean]
    attr_reader :public
    # @return [Integer]
    attr_reader :revenue
    # @return [Integer]
    attr_reader :runtime
    # @return [String]
    attr_reader :sort_by
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

    # @param average_rating [Float]
    # @param backdrop_path [String]
    # @param results [Array<TmdbApiClient::ListDetailsResponseResultsItem>]
    # @param comments [TmdbApiClient::ListDetailsResponseComments]
    # @param created_by [TmdbApiClient::ListDetailsResponseCreatedBy]
    # @param description [String]
    # @param id [Integer]
    # @param iso_3166_1 [String]
    # @param iso_639_1 [String]
    # @param item_count [Integer]
    # @param name [String]
    # @param object_ids [TmdbApiClient::ListDetailsResponseObjectIds]
    # @param page [Integer]
    # @param poster_path [String]
    # @param public [Boolean]
    # @param revenue [Integer]
    # @param runtime [Integer]
    # @param sort_by [String]
    # @param total_pages [Integer]
    # @param total_results [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::ListDetailsResponse]
    def initialize(average_rating: OMIT, backdrop_path: OMIT, results: OMIT, comments: OMIT, created_by: OMIT,
                   description: OMIT, id: OMIT, iso_3166_1: OMIT, iso_639_1: OMIT, item_count: OMIT, name: OMIT, object_ids: OMIT, page: OMIT, poster_path: OMIT, public: OMIT, revenue: OMIT, runtime: OMIT, sort_by: OMIT, total_pages: OMIT, total_results: OMIT, additional_properties: nil)
      @average_rating = average_rating if average_rating != OMIT
      @backdrop_path = backdrop_path if backdrop_path != OMIT
      @results = results if results != OMIT
      @comments = comments if comments != OMIT
      @created_by = created_by if created_by != OMIT
      @description = description if description != OMIT
      @id = id if id != OMIT
      @iso_3166_1 = iso_3166_1 if iso_3166_1 != OMIT
      @iso_639_1 = iso_639_1 if iso_639_1 != OMIT
      @item_count = item_count if item_count != OMIT
      @name = name if name != OMIT
      @object_ids = object_ids if object_ids != OMIT
      @page = page if page != OMIT
      @poster_path = poster_path if poster_path != OMIT
      @public = public if public != OMIT
      @revenue = revenue if revenue != OMIT
      @runtime = runtime if runtime != OMIT
      @sort_by = sort_by if sort_by != OMIT
      @total_pages = total_pages if total_pages != OMIT
      @total_results = total_results if total_results != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "average_rating": average_rating,
        "backdrop_path": backdrop_path,
        "results": results,
        "comments": comments,
        "created_by": created_by,
        "description": description,
        "id": id,
        "iso_3166_1": iso_3166_1,
        "iso_639_1": iso_639_1,
        "item_count": item_count,
        "name": name,
        "object_ids": object_ids,
        "page": page,
        "poster_path": poster_path,
        "public": public,
        "revenue": revenue,
        "runtime": runtime,
        "sort_by": sort_by,
        "total_pages": total_pages,
        "total_results": total_results
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListDetailsResponse
    #
    # @param json_object [String]
    # @return [TmdbApiClient::ListDetailsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      average_rating = parsed_json["average_rating"]
      backdrop_path = parsed_json["backdrop_path"]
      results = parsed_json["results"]&.map do |item|
        item = item.to_json
        TmdbApiClient::ListDetailsResponseResultsItem.from_json(json_object: item)
      end
      if parsed_json["comments"].nil?
        comments = nil
      else
        comments = parsed_json["comments"].to_json
        comments = TmdbApiClient::ListDetailsResponseComments.from_json(json_object: comments)
      end
      if parsed_json["created_by"].nil?
        created_by = nil
      else
        created_by = parsed_json["created_by"].to_json
        created_by = TmdbApiClient::ListDetailsResponseCreatedBy.from_json(json_object: created_by)
      end
      description = parsed_json["description"]
      id = parsed_json["id"]
      iso_3166_1 = parsed_json["iso_3166_1"]
      iso_639_1 = parsed_json["iso_639_1"]
      item_count = parsed_json["item_count"]
      name = parsed_json["name"]
      if parsed_json["object_ids"].nil?
        object_ids = nil
      else
        object_ids = parsed_json["object_ids"].to_json
        object_ids = TmdbApiClient::ListDetailsResponseObjectIds.from_json(json_object: object_ids)
      end
      page = parsed_json["page"]
      poster_path = parsed_json["poster_path"]
      public = parsed_json["public"]
      revenue = parsed_json["revenue"]
      runtime = parsed_json["runtime"]
      sort_by = parsed_json["sort_by"]
      total_pages = parsed_json["total_pages"]
      total_results = parsed_json["total_results"]
      new(
        average_rating: average_rating,
        backdrop_path: backdrop_path,
        results: results,
        comments: comments,
        created_by: created_by,
        description: description,
        id: id,
        iso_3166_1: iso_3166_1,
        iso_639_1: iso_639_1,
        item_count: item_count,
        name: name,
        object_ids: object_ids,
        page: page,
        poster_path: poster_path,
        public: public,
        revenue: revenue,
        runtime: runtime,
        sort_by: sort_by,
        total_pages: total_pages,
        total_results: total_results,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListDetailsResponse to a JSON object
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
      obj.average_rating&.is_a?(Float) != false || raise("Passed value for field obj.average_rating is not the expected type, validation failed.")
      obj.backdrop_path&.is_a?(String) != false || raise("Passed value for field obj.backdrop_path is not the expected type, validation failed.")
      obj.results&.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.comments.nil? || TmdbApiClient::ListDetailsResponseComments.validate_raw(obj: obj.comments)
      obj.created_by.nil? || TmdbApiClient::ListDetailsResponseCreatedBy.validate_raw(obj: obj.created_by)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.iso_3166_1&.is_a?(String) != false || raise("Passed value for field obj.iso_3166_1 is not the expected type, validation failed.")
      obj.iso_639_1&.is_a?(String) != false || raise("Passed value for field obj.iso_639_1 is not the expected type, validation failed.")
      obj.item_count&.is_a?(Integer) != false || raise("Passed value for field obj.item_count is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.object_ids.nil? || TmdbApiClient::ListDetailsResponseObjectIds.validate_raw(obj: obj.object_ids)
      obj.page&.is_a?(Integer) != false || raise("Passed value for field obj.page is not the expected type, validation failed.")
      obj.poster_path&.is_a?(String) != false || raise("Passed value for field obj.poster_path is not the expected type, validation failed.")
      obj.public&.is_a?(Boolean) != false || raise("Passed value for field obj.public is not the expected type, validation failed.")
      obj.revenue&.is_a?(Integer) != false || raise("Passed value for field obj.revenue is not the expected type, validation failed.")
      obj.runtime&.is_a?(Integer) != false || raise("Passed value for field obj.runtime is not the expected type, validation failed.")
      obj.sort_by&.is_a?(String) != false || raise("Passed value for field obj.sort_by is not the expected type, validation failed.")
      obj.total_pages&.is_a?(Integer) != false || raise("Passed value for field obj.total_pages is not the expected type, validation failed.")
      obj.total_results&.is_a?(Integer) != false || raise("Passed value for field obj.total_results is not the expected type, validation failed.")
    end
  end
end
