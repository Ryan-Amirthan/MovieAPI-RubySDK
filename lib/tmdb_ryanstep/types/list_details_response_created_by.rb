# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class ListDetailsResponseCreatedBy
    # @return [String]
    attr_reader :avatar_path
    # @return [String]
    attr_reader :gravatar_hash
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :username
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param avatar_path [String]
    # @param gravatar_hash [String]
    # @param id [String]
    # @param name [String]
    # @param username [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::ListDetailsResponseCreatedBy]
    def initialize(avatar_path: OMIT, gravatar_hash: OMIT, id: OMIT, name: OMIT, username: OMIT,
                   additional_properties: nil)
      @avatar_path = avatar_path if avatar_path != OMIT
      @gravatar_hash = gravatar_hash if gravatar_hash != OMIT
      @id = id if id != OMIT
      @name = name if name != OMIT
      @username = username if username != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "avatar_path": avatar_path,
        "gravatar_hash": gravatar_hash,
        "id": id,
        "name": name,
        "username": username
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListDetailsResponseCreatedBy
    #
    # @param json_object [String]
    # @return [TmdbApiClient::ListDetailsResponseCreatedBy]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      avatar_path = parsed_json["avatar_path"]
      gravatar_hash = parsed_json["gravatar_hash"]
      id = parsed_json["id"]
      name = parsed_json["name"]
      username = parsed_json["username"]
      new(
        avatar_path: avatar_path,
        gravatar_hash: gravatar_hash,
        id: id,
        name: name,
        username: username,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListDetailsResponseCreatedBy to a JSON object
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
      obj.avatar_path&.is_a?(String) != false || raise("Passed value for field obj.avatar_path is not the expected type, validation failed.")
      obj.gravatar_hash&.is_a?(String) != false || raise("Passed value for field obj.gravatar_hash is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.username&.is_a?(String) != false || raise("Passed value for field obj.username is not the expected type, validation failed.")
    end
  end
end
