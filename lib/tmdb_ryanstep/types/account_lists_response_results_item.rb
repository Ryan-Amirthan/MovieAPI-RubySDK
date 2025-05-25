# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class AccountListsResponseResultsItem
    # @return [String]
    attr_reader :account_object_id
    # @return [Integer]
    attr_reader :adult
    # @return [Float]
    attr_reader :average_rating
    # @return [String]
    attr_reader :created_at
    # @return [String]
    attr_reader :description
    # @return [Integer]
    attr_reader :featured
    # @return [Integer]
    attr_reader :id
    # @return [String]
    attr_reader :iso_3166_1
    # @return [String]
    attr_reader :iso_639_1
    # @return [String]
    attr_reader :name
    # @return [Integer]
    attr_reader :number_of_items
    # @return [Integer]
    attr_reader :public
    # @return [String]
    attr_reader :revenue
    # @return [Integer]
    attr_reader :runtime
    # @return [Integer]
    attr_reader :sort_by
    # @return [String]
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param account_object_id [String]
    # @param adult [Integer]
    # @param average_rating [Float]
    # @param created_at [String]
    # @param description [String]
    # @param featured [Integer]
    # @param id [Integer]
    # @param iso_3166_1 [String]
    # @param iso_639_1 [String]
    # @param name [String]
    # @param number_of_items [Integer]
    # @param public [Integer]
    # @param revenue [String]
    # @param runtime [Integer]
    # @param sort_by [Integer]
    # @param updated_at [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::AccountListsResponseResultsItem]
    def initialize(account_object_id: OMIT, adult: OMIT, average_rating: OMIT, created_at: OMIT, description: OMIT,
                   featured: OMIT, id: OMIT, iso_3166_1: OMIT, iso_639_1: OMIT, name: OMIT, number_of_items: OMIT, public: OMIT, revenue: OMIT, runtime: OMIT, sort_by: OMIT, updated_at: OMIT, additional_properties: nil)
      @account_object_id = account_object_id if account_object_id != OMIT
      @adult = adult if adult != OMIT
      @average_rating = average_rating if average_rating != OMIT
      @created_at = created_at if created_at != OMIT
      @description = description if description != OMIT
      @featured = featured if featured != OMIT
      @id = id if id != OMIT
      @iso_3166_1 = iso_3166_1 if iso_3166_1 != OMIT
      @iso_639_1 = iso_639_1 if iso_639_1 != OMIT
      @name = name if name != OMIT
      @number_of_items = number_of_items if number_of_items != OMIT
      @public = public if public != OMIT
      @revenue = revenue if revenue != OMIT
      @runtime = runtime if runtime != OMIT
      @sort_by = sort_by if sort_by != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "account_object_id": account_object_id,
        "adult": adult,
        "average_rating": average_rating,
        "created_at": created_at,
        "description": description,
        "featured": featured,
        "id": id,
        "iso_3166_1": iso_3166_1,
        "iso_639_1": iso_639_1,
        "name": name,
        "number_of_items": number_of_items,
        "public": public,
        "revenue": revenue,
        "runtime": runtime,
        "sort_by": sort_by,
        "updated_at": updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AccountListsResponseResultsItem
    #
    # @param json_object [String]
    # @return [TmdbApiClient::AccountListsResponseResultsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      account_object_id = parsed_json["account_object_id"]
      adult = parsed_json["adult"]
      average_rating = parsed_json["average_rating"]
      created_at = parsed_json["created_at"]
      description = parsed_json["description"]
      featured = parsed_json["featured"]
      id = parsed_json["id"]
      iso_3166_1 = parsed_json["iso_3166_1"]
      iso_639_1 = parsed_json["iso_639_1"]
      name = parsed_json["name"]
      number_of_items = parsed_json["number_of_items"]
      public = parsed_json["public"]
      revenue = parsed_json["revenue"]
      runtime = parsed_json["runtime"]
      sort_by = parsed_json["sort_by"]
      updated_at = parsed_json["updated_at"]
      new(
        account_object_id: account_object_id,
        adult: adult,
        average_rating: average_rating,
        created_at: created_at,
        description: description,
        featured: featured,
        id: id,
        iso_3166_1: iso_3166_1,
        iso_639_1: iso_639_1,
        name: name,
        number_of_items: number_of_items,
        public: public,
        revenue: revenue,
        runtime: runtime,
        sort_by: sort_by,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of AccountListsResponseResultsItem to a JSON object
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
      obj.account_object_id&.is_a?(String) != false || raise("Passed value for field obj.account_object_id is not the expected type, validation failed.")
      obj.adult&.is_a?(Integer) != false || raise("Passed value for field obj.adult is not the expected type, validation failed.")
      obj.average_rating&.is_a?(Float) != false || raise("Passed value for field obj.average_rating is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.featured&.is_a?(Integer) != false || raise("Passed value for field obj.featured is not the expected type, validation failed.")
      obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.iso_3166_1&.is_a?(String) != false || raise("Passed value for field obj.iso_3166_1 is not the expected type, validation failed.")
      obj.iso_639_1&.is_a?(String) != false || raise("Passed value for field obj.iso_639_1 is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.number_of_items&.is_a?(Integer) != false || raise("Passed value for field obj.number_of_items is not the expected type, validation failed.")
      obj.public&.is_a?(Integer) != false || raise("Passed value for field obj.public is not the expected type, validation failed.")
      obj.revenue&.is_a?(String) != false || raise("Passed value for field obj.revenue is not the expected type, validation failed.")
      obj.runtime&.is_a?(Integer) != false || raise("Passed value for field obj.runtime is not the expected type, validation failed.")
      obj.sort_by&.is_a?(Integer) != false || raise("Passed value for field obj.sort_by is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
