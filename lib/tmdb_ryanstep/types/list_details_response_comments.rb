# frozen_string_literal: true

require "ostruct"
require "json"

module TmdbApiClient
  class ListDetailsResponseComments
    # @return [Object]
    attr_reader :movie_617127
    # @return [Object]
    attr_reader :movie_986056
    # @return [Object]
    attr_reader :movie_822119
    # @return [Object]
    attr_reader :movie_533535
    # @return [Object]
    attr_reader :movie_609681
    # @return [Object]
    attr_reader :movie_447365
    # @return [Object]
    attr_reader :movie_640146
    # @return [Object]
    attr_reader :movie_505642
    # @return [Object]
    attr_reader :movie_616037
    # @return [Object]
    attr_reader :movie_453395
    # @return [Object]
    attr_reader :movie_634649
    # @return [Object]
    attr_reader :movie_524434
    # @return [Object]
    attr_reader :movie_566525
    # @return [Object]
    attr_reader :movie_497698
    # @return [Object]
    attr_reader :movie_429617
    # @return [Object]
    attr_reader :movie_299534
    # @return [Object]
    attr_reader :movie_299537
    # @return [Object]
    attr_reader :movie_363088
    # @return [Object]
    attr_reader :movie_299536
    # @return [Object]
    attr_reader :movie_284054
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param movie_617127 [Object]
    # @param movie_986056 [Object]
    # @param movie_822119 [Object]
    # @param movie_533535 [Object]
    # @param movie_609681 [Object]
    # @param movie_447365 [Object]
    # @param movie_640146 [Object]
    # @param movie_505642 [Object]
    # @param movie_616037 [Object]
    # @param movie_453395 [Object]
    # @param movie_634649 [Object]
    # @param movie_524434 [Object]
    # @param movie_566525 [Object]
    # @param movie_497698 [Object]
    # @param movie_429617 [Object]
    # @param movie_299534 [Object]
    # @param movie_299537 [Object]
    # @param movie_363088 [Object]
    # @param movie_299536 [Object]
    # @param movie_284054 [Object]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TmdbApiClient::ListDetailsResponseComments]
    def initialize(movie_617127: OMIT, movie_986056: OMIT, movie_822119: OMIT, movie_533535: OMIT, movie_609681: OMIT,
                   movie_447365: OMIT, movie_640146: OMIT, movie_505642: OMIT, movie_616037: OMIT, movie_453395: OMIT, movie_634649: OMIT, movie_524434: OMIT, movie_566525: OMIT, movie_497698: OMIT, movie_429617: OMIT, movie_299534: OMIT, movie_299537: OMIT, movie_363088: OMIT, movie_299536: OMIT, movie_284054: OMIT, additional_properties: nil)
      @movie_617127 = movie_617127 if movie_617127 != OMIT
      @movie_986056 = movie_986056 if movie_986056 != OMIT
      @movie_822119 = movie_822119 if movie_822119 != OMIT
      @movie_533535 = movie_533535 if movie_533535 != OMIT
      @movie_609681 = movie_609681 if movie_609681 != OMIT
      @movie_447365 = movie_447365 if movie_447365 != OMIT
      @movie_640146 = movie_640146 if movie_640146 != OMIT
      @movie_505642 = movie_505642 if movie_505642 != OMIT
      @movie_616037 = movie_616037 if movie_616037 != OMIT
      @movie_453395 = movie_453395 if movie_453395 != OMIT
      @movie_634649 = movie_634649 if movie_634649 != OMIT
      @movie_524434 = movie_524434 if movie_524434 != OMIT
      @movie_566525 = movie_566525 if movie_566525 != OMIT
      @movie_497698 = movie_497698 if movie_497698 != OMIT
      @movie_429617 = movie_429617 if movie_429617 != OMIT
      @movie_299534 = movie_299534 if movie_299534 != OMIT
      @movie_299537 = movie_299537 if movie_299537 != OMIT
      @movie_363088 = movie_363088 if movie_363088 != OMIT
      @movie_299536 = movie_299536 if movie_299536 != OMIT
      @movie_284054 = movie_284054 if movie_284054 != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "movie:617127": movie_617127,
        "movie:986056": movie_986056,
        "movie:822119": movie_822119,
        "movie:533535": movie_533535,
        "movie:609681": movie_609681,
        "movie:447365": movie_447365,
        "movie:640146": movie_640146,
        "movie:505642": movie_505642,
        "movie:616037": movie_616037,
        "movie:453395": movie_453395,
        "movie:634649": movie_634649,
        "movie:524434": movie_524434,
        "movie:566525": movie_566525,
        "movie:497698": movie_497698,
        "movie:429617": movie_429617,
        "movie:299534": movie_299534,
        "movie:299537": movie_299537,
        "movie:363088": movie_363088,
        "movie:299536": movie_299536,
        "movie:284054": movie_284054
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListDetailsResponseComments
    #
    # @param json_object [String]
    # @return [TmdbApiClient::ListDetailsResponseComments]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      movie_617127 = parsed_json["movie:617127"]
      movie_986056 = parsed_json["movie:986056"]
      movie_822119 = parsed_json["movie:822119"]
      movie_533535 = parsed_json["movie:533535"]
      movie_609681 = parsed_json["movie:609681"]
      movie_447365 = parsed_json["movie:447365"]
      movie_640146 = parsed_json["movie:640146"]
      movie_505642 = parsed_json["movie:505642"]
      movie_616037 = parsed_json["movie:616037"]
      movie_453395 = parsed_json["movie:453395"]
      movie_634649 = parsed_json["movie:634649"]
      movie_524434 = parsed_json["movie:524434"]
      movie_566525 = parsed_json["movie:566525"]
      movie_497698 = parsed_json["movie:497698"]
      movie_429617 = parsed_json["movie:429617"]
      movie_299534 = parsed_json["movie:299534"]
      movie_299537 = parsed_json["movie:299537"]
      movie_363088 = parsed_json["movie:363088"]
      movie_299536 = parsed_json["movie:299536"]
      movie_284054 = parsed_json["movie:284054"]
      new(
        movie_617127: movie_617127,
        movie_986056: movie_986056,
        movie_822119: movie_822119,
        movie_533535: movie_533535,
        movie_609681: movie_609681,
        movie_447365: movie_447365,
        movie_640146: movie_640146,
        movie_505642: movie_505642,
        movie_616037: movie_616037,
        movie_453395: movie_453395,
        movie_634649: movie_634649,
        movie_524434: movie_524434,
        movie_566525: movie_566525,
        movie_497698: movie_497698,
        movie_429617: movie_429617,
        movie_299534: movie_299534,
        movie_299537: movie_299537,
        movie_363088: movie_363088,
        movie_299536: movie_299536,
        movie_284054: movie_284054,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListDetailsResponseComments to a JSON object
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
      obj.movie_617127&.is_a?(Object) != false || raise("Passed value for field obj.movie_617127 is not the expected type, validation failed.")
      obj.movie_986056&.is_a?(Object) != false || raise("Passed value for field obj.movie_986056 is not the expected type, validation failed.")
      obj.movie_822119&.is_a?(Object) != false || raise("Passed value for field obj.movie_822119 is not the expected type, validation failed.")
      obj.movie_533535&.is_a?(Object) != false || raise("Passed value for field obj.movie_533535 is not the expected type, validation failed.")
      obj.movie_609681&.is_a?(Object) != false || raise("Passed value for field obj.movie_609681 is not the expected type, validation failed.")
      obj.movie_447365&.is_a?(Object) != false || raise("Passed value for field obj.movie_447365 is not the expected type, validation failed.")
      obj.movie_640146&.is_a?(Object) != false || raise("Passed value for field obj.movie_640146 is not the expected type, validation failed.")
      obj.movie_505642&.is_a?(Object) != false || raise("Passed value for field obj.movie_505642 is not the expected type, validation failed.")
      obj.movie_616037&.is_a?(Object) != false || raise("Passed value for field obj.movie_616037 is not the expected type, validation failed.")
      obj.movie_453395&.is_a?(Object) != false || raise("Passed value for field obj.movie_453395 is not the expected type, validation failed.")
      obj.movie_634649&.is_a?(Object) != false || raise("Passed value for field obj.movie_634649 is not the expected type, validation failed.")
      obj.movie_524434&.is_a?(Object) != false || raise("Passed value for field obj.movie_524434 is not the expected type, validation failed.")
      obj.movie_566525&.is_a?(Object) != false || raise("Passed value for field obj.movie_566525 is not the expected type, validation failed.")
      obj.movie_497698&.is_a?(Object) != false || raise("Passed value for field obj.movie_497698 is not the expected type, validation failed.")
      obj.movie_429617&.is_a?(Object) != false || raise("Passed value for field obj.movie_429617 is not the expected type, validation failed.")
      obj.movie_299534&.is_a?(Object) != false || raise("Passed value for field obj.movie_299534 is not the expected type, validation failed.")
      obj.movie_299537&.is_a?(Object) != false || raise("Passed value for field obj.movie_299537 is not the expected type, validation failed.")
      obj.movie_363088&.is_a?(Object) != false || raise("Passed value for field obj.movie_363088 is not the expected type, validation failed.")
      obj.movie_299536&.is_a?(Object) != false || raise("Passed value for field obj.movie_299536 is not the expected type, validation failed.")
      obj.movie_284054&.is_a?(Object) != false || raise("Passed value for field obj.movie_284054 is not the expected type, validation failed.")
    end
  end
end
